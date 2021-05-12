<h1 align="center">
  <br>
  <a href="https://github.com/R0X4R/Garud/"><img src="https://github.com/R0X4R/Garud/blob/master/garud.png?raw=true" width="500px" alt="Garud"></a>
</h1>
                                                                                                                                            
<h4 align="center">An automation tool that scans sub-domains, sub-domain takeover and then filters out xss, ssti, ssrf and more injection point parameters.</h4>

<p align="center">
<a href="#"><img src="https://madewithlove.org.in/badge.svg"></a>
<a href="https://twitter.com/R0X4R"><img src="https://img.shields.io/twitter/follow/r0x4r?style=social"></a>
<a href="https://github.com/R0X4R/Garud/issues"><img src="https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
<a href="#"><img src="https://img.shields.io/badge/Made%20with-Bash-1f425f.svg"></a>
<a href="https://github.com/R0X4R?tab=followers"><img src="https://img.shields.io/github/followers/R0X4R?style=social"></a>
</p>

---

I made this tool to automate my recon and save my time. It really give me headache always type such command and then wait to complete one command and I type other command. So I collected some of the tools which is widely used in the bugbounty field. In this script I used Assetfinder, subfinder, amass, httpx, sublister, gauplus and gf patterns and then it uses dirsearch, dalfox, nuclei and kxss to find some low hanging fruits.<br/> 

The script first enumerates all the subdomains of the give target domain using assetfinder, sublister, subfinder and amass then filters all live domains from the whole subdomain list then it extarct titles of the subdomains using httpx then it scans for subdomain takeover using nuclei. Then it uses gauplus to extract paramters of the given subdomains then it use gf patterns to filters xss, ssti, ssrf, sqli params from that given subdomains and then it scans for low hanging fruits as well. Then it'll save all the output in a text file like target-xss.txt. Then it will send the notifications about the scan using notify. <br/>

<p align="center">
<img src="https://github.com/R0X4R/Garud/blob/master/map.png?raw=true" alt="Garud Map">
</p>

+ **Requirements:** Go Language and Python 3.
+ **System requirements:** Recommended to run on vps with 1VCPU and 2GB ram.
+ **Tools used - You must need to install these tools to use this script**<br/>

  + [SubFinder](https://github.com/projectdiscovery/subfinder)
  + [Sublist3r](https://github.com/aboul3la/Sublist3r)
  + [GF Patterns](https://github.com/1ndianl33t/Gf-Patterns)
  + [Smuggler](https://github.com/defparam/smuggler)
  + [OpenRedireX](https://github.com/devanshbatham/OpenRedireX)
  + [dnsx](https://github.com/projectdiscovery/dnsx)
  + [Assetfinder](https://github.com/tomnomnom/assetfinder)
  + [HTTPX](https://github.com/projectdiscovery/httpx)
  + [Kxss](https://github.com/Emoe/kxss)
  + [QSreplace](https://github.com/tomnomnom/qsreplace)
  + [Nuclei](https://github.com/projectdiscovery/nuclei)
  + [Dalfox](https://github.com/hahwul/dalfox)
  + [Dirsearch](https://github.com/maurosoria/dirsearch)
  + [ANEW](https://github.com/tomnomnom/anew)
  + [Notify](https://github.com/projectdiscovery/notify)
  + [Aquatone](https://github.com/michenriksen/aquatone)
  + [urldedupe](https://github.com/ameenmaali/urldedupe)
  + [Amass](https://github.com/OWASP/Amass)
  + [Gauplus](https://github.com/bp0lr/gauplus)
  + [crlfuzz](https://github.com/dwisiswant0/crlfuzz)
  
+ **Installation** - Make sure you're root before installing the tool

    ```sh
    git clone https://github.com/R0X4R/Garud.git && cd Garud/ && chmod +x garud install.sh && mv garud /usr/bin/ && ./install.sh
    ```

+ **Usage**

    ```css
   █▀▀ ▄▀█ █▀█ █░█ █▀▄
   █▄█ █▀█ █▀▄ █▄█ █▄▀

   coded by R0X4R with <3

   Usage: -d       target you want to scan (target.com)
   Usage: -f       output directory where you want to save file (~/target-output/)
   Usage: -x       Exclude out of scope domains (~/out-domains.txt)
   garud -d target.com -f target-output
    ```

  <p align="center">
  <img src="https://github.com/R0X4R/Garud/blob/master/garud_1.gif?raw=true">
  </p>
    
+ **Slack Bot**
   
   ```sh
   wget https://raw.githubusercontent.com/R0X4R/Garud/master/slack-bot.py ~/slack-bot.py
   pip3 install slackclient slacker
   ```
   Add your slack token in slack-bot.py file. <br/>
      
   ![token-test](https://github.com/R0X4R/Garud/blob/master/token-key.jpg?raw=true)
   - Slack bot tutorial: [https://www.freecodecamp.org/news/how-to-build-a-basic-slackbot-a-beginners-guide-6b40507db5c5/](https://www.freecodecamp.org/news/how-to-build-a-basic-slackbot-a-beginners-guide-6b40507db5c5/)
   - Slack Webhook for notify: [https://slack.com/intl/en-it/help/articles/115005265063-Incoming-webhooks-for-Slack](https://slack.com/intl/en-it/help/articles/115005265063-Incoming-webhooks-for-Slack)
   - Configure Notify: [https://github.com/projectdiscovery/notify#config-file](https://github.com/projectdiscovery/notify#config-file)

#### Thanks to the authors of the tools used in this script.
[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@hahwul](https://github.com/hahwul) [@projectdiscovery](https://github.com/projectdiscovery) [@maurosoria](https://github.com/maurosoria) [@shelld3v](https://github.com/shelld3v) [@devanshbatham](https://github.com/devanshbatham) [@michenriksen](https://github.com/michenriksen) [@defparam](https://github.com/defparam/) [@projectdiscovery](https://github.com/projectdiscovery) [@bp0lr](https://github.com/bp0lr/) [@ameenmaali](https://github.com/ameenmaali) [@dwisiswant0](https://github.com/dwisiswant0) [@OWASP](https://github.com/OWASP/) [@1ndianl33t](https://github.com/1ndianl33t)



**Warning:** This code was originally created for personal use, it generates a substantial amount of traffic, please use with caution.
