#!/bin/bash

echo "Make sure you're root before installing the tools"
cd $HOME
sudo add-apt-repository -y ppa:longsleep/golang-backports &> /dev/null
sudo apt update &> /dev/null
sudo apt install -y amass golang-go python3-pip &> /dev/null
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir -p $HOME/go/{bin,src,pkg}
chmod +x $HOME/go/bin
echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
echo -e "\nInstalling essential tools"
mkdir -p $HOME/tools/
git clone https://github.com/aboul3la/Sublist3r.git $HOME/tools/Sublist3r &> /dev/null
pip3 install -r $HOME/tools/Sublist3r/requirements.txt &> /dev/null
wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json $HOME/tools/ &> /dev/null 
wget https://github.com/OWASP/Amass/releases/download/v3.11.1/amass_linux_amd64.zip
unzip amass_linux_amd64.zip && mv amass /usr/bin/
echo -e "\nInstalling Go-lang tools"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null
go get -u github.com/tomnomnom/waybackurls &> /dev/null
go get -u github.com/tomnomnom/gf &> /dev/null
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir ~/.gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns &> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
GO111MODULE=on go get -u -v github.com/lc/gau &> /dev/null
go get -u -v github.com/lukasikic/subzy && cd $HOME/go/src/github.com/lukasikic/subzy && go mod init && go install &> /dev/null
go get github.com/haccer/subjack &> /dev/null
go get -u github.com/tomnomnom/assetfinder &> /dev/null
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx &> /dev/null
go get github.com/Emoe/kxss &> /dev/null
go get -u github.com/tomnomnom/qsreplace &> /dev/null
go get -u github.com/ffuf/ffuf &> /dev/null
go get -u github.com/hahwul/dalfox &> /dev/null
sudo cp $HOME/go/bin/* /usr/bin/
git clone https://github.com/m4ll0k/takeover $HOME/tools/takeover
cd $HOME/tools/takeover && python3 setup.py install
echo "alias takeover.py='python3 $HOME/tools/takeover/takeover.py'" >> ~/.bashrc
pip3 install slackclient slacker
source ~/.bashrc
