#!/usr/bin/env bash
BK="\e[7m"
RT="\e[0m"
echo -e "Make sure you're root before installing the tools"
sleep 5s
clear
mkdir -p ~/tools
mkdir -p ~/tools/.tmp/
mkdir -p ~/.gf
mkdir -p ~/wordlists/
mv .github/payloads/patterns/*.json ~/.gf/
cd

echo -e "${BK}                              ${RT}" | tr -d '\n' | pv -qL 4; echo -e " ${BK}INSTALLING ALL DEPENDENCIES${RT}"
sudo apt-get update > /dev/null 2>&1
sudo apt-get dist-upgrade > /dev/null 2>&1
sudo apt-get install git python3 python3-pip snapd cmake jq libpcap-dev screen build-essential clang zip unzip pv -y > /dev/null 2>&1

echo -e "- Installing go-lang"
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz > /dev/null 2>&1
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz > /dev/null 2>&1
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export GOPATH=$HOME/go'	>> ~/.bashrc			
echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bashrc	
source ~/.bashrc

echo -e "- Installing chromium"
sudo snap install chromium > /dev/null 2>&1

echo -e "${BK}                              ${RT}" | tr -d '\n' | pv -qL 4; echo -e " ${BK}DOWNLOADING ALL TOOLS FROM GITHUB${RT}"

echo -e "- Installing sublister"
cd && git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r > /dev/null 2>&1; cd ~/tools/Sublist3r; sudo pip3 install -r requirements.txt > /dev/null 2>&1

echo -e "-Installing bhedak"
cd && pip3 install bhedak > /dev/null 2>&1

echo -e "- Installing uro"
cd && pip3 install tldextract > /dev/null 2>&1
cd && pip3 install uro > /dev/null 2>&1

echo -e "- Installing anew"
go install github.com/tomnomnom/anew@latest > /dev/null 2>&1

echo -e "- Installing naabu"
go install github.com/projectdiscovery/naabu/v2/cmd/naabu@latest > /dev/null 2>&1

echo -e "- Installing gobuster"
go install github.com/OJ/gobuster/v3@latest > /dev/null 2>&1

echo -e "- Installing gf"
go install github.com/tomnomnom/gf@latest > /dev/null 2>&1

echo -e "- Installing gospider"
cd && git clone https://github.com/jaeles-project/gospider ~/tools/.tmp/ > /dev/null 2>&1; cd ~/tools/.tmp/gospider; go build . && mv gospider /usr/bin/

echo -e "- Installing aquatone"
wget -q https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip > /dev/null 2>&1; unzip aquatone_linux_amd64_1.7.0.zip > /dev/null 2>&1; mv aquatone /usr/bin/; rm -rf aquatone* LICENSE.txt README.md

echo -e "- Installing assetfinder"
go install github.com/tomnomnom/assetfinder@latest > /dev/null 2>&1

echo -e "- Installing crobat"
go install github.com/cgboal/sonarsearch/cmd/crobat@latest > /dev/null 2>&1

echo -e "- Installing gau"
go install github.com/lc/gau/v2/cmd/gau@latest > /dev/null 2>&1

echo -e "- Installing waybackurls"
go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1

echo -e "- Installing kxss"
go install github.com/Emoe/kxss@latest > /dev/null 2>&1

echo -e "- Installing qsreplace"
go install github.com/tomnomnom/qsreplace@latest > /dev/null 2>&1

echo -e "- Installing ffuf"
cd ~/tools/.tmp/ && git clone https://github.com/ffuf/ffuf > /dev/null 2>&1; cd ffuf; go install > /dev/null 2>&1

echo -e "- Installing dnsx"
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest > /dev/null 2>&1

echo -e "- Installing notify"
go install -v github.com/projectdiscovery/notify/cmd/notify@latest > /dev/null 2>&1

echo -e "- Installing dalfox"
go install github.com/hahwul/dalfox/v2@latest > /dev/null 2>&1

echo -e "- Installing crlfuzz"
cd ~/tools/.tmp/ && git clone https://github.com/dwisiswant0/crlfuzz > /dev/null 2>&1
cd crlfuzz/cmd/crlfuzz && go build .  > /dev/null 2>&1
mv crlfuzz /usr/bin

echo -e "- Installing nuclei"
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest > /dev/null 2>&1

echo -e "- Installing subfinder"
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest > /dev/null 2>&1

echo -e "- Installing httprobe"
cd ~/tools/.tmp && git clone https://github.com/tomnomnom/httprobe.git > /dev/null 2>&1
cd httprobe && go build . > /dev/null 2>&1
mv httprobe /usr/bin/

echo -e "- Installing httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest > /dev/null 2>&1

echo -e "- Installing amass"
cd ~/tools/.tmp/ && git clone https://github.com/OWASP/Amass > /dev/null 2>&1
cd Amass/cmd/amass && go build . > /dev/null 2>&1
mv amass /usr/bin/

echo -e "- Installing gobuster"
go install github.com/OJ/gobuster/v3@latest > /dev/null 2>&1

echo -e "- Installing Jeeves"
go install github.com/ferreiraklet/Jeeves@latest > /dev/null 2>&1

echo -e "${BK}                              ${RT}" | tr -d '\n' | pv -qL 4; echo -e " ${BK}DOWNLOADING ALL THE WORDLISTS${RT}"
cd ~/wordlists/
echo -e "- Downloading subdomains wordlists"
wget -q https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/DNS/deepmagic.com-prefixes-top50000.txt -O subdomains.txt > /dev/null 2>&1
echo -e "- Downloading resolvers wordlists"
wget -q https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt -O resolvers.txt > /dev/null 2>&1
echo -e "- Downloading fuzz wordlists"
wget -q https://raw.githubusercontent.com/Bo0oM/fuzz.txt/master/fuzz.txt -O fuzz.txt > /dev/null 2>&1
sleep 2s

echo -e "${BK}                              ${RT}" | tr -d '\n' | pv -qL 4; echo -e " ${BK}FINISHING UP THINGS${RT}"
rm -rf ~/tools/.tmp/ > /dev/null 2>&1
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/ > /dev/null 2>&1
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/1ndianl33t/Gf-Patterns > /dev/null 2>&1
mv ~/Gf-Patterns/*.json ~/.gf > /dev/null 2>&1
sudo cp ~/go/bin/* /usr/bin/ > /dev/null 2>&1
nuclei -update-templates > /dev/null 2>&1
sleep 2s

echo -e "PLEASE CONFIGURE NOTIFY API'S IN ${BK} ~/.config/notify/provider-config.yaml ${RT} FILE"
echo -e "THANKS FOR INSTALLING ${BK}GARUD${RT}. HAPPY HUNTING :)\nPS: If you get any bug using garud, please tweet about it and tag @R0X4R, also support me on ko-fi"
garud -h