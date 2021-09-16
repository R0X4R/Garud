#!/bin/bash
echo "Make sure you're root before installing the tools"
sleep 5s
clear
mkdir -p ~/tools
mkdir -p ~/tools/temp/
mkdir -p ~/tools/payloads/
mkdir -p ~/.gf
mkdir -p ~/wordlists/
mv payloads/patterns/*.json ~/.gf/
mv payloads/lfi.txt ~/tools/payloads/
mv payloads/ssti.txt ~/tools/payloads/
echo "Installing all dependencies"
cd
sudo apt-get install git -y 2> /dev/null
sudo apt-get install python3 -y 2> /dev/null
sudo apt-get install python3-pip -y 2> /dev/null
sudo apt-get install ruby -y 2> /dev/null
sudo apt-get install golang-go -y 2> /dev/null
sudo apt install snapd -y 2> /dev/null
sudo apt install cmake -y 2> /dev/null
sudo apt install jq -y 2> /dev/null
sudo apt-get install -y parallel
sudo snap install chromium 2> /dev/null
sleep 2s
clear
echo "Installing python tools"
cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt 2> /dev/null
cd && git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/ 2> /dev/null
cd && git clone https://github.com/w9w/JSA.git ~/tools/JSA/ 2> /dev/null
cd && git clone https://github.com/ameenmaali/urldedupe.git ~/tools/urldedupe && cd ~/tools/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/ 2> /dev/null
cd && git clone https://github.com/codingo/Interlace.git ~/tools/interlace && cd ~/tools/interlace && python3 setup.py install 2> /dev/null
cd && pip3 install tldextract 2> /dev/null
echo "Installing Wordlists"
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt
wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt
wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt
wget https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt
sleep 2s
echo "Installing go-lang tools"
go get -u github.com/tomnomnom/anew 2> /dev/null
go install github.com/OJ/gobuster/v3@latest 2> /dev/null
go get -u github.com/tomnomnom/gf 2> /dev/null
go get github.com/michenriksen/aquatone 2> /dev/null
go get -u github.com/tomnomnom/assetfinder 2> /dev/null
go get github.com/cgboal/sonarsearch/crobat 2> /dev/null
GO111MODULE=on go get -u -v github.com/lc/subjs 2> /dev/null
GO111MODULE=on go get -u -v github.com/bp0lr/gauplus 2> /dev/null
go get github.com/tomnomnom/waybackurls 2> /dev/null
go get github.com/Emoe/kxss 2> /dev/null
go get -u github.com/tomnomnom/qsreplace 2> /dev/null
git clone https://github.com/projectdiscovery/dnsx.git; cd dnsx/cmd/dnsx; go build; mv dnsx /usr/bin/ &> /dev/null 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/notify.git; cd notify/cmd/notify; go build; mv notify /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/dwisiswant0/crlfuzz && cd crlfuzz/cmd/crlfuzz && go build . && sudo mv crlfuzz /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/nuclei.git && cd nuclei/v2/cmd/nuclei && go build && mv nuclei /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && git clone https://github.com/projectdiscovery/subfinder.git && cd subfinder/v2/cmd/subfinder && go build && mv subfinder /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.6/httpx_1.0.6_linux_386.tar.gz && tar -xvf httpx_1.0.6_linux_386.tar.gz && mv httpx /usr/bin/ 2> /dev/null
cd ~/tools/temp/ && wget https://github.com/OWASP/Amass/releases/download/v3.12.3/amass_linux_i386.zip && unzip amass_linux_i386.zip && cd amass_linux_i386 && mv amass /usr/bin/ 2> /dev/null
cd
rm -rf ~/tools/temp/
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/1ndianl33t/Gf-Patterns 2> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
sudo cp ~/go/bin/* /usr/bin/
nuclei -update-templates &> /dev/null
sleep 2s
clear
echo -e "Please add your slack webhook in ~/.config/notify/notify.conf file"
