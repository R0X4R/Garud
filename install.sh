#!/bin/bash
echo "Make sure you're root before installing the tools"
sleep 2s
clear
mkdir -p ~/tools
mkdir -p ~/tools/.tmp/
mkdir -p ~/tools/payloads/
mkdir -p ~/.gf
mkdir -p ~/wordlists/
mv payloads/patterns/*.json ~/.gf/
mv payloads/lfi.txt ~/tools/payloads/
mv payloads/ssti.txt ~/tools/payloads/

echo "Installing all dependencies\n"
cd
echo -e "- Installing git"
sudo apt-get install git -y 2> /dev/null &> /dev/null
sudo apt-get install unzip -y 2> /dev/null &> /dev/null
echo -e "- Installing python"
sudo apt-get install python3 -y 2> /dev/null &> /dev/null
sudo apt-get install python3-pip -y 2> /dev/null &> /dev/null
sudo apt install -y libpcap-dev 2> /dev/null &> /dev/null
# sudo apt-get install ruby -y 2> /dev/null
# sudo apt-get install golang-go -y 2> /dev/null
echo -e "- Installing go-lang"
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz 2> /dev/null &> /dev/null
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz 2> /dev/null &> /dev/null
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc	
source ~/.bashrc
echo -e "- Installing snapd"
sudo apt install snapd -y 2> /dev/null &> /dev/null
echo -e "- Installing cmake"
sudo apt install cmake -y 2> /dev/null &> /dev/null
echo -e "- Installing jq"
sudo apt install jq -y 2> /dev/null &> /dev/null
# sudo apt-get install -y parallel
echo -e "- Installing chromium"
sudo snap install chromium 2> /dev/null &> /dev/null
sleep 2s

echo "\nInstalling python tools\n"
echo -e "- Installing sublister"
cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt 2> /dev/null &> /dev/null
echo -e "- Installing sqlmap"
cd && git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ~/tools/sqlmap/ 2> /dev/null &> /dev/null
# cd && git clone https://github.com/w9w/JSA.git ~/tools/JSA/ 2> /dev/null
echo -e "- Installing urldedupe"
cd && git clone https://github.com/ameenmaali/urldedupe.git ~/tools/.tmp/urldedupe && cd ~/tools/.tmp/urldedupe && cmake CMakeLists.txt && make && mv urldedupe /usr/bin/ 2> /dev/null &> /dev/null
echo -e "- Installing interlace"
cd && git clone https://github.com/codingo/Interlace.git ~/tools/interlace && cd ~/tools/interlace && python3 setup.py install 2> /dev/null &> /dev/null
echo -e "- Installing uro"
cd && pip3 install tldextract 2> /dev/null &> /dev/null
cd && pip3 install uro 2> /dev/null &> /dev/null

echo "\nDownloading Wordlists\n"
cd ~/wordlists/
# wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
echo -e "- Downloading dns wordlists"
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/dns-Jhaddix.txt -O dns.txt 2> /dev/null &> /dev/null
echo -e "- Downloading subdomains wordlists"
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt 2> /dev/null &> /dev/null
echo -e "- Downloading resolvers wordlists"
wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt 2> /dev/null &> /dev/null
echo -e "- Downloading fuzz wordlists"
wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt 2> /dev/null &> /dev/null
sleep 2s

echo "\nInstalling go-lang tools\n"
echo -e "- Installing anew"
go install github.com/tomnomnom/anew@latest 2> /dev/null &> /dev/null
echo -e "- Installing naabu"
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest 2> /dev/null &> /dev/null
echo -e "- Installing gobuster"
go install github.com/OJ/gobuster/v3@latest 2> /dev/null &> /dev/null
echo -e "- Installing gf"
go install github.com/tomnomnom/gf@latest 2> /dev/null &> /dev/null
echo -e "- Installing gospider"
cd && wget https://github.com/jaeles-project/gospider/releases/download/v1.1.6/gospider_v1.1.6_linux_x86_64.zip -q 2> /dev/null &> /dev/null
unzip gospider_v1.1.6_linux_x86_64.zip && cd gospider_v1.1.6_linux_x86_64 && mv gospider /usr/bin/ 2> /dev/null &> /dev/null
cd && rm -rf gospider*
echo -e "- Installing aquatone"
wget -q https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip 2> /dev/null &> /dev/null
unzip aquatone_linux_amd64_1.7.0.zip 2> /dev/null &> /dev/null
mv aquatone /usr/bin/
rm -rf LICENSE.txt README.md
echo -e "- Installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest 2> /dev/null &> /dev/null
echo -e "- Installing crobat"
go install github.com/cgboal/sonarsearch/cmd/crobat@latest 2> /dev/null &> /dev/null
# GO111MODULE=on go get -u -v github.com/lc/subjs 2> /dev/null
echo -e "- Installing gauplus"
GO111MODULE=on go get -u -v github.com/bp0lr/gauplus 2> /dev/null &> /dev/null
echo -e "- Installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest 2> /dev/null &> /dev/null
echo -e "- Installing kxss"
go install github.com/Emoe/kxss@latest 2> /dev/null &> /dev/null
echo -e "- Installing qsreplace"
go install github.com/tomnomnom/qsreplace@latest 2> /dev/null &> /dev/null
echo -e "- Installing ffuf"
cd ~/tools/.tmp/ && git clone https://github.com/ffuf/ffuf ; cd ffuf ; go install 2> /dev/null &> /dev/null
echo -e "- Installing dnsx"
cd ~/tools/.tmp/ && git clone https://github.com/projectdiscovery/dnsx.git; cd dnsx/cmd/dnsx; go install 2> /dev/null &> /dev/null
echo -e "- Installing notify"
cd ~/tools/.tmp/ && git clone https://github.com/projectdiscovery/notify.git; cd notify/cmd/notify; go build; mv notify /usr/bin/ 2> /dev/null
echo -e "- Installing dalfox"
cd ~/tools/.tmp/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install 2> /dev/null &> /dev/null
echo -e "- Installing crlfuzz"
cd ~/tools/.tmp/ && git clone https://github.com/dwisiswant0/crlfuzz && cd crlfuzz/cmd/crlfuzz && go install 2> /dev/null &> /dev/null
echo -e "- Installing nuclei"
cd ~/tools/.tmp/ && git clone https://github.com/projectdiscovery/nuclei.git && cd nuclei/v2/cmd/nuclei && go install 2> /dev/null &> /dev/null
echo -e "- Installing subfinder"
cd ~/tools/.tmp/ && git clone https://github.com/projectdiscovery/subfinder.git && cd subfinder/v2/cmd/subfinder && go install 2> /dev/null &> /dev/null
echo -e "- Installing httpx"
cd ~/tools/.tmp/ && git clone https://github.com/projectdiscovery/httpx.git && cd httpx/cmd/httpx && go install 2> /dev/null &> /dev/null
echo -e "- Installing amass"
cd ~/tools/.tmp/ && wget https://github.com/OWASP/Amass/releases/download/v3.12.3/amass_linux_i386.zip && unzip amass_linux_i386.zip && cd amass_linux_i386 && mv amass /usr/bin/ 2> /dev/null &> /dev/null
cd
sleep 3s
echo -e "\nFinishing things up"
rm -rf ~/tools/.tmp/ 2> /dev/null &> /dev/null
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/ 2> /dev/null &> /dev/null
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/1ndianl33t/Gf-Patterns 2> /dev/null &> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf 2> /dev/null &> /dev/null
sudo cp ~/go/bin/* /usr/bin/ 2> /dev/null &> /dev/null
nuclei -update-templates 2> /dev/null &> /dev/null
sleep 2s
clear
echo -e "Please configure your notify in ~/.config/notify/notify.conf file"
echo -e "Thanks for installing garud. Happy Hunting :)\nPS: If you get any bug using garud, please tweet about it and tag @R0X4R, also support me on ko-fi"
garud -h