#!/bin/bash

echo "Make sure you're root before installing the tools"
sleep 5s
clear
echo "Installing all dependencies"
cd
sudo apt-get install git
sudo apt-get install python3
sudo apt-get install python3-pip
sudo apt-get install ruby
sudo apt-get install golang-go
sudo apt install snapd
sudo snap install chromium
sleep 2s
clear
echo "Installing essential tools"
mkdir ~/tools
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt
cd ~/tools/ && wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider && cd ~/tools/ParamSpider && sudo pip3 install -r requirements.txt
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch && cd ~/tools/dirsearch && sudo pip3 install -r requirements.txt
git clone https://github.com/devanshbatham/OpenRedireX.git ~/tools/OpenRedireX && cd ~/tools/OpenRedireX && sudo pip3 install -r requirements.txt
cd
mkdir ~/wordlists/
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt
wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt
echo "Installing go-lang tools"
go get -u github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
go get github.com/hakluke/hakrawler
go get github.com/michenriksen/aquatone
go get -u github.com/tomnomnom/assetfinder
go get github.com/Emoe/kxss
go get -u github.com/tomnomnom/hacks/get-title
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/ffuf/ffuf
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify
cd ~/tools/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install
cd ~/tools/ && git clone https://github.com/dwisiswant0/crlfuzz && cd crlfuzz/cmd/crlfuzz && go build . && sudo mv crlfuzz /usr/bin/
cd
go get -u github.com/tomnomnom/anew
go get -u github.com/tomnomnom/gf
cd
mkdir ~/tools-zip/
cd ~/tools-zip/
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.2.0/nuclei_2.2.0_linux_386.tar.gz
wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.3/httpx_1.0.3_linux_386.tar.gz
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.6/subfinder_2.4.6_linux_386.tar.gz
tar -xvf subfinder_2.4.6_linux_386.tar.gz
tar -xvf httpx_1.0.3_linux_386.tar.gz
tar -xvf nuclei_2.2.0_linux_386.tar.gz
mv nuclei /usr/bin/ 
mv subfinder /usr/bin/ 
mv httpx /usr/bin/ 
cd
rm -rf ~/tools-zip/
mkdir ~/.gf
cp -r ~/go/src/github.com/tomnomnom/gf/examples ~/.gf/
echo 'source ~/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
git clone https://github.com/1ndianl33t/Gf-Patterns
mv ~/Gf-Patterns/*.json ~/.gf
sudo cp ~/go/bin/* /usr/bin/
nuclei -update-templates
wget https://raw.githubusercontent.com/R0X4R/Garud/master/slack-bot.py ~/slack-bot.py
sudo pip3 install slackclient slacker
sleep 2s
clear
echo -e "Please add your slack token in ~/slack-bot.py file"
echo -e "Please add your slack webhook in ~/.config/notify/notify.conf file"
