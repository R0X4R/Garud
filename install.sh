#!/bin/sh

echo "Make sure you're root before installing the tools";
sleep 5s;
clear;
echo "[*] Installing all dependencies";
cd;
apt update;
apt-get install gpg-agent;
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list;
gpg --keyserver hkp://keys.gnupg.net --recv-key 7D8D0BF6;
gpg --fingerprint 7D8D0BF6;
gpg -a --export 7D8D0BF6 | apt-key add -;
apt update;
apt-get -y --allow-unauthenticated install kali-archive-keyring;
apt-get -y update;
apt-get -y install kali-linux-everything;
apt-get update && apt-get upgrade;
wget https://dl.google.com/go/go1.14.6.linux-amd64.tar.gz;
sudo tar -xvf go1.14.6.linux-amd64.tar.gz;
sudo mv go /usr/local;
export GOROOT=/usr/local/go;
export GOPATH=$HOME/go;
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH;
sudo apt-get install python3;
sudo apt-get install python3-pip;
sudo apt-get install ruby;
sudo apt install snapd;
sudo snap install chromium;
sleep 2s;
clear;
echo -e "\n[*] Installing essential tools"
mkdir ~/tools;
git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r && cd ~/tools/Sublist3r && sudo pip3 install -r requirements.txt;
cd ~/tools/ && wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json;
git clone https://github.com/devanshbatham/ParamSpider ~/tools/ParamSpider && cd ~/tools/ParamSpider && sudo pip3 install -r requirements.txt;
git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch && cd ~/tools/dirsearch && sudo pip3 install -r requirements.txt;
mkdir ~/wordlists/
cd ~/wordlists/ && wget https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/big.txt;
wget https://gist.githubusercontent.com/Lopseg/33106eb13372a72a31154e0bbab2d2b3/raw/a79331799a70d0ae0ea906f2b143996d85f71de5/dicc.txt;
git clone https://github.com/m4ll0k/takeover ~/tools/takeover && cd ~/tools/takeover && python3 setup.py install;
echo "alias takeover.py='python3 ~/tools/takeover/takeover.py'" >> ~/.bashrc;
echo -e "\n[*] Installing go-lang tools"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder;
go get -u github.com/tomnomnom/waybackurls;
GO111MODULE=on go get -u -v github.com/lc/gau;
go get github.com/hakluke/hakrawler;
go get -u -v github.com/lukasikic/subzy;
go get github.com/michenriksen/aquatone;
go get github.com/haccer/subjack;
go get -u github.com/tomnomnom/assetfinder;
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx;
go get github.com/Emoe/kxss;
go get -u github.com/tomnomnom/qsreplace;
go get -u github.com/ffuf/ffuf;
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei;
GO111MODULE=on go get -v github.com/projectdiscovery/notify/cmd/notify;
cd ~/tools/ && git clone https://github.com/hahwul/dalfox && cd dalfox && go install && mv dalfox /usr/bin/;
go get -u github.com/tomnomnom/anew;
go get -u github.com/tomnomnom/gf;
cd ~/tools/;
mkdir ~/.gf;
cp -r /usr/local/go/src/github.com/tomnomnom/gf/examples ~/.gf/;
echo 'source /usr/local/go/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc;
git clone https://github.com/1ndianl33t/Gf-Patterns;
mv ~/Gf-Patterns/*.json ~/.gf;
go get -u -v github.com/lukasikic/subzy && cd /usr/local/go/src/github.com/lukasikic/subzy && go mod init && go install;
sudo cp /usr/local/go/bin/* /usr/bin/;
nuclei -update-templates;
wget https://raw.githubusercontent.com/R0X4R/Garud/master/slack-bot.py ~/slack-bot.py;
sudo pip3 install slackclient slacker;
echo "
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
" >> /root/.bashrc;
sleep 2s;
clear;
echo -e "\n[*] Please add your slack token in ~/slack-bot.py file";
echo -e "\n[*] Please add your slack webhook in ~/.config/notify/notify.conf file";
source ~/.bashrc;
