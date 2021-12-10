# syntax=docker/dockerfile:1.3-labs

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM golang:1.16-alpine AS go-builder
ENV GO111MODULE=on
RUN <<eot
#!/bin/sh
  apk add --no-cache build-base libpcap-dev
  go get -v github.com/OWASP/Amass/v3/...
  go get -u github.com/tomnomnom/anew
  go get github.com/shelld3v/aquatone
  go get -u github.com/tomnomnom/assetfinder
  go install github.com/dwisiswant0/crlfuzz/cmd/crlfuzz@latest
  go get github.com/cgboal/sonarsearch/cmd/crobat
  go install github.com/hahwul/dalfox/v2@latest
  go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
  go get -u github.com/ffuf/ffuf
  go get -u -v github.com/bp0lr/gauplus
  go get -u github.com/tomnomnom/gf
  go install github.com/OJ/gobuster/v3@latest
  go get -u github.com/jaeles-project/gospider
  go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
  go get github.com/Emoe/kxss
  go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
  go install -v github.com/projectdiscovery/notify/cmd/notify@latest
  go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
  go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
  go get github.com/tomnomnom/waybackurls
  mkdir -p /opt/gf
  find pkg/mod/github.com/tomnomnom/gf* -type f -iname '*.json' -exec cp {} /opt/gf \;
  rm -f /go/bin/examples
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM alpine:latest AS py-builder
WORKDIR /opt
RUN <<eot
#!/bin/sh
  apk add --no-cache git
  git clone https://github.com/R0X4R/bhedak.git
  git clone https://github.com/codingo/Interlace.git
  git clone https://github.com/aboul3la/Sublist3r.git
  git clone https://github.com/ameenmaali/urldedupe.git
  git clone https://github.com/1ndianl33t/Gf-Patterns.git
  git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git
eot

WORKDIR /opt/bhedak
RUN chmod +x bhedak

WORKDIR /opt/Gf-Patterns
RUN rm -rf $(ls -A | grep -v '.json')

WORKDIR /opt/wordlists
RUN <<eot
#!/bin/sh
  wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
  wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
  wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
  wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
eot

WORKDIR /opt/urldedupe
RUN <<eot
#!/bin/sh
  apk add --no-cache build-base cmake
  cmake CMakeLists.txt
  make
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM rastasheep/alpine-node-chromium:12-alpine AS base

RUN <<eot
#!/bin/sh
  apk add --no-cache curl grep jq libpcap-dev python3
  ln -sf python3 /usr/bin/python
  python3 -m ensurepip
  pip3 install --upgrade --no-cache pip setuptools
  rm -f /usr/local/bin/docker-entrypoint.sh
eot

#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#

FROM base AS final
ENV HOME=/Garud
WORKDIR /Garud

COPY --from=go-builder /go/bin /usr/local/bin/
COPY --from=go-builder /opt/gf/ /root/.gf/

COPY --from=py-builder /opt/urldedupe/urldedupe /usr/local/bin/
COPY --from=py-builder /opt/bhedak/bhedak /usr/local/bin/
COPY --from=py-builder /opt/Interlace /opt/Interlace/
COPY --from=py-builder /opt/Gf-Patterns /root/.gf/
COPY --from=py-builder /opt/sqlmap $HOME/tools/sqlmap/
COPY --from=py-builder /opt/wordlists $HOME/wordlists/
COPY --from=py-builder /opt/Sublist3r $HOME/tools/Sublist3r/

COPY .github/payloads/patterns /root/.gf/
COPY .github/payloads/lfi.txt $HOME/tools/payloads/
COPY .github/payloads/ssti.txt $HOME/tools/payloads/

COPY garud /usr/bin
COPY LICENSE $HOME/

RUN <<eot
#!/bin/sh
    apk add --no-cache bash
    pip3 install --upgrade --no-cache uro tldextract
    pip3 install --no-cache -r $HOME/tools/Sublist3r/requirements.txt
    cd /opt/Interlace/ && python setup.py install
    cd && rm -rf /opt/Interlace/
eot

ENTRYPOINT [ "/usr/bin/garud", "-o", "/output" ]
