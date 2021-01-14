#!/bin/bash
# credits goes to f8al (https://github.com/f8al)

RED="\e[31m"
BOLD="\e[1m"
NORMAL="\e[0m"
GREEN="\e[92m"
YELLOW="\e[93m"

cd $HOME
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo -e "${YELLOW} Installing dependencies!"
sudo apt update &> /dev/null
sudo apt install -y  amass golang-go python3-pip &> /dev/null
echo -e "&{YELLOW} Installing rust.  Press 1 when prompted."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
echo -e "${YELLOW} configuring go workspace."
    mkdir -p $HOME/go/{bin,src,pkg}
    chmod +x $HOME/go/bin
    echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
    echo "export GOROOT=\"/usr/local/go/libexec\"" >> $HOME/.bashrc
    echo "export PATH=\"$PATH:${GOPATH}/bin:${GOROOT}/bin\"" >> $HOME/.bashrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
echo -e "${YELLOW} Installing dependencies!"
if [ ! -f "/usr/local/bin/brew" ]; then
    echo -e "${YELLOW} Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew update &> /dev/null
brew tap caffix/amass &> /dev/null
brew install golang rust amass
echo -e "${YELLOW} configuring go workspace."
mkdir -p $HOME/go/{bin,src,pkg}
chmod +x $HOME/go/bin
echo "export GOPATH=$HOME/go" >> $HOME/.zshrc
echo "export GOROOT=\"$(brew --prefix golang)/libexec\"" >> $HOME/.zshrc
echo "export PATH=\"$PATH:${GOPATH}/bin:${GOROOT}/bin\"" >> $HOME/.zshrc
fi
if [ ! -f "$HOME/tools" ]; then
echo -e "${YELLOW}   Creating tools directory in $HOME\n"
mkdir -p $HOME/tools
fi
echo -e "${YELLOW}Installing Sublist3r\n"
git clone https://github.com/aboul3la/Sublist3r.git $HOME/tools/Sublist3r &> /dev/null
echo -e "${YELLOW}Installing Sublist3r python dependencies\n"
pip3 install -r $HOME/tools/Sublist3r/requirements.txt &> /dev/null
echo -e "${YELLOW}Installing subjack fingerprints.json\n"
wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json $HOME/tools/ &> /dev/null
echo -e "${YELLOW}Installing findomain\n"    
git clone https://github.com/Edu4rdSHL/findomain.git $HOME/tools/findomain &> /dev/null
cd $HOME/tools/findomain && cargo build --release && cp $HOME/tools/findomain/target/release/findomain /usr/local/bin/
rm -r $HOME/tools/findomain
echo -e "${YELLOW}Installing Subfinder\n"
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null
echo -e "${YELLOW}Installing waybackurls\n"
go get -u github.com/tomnomnom/waybackurls &> /dev/null
echo -e "${YELLOW}Installing gf\n"
go get -u github.com/tomnomnom/gf &> /dev/null
echo -e "${YELLOW}Adding gf completion to .bashrc\n"
if [ -f "$HOME/.bashrc" ]; then
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
elif [ -f "$HOME/.zshrc" ]; then
echo -e "autoload -Uz compinit \n compinit" >> $HOME/.zshrc
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.zsh' >> $HOME/.zshrc
fi
echo -e "${YELLOW}Creating gf configs\n"
mkdir ~/.gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns &> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
echo -e "${YELLOW}Installing gua\n"
GO111MODULE=on go get -u -v github.com/lc/gau &> /dev/null
echo -e "${YELLOW}Installing subzy\n"
go get -u -v github.com/lukasikic/subzy && cd $GOPATH/src/github.com/lukasikic/subzy && go mod init && go install &> /dev/null
echo -e "${YELLOW}Installing subjack\n"
go get github.com/haccer/subjack &> /dev/null
echo -e "${YELLOW}Installing assetfinder\n"
go get -u github.com/tomnomnom/assetfinder &> /dev/null
echo -e "${YELLOW}Installing httpx\n"
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx &> /dev/null
go get github.com/Emoe/kxss
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/ffuf/ffuf
go get -u github.com/hahwul/dalfox
echo -e "${YELLOW}Installing takeover."
git clone https://github.com/m4ll0k/takeover $HOME/tools/takeover
cd $HOME/tools/takeover && python3 setup.py install
echo -e "${YELLOW}Finished installing tools ${NORMAL}\n"