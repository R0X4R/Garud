#!/bin/bash
# credits goes to f8al (https://github.com/f8al)

cd $HOME
sudo add-apt-repository -y ppa:longsleep/golang-backports &> /dev/null
sudo apt update &> /dev/null
sudo apt install -y amass golang-go python3-pip &> /dev/null
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
mkdir -p $HOME/go/{bin,src,pkg}
chmod +x $HOME/go/bin
echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
echo "export GOROOT=\"/usr/local/go/libexec\"" >> $HOME/.bashrc
echo "export PATH=\"$PATH:${GOPATH}/bin:${GOROOT}/bin\"" >> $HOME/.bashrc
mkdir -p $HOME/tools/
git clone https://github.com/aboul3la/Sublist3r.git $HOME/tools/Sublist3r &> /dev/null
pip3 install -r $HOME/tools/Sublist3r/requirements.txt &> /dev/null
wget https://raw.githubusercontent.com/haccer/subjack/master/fingerprints.json $HOME/tools/ &> /dev/null 
git clone https://github.com/Edu4rdSHL/findomain.git $HOME/tools/findomain &> /dev/null
cd $HOME/tools/findomain && cargo build --release && cp $HOME/tools/findomain/target/release/findomain /usr/local/bin/
rm -r $HOME/tools/findomain
GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &> /dev/null
go get -u github.com/tomnomnom/waybackurls &> /dev/null
go get -u github.com/tomnomnom/gf &> /dev/null
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> ~/.bashrc
mkdir ~/.gf
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns &> /dev/null
mv ~/Gf-Patterns/*.json ~/.gf
GO111MODULE=on go get -u -v github.com/lc/gau &> /dev/null
go get -u -v github.com/lukasikic/subzy && cd $GOPATH/src/github.com/lukasikic/subzy && go mod init && go install &> /dev/null
go get github.com/haccer/subjack &> /dev/null
go get -u github.com/tomnomnom/assetfinder &> /dev/null
GO111MODULE=auto go get -u -v github.com/projectdiscovery/httpx/cmd/httpx &> /dev/null
go get github.com/Emoe/kxss
go get -u github.com/tomnomnom/qsreplace
go get -u github.com/ffuf/ffuf
go get -u github.com/hahwul/dalfox
sudo cp $HOME/go/bin/* /usr/bin/
git clone https://github.com/m4ll0k/takeover $HOME/tools/takeover
cd $HOME/tools/takeover && python3 setup.py install
echo "alias takeover.py='python3 $HOME/tools/takeover/takeover.py'" >> ~/.bashrc
source ~/.bashrc
