<h1 align="center">
  <br>
  <a href="https://github.com/R0X4R/Garud/"><img src="img/garud.png" width="500px" alt="Garud"></a>
</h1>
                                                                                                                                            
<h4 align="center">An automation tool that scans sub-domains, sub-domain takeover and then filters out xss, ssti, ssrf and more injection point parameters.</h4>

<p align="center">
<a href="#"><img src="https://madewithlove.org.in/badge.svg"></a>
<a href="https://ko-fi.com/i/IK3K34SJSA"><img src="https://img.shields.io/badge/buy%20me%20a%20ko--fi%20-donate-red"></a>
<a href="https://twitter.com/R0X4R/"><img src="https://img.shields.io/badge/twitter-%40R0X4R-blue.svg"></a>
<a href="https://github.com/R0X4R/Garud/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://github.com/R0X4R/Garud/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
<a href="#"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></a>
<a href="https://github.com/R0X4R?tab=followers"><img src="https://img.shields.io/badge/github-%40R0X4R-orange"></a>
</p>

---

I made this tool to automate my recon and save my time. It really give me headache always type such command and then wait to complete one command and I type other command. So I collected some of the tools which is widely used in the bugbounty field. In this script I used Assetfinder, subfinder, amass, httpx, sublister, gauplus and gf patterns and then it uses dirsearch, dalfox, nuclei and kxss to find some low-hanging fruits.<br/> 

The script first enumerates all the subdomains of the give target domain using assetfinder, sublister, subfinder and amass then filters all live domains from the whole subdomain list then it extarct titles of the subdomains using httpx then it scans for subdomain takeover using nuclei. Then it uses gauplus to extract paramters of the given subdomains then it use gf patterns to filters xss, ssti, ssrf, sqli params from that given subdomains and then it scans for low hanging fruits as well. Then it'll save all the output in a text file like target-xss.txt. Then it will send the notifications about the scan using notify. <br/>

<p align="center">
<img src="img/map.png" alt="How garud works"">
</p>

<h3>Installation</h3>

**Requirements:** Go Language and Python 3.<br>
**System requirements:** Recommended to run on vps with 1VCPU and 2GB ram.<br>

**Tools used - You must need to install these tools to use this script**<br>

  <a href="https://github.com/projectdiscovery/subfinder">subfinder</a> •
  <a href="https://github.com/aboul3la/Sublist3r">sublist3r</a> •
  <a href="https://github.com/1ndianl33t/Gf-Patterns">gf patterns</a> •
  <a href="https://github.com/defparam/smuggler">smuggler</a> •
  <a href="https://github.com/devanshbatham/OpenRedireX">openredirex</a> •
  <a href="https://github.com/projectdiscovery/dnsx">dnsx</a> •
  <a href="https://github.com/tomnomnom/assetfinder">assetfinder</a> •
  <a href="https://github.com/projectdiscovery/httpx">httpx</a> •
  <a href="https://github.com/Emoe/kxss">kxss</a> •
  <a href="https://github.com/tomnomnom/qsreplace">qsreplace</a> •
  <a href="https://github.com/projectdiscovery/nuclei">nuclei</a> •
  <a href="https://github.com/hahwul/dalfox">dalfox</a> •
  <a href="https://github.com/tomnomnom/anew">anew</a> •
  <a href="https://github.com/projectdiscovery/notify">notify</a> •
  <a href="https://github.com/michenriksen/aquatone">aquatone</a> •
  <a href="https://github.com/ameenmaali/urldedupe">urldedupe</a> •
  <a href="https://github.com/OWASP/Amass">amass</a> •
  <a href="https://github.com/bp0lr/gauplus">gauplus</a> •
  <a href="https://github.com/dwisiswant0/crlfuzz">crlfuzz</a> •
  <a href="https://github.com/ffuf/ffuf">ffuf</a> •
  <a href="https://github.com/tomnomnom/waybackurls">waybackurls</a><br>


```bash
#Make sure you're root before installing the tool

garud:~ sudo su
garud:~ apt install git
garud:~ git clone https://github.com/R0X4R/Garud.git && cd Garud/ && chmod +x garud install.sh && mv garud /usr/bin/ && ./install.sh
```

<h3>Usage</h3>


```js 
                                                    
█▀▀ ▄▀█ █▀█ █░█ █▀▄
█▄█ █▀█ █▀▄ █▄█ █▄▀

coded by R0X4R in INDIA with <3

Example Usage:
garud [-d target.com] [-f output destination] [-t threads] [-b blind xss URL] [-x OOS domains]

FLags:
  -d        Add your target (e.g -d target.com)
  -f        Write to output folder (e.g -f results/)
  -t        Number of threads [Default: 100] (e.g. -t 300)
  -b        Add your xss server for BXSS [Default: false] (e.g. -b test.xss.ht)
  -x        Exclude out of scope domains [Default: false] (e.g. -x ~/oosdomains.txt)
                                                    
```

**Fix errors while using or installing Garud**
    
```bash
garud:~ chmod +x install.sh && ./install.sh
Error: ./install.sh : /bin/bash^M : bad interpretor: No such file or directory
                                                    
# fix
garud:~ sed -i -e 's/\r$//' install.sh
```
You can also copy the error and search on google this will make your debugging skills better ;)

<p align="center">
<img src="img/usage.gif" alt="Garud usage">
</p>

<h3>Notifications</h3>
<p align="center">
<img src="img/token-key.jpg" alt="slack token">
<br/>
<br/>
<a href="https://www.freecodecamp.org/news/how-to-build-a-basic-slackbot-a-beginners-guide-6b40507db5c5/">Slack Bot Tutorial</a> •
<a href="https://slack.com/intl/en-it/help/articles/115005265063-Incoming-webhooks-for-Slack">Slack Webhook for Notify</a> •
<a href="https://github.com/projectdiscovery/notify#config-file">Configure Notify</a>
</p>

<p align="left">
<h3>Donate</h3> 
<a href="https://ko-fi.com/i/IK3K34SJSA"><img src="https://ko-fi.com/img/githubbutton_sm.svg"></a>
</p>

### Thanks to the authors of the tools used in this script.

[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@hahwul](https://github.com/hahwul) [@projectdiscovery](https://github.com/projectdiscovery) [@maurosoria](https://github.com/maurosoria) [@shelld3v](https://github.com/shelld3v) [@devanshbatham](https://github.com/devanshbatham) [@michenriksen](https://github.com/michenriksen) [@defparam](https://github.com/defparam/) [@projectdiscovery](https://github.com/projectdiscovery) [@bp0lr](https://github.com/bp0lr/) [@ameenmaali](https://github.com/ameenmaali) [@dwisiswant0](https://github.com/dwisiswant0) [@OWASP](https://github.com/OWASP/) [@1ndianl33t](https://github.com/1ndianl33t) [@sqlmapproject](https://github.com/sqlmapproject) [@codingo](https://github.com/codingo/)


**Warning:** This code was originally created for personal use, it generates a substantial amount of traffic, please use with caution.
