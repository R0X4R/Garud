# syntax=docker/dockerfile:1.3-labs

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM golang:1.16-alpine AS go-builder
ENV GO111MODULE=on
RUN <<eot
#!/usr/bin/env sh
## Prerequisites
  apk add --no-cache libpcap-dev
## amass
  go get -v github.com/OWASP/Amass/v3/...
## anew
  go get -u github.com/tomnomnom/anew
## aquatone
  go get github.com/shelld3v/aquatone
## assetfinder
  go get -u github.com/tomnomnom/assetfinder
## crlfuzz
  go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
## crobat
  go get github.com/cgboal/sonarsearch/cmd/crobat
## dalfox
  go install github.com/hahwul/dalfox/v2@latest
## dnsx
  go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
## ffuf
  go get -u github.com/ffuf/ffuf
## gauplus
  go get -u -v github.com/bp0lr/gauplus
## gf
  go get -u github.com/tomnomnom/gf
  mkdir -p /opt/gf
  find pkg/mod/github.com/tomnomnom/gf* -type d -iname 'examples' -exec cp -r {} /opt/gf \;
## gobuster
  go install github.com/OJ/gobuster/v3@latest
## gospider
  go get -u github.com/jaeles-project/gospider
## httpx
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
## kxss
  go get github.com/Emoe/kxss
## naabu
  go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
## notify
  go install -v github.com/projectdiscovery/notify/cmd/notify@latest
## nuclei
  go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
## page-fetch
  go get github.com/detectify/page-fetch
## qsreplace
  go install github.com/tomnomnom/qsreplace@latest
## subfinder
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
## subzy
  go install -v github.com/lukasikic/subzy@latest
## waybackurls
  go get github.com/tomnomnom/waybackurls
## Some cleanup
  rm -f /go/bin/examples
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM alpine:latest AS py-builder
WORKDIR /opt
RUN <<eot
  apk add --no-cache git
  ## Interlace
    git clone https://github.com/codingo/Interlace.git
  ## Sublist3r
    git clone https://github.com/aboul3la/Sublist3r.git
  ## sqlmap
    git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
  ## urldedupe
    git clone https://github.com/ameenmaali/urldedupe.git
  ## GF-Patterns
    git clone https://github.com/1ndianl33t/Gf-Patterns
eot

WORKDIR /opt/urldedupe
RUN <<eot
  apk add --no-cache build-base cmake
  cmake CMakeLists.txt
  make
eot

WORKDIR /opt/wordlists
RUN <<eot
wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM rastasheep/alpine-node-chromium:12-alpine AS base

RUN <<eot
  ## Dependencies
    apk add --no-cache curl grep jq libpcap-dev
  ## Install Python
    apk add --no-cache python3
    ln -sf python3 /usr/bin/python
    python3 -m ensurepip
    pip3 install --upgrade --no-cache pip setuptools
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM base AS final
ENV HOME=/Garud
WORKDIR /Garud

COPY --from=go-builder /go/bin/* /usr/local/bin
COPY --from=go-builder /opt/gf/examples/*.json /root/.gf/

COPY --from=py-builder /opt/urldedupe/urldedupe /usr/local/bin
COPY --from=py-builder /opt/Interlace $HOME/tools/Interlace
COPY --from=py-builder /opt/Sublist3r $HOME/tools/Sublist3r
COPY --from=py-builder /opt/sqlmap $HOME/tools/sqlmap
COPY --from=py-builder /opt/Gf-Patterns/*.json /root/.gf/
COPY --from=py-builder /opt/wordlists $HOME/wordlists

COPY payloads/lfi.txt $HOME/tools/payloads/
COPY payloads/ssti.txt $HOME/tools/payloads/
COPY payloads/patterns/*.json /root/.gf
COPY LICENSE $HOME
COPY garud /usr/local/bin

RUN <<eot
  ## bash
    apk add --no-cache bash
  ## Sublist3r
    pip3 install --no-cache -r ~/tools/Sublist3r/requirements.txt
  ## Uro
    pip3 install --upgrade --no-cache uro tldextract
  ## nuclei templates
    nuclei -update-templates
eot

ENTRYPOINT [ "/usr/local/bin/garud", "-o", "/output" ]
