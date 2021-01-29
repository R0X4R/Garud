![eagle](https://user-images.githubusercontent.com/32596297/92586656-2fe82700-f2b4-11ea-83f5-8dedbb4d9c16.png)

# Garud
An automation tool that scans sub-domains, sub-domain takeover and then filters out xss, ssti, ssrf and more injection point parameters.<br/>

![garud](https://github.com/R0X4R/Garud/blob/master/new-garud.gif?raw=true)

+ **Requirements:** Go Language, Python 2.7 or Python 3.
+ **System requirements:** Recommended to run on vps with 1VCPU and 2GB ram.
+ **Tools used - You must need to install these tools to use this script**<br/>

  + [SubFinder](https://github.com/projectdiscovery/subfinder)
  + [Sublist3r](https://github.com/aboul3la/Sublist3r)
  + [GF Patterns](https://github.com/1ndianl33t/Gf-Patterns)
  + [Get Title](https://github.com/tomnomnom/hacks/tree/master/get-title)
  + [Takeover.py](https://github.com/m4ll0k/takeover) 
  + [Gau](https://github.com/lc/gau)
  + [Subzy](https://github.com/LukaSikic/subzy)
  + [Subjack](https://github.com/haccer/subjack)
  + [Assetfinder](https://github.com/tomnomnom/assetfinder)
  + [HTTPX](https://github.com/projectdiscovery/httpx)
  + [Waybackurls](https://github.com/tomnomnom/waybackurls)
  + [Kxss](https://github.com/Emoe/kxss)
  + [QSreplace](https://github.com/tomnomnom/qsreplace)
  + [FFuF](https://github.com/ffuf/ffuf)
  + [Nuclei](https://github.com/projectdiscovery/nuclei)
  + [Dalfox](https://github.com/hahwul/dalfox)
  
+ **Installation** - Make sure you're root before installing the tool

    ```sh
    git clone https://github.com/R0X4R/Garud.git && cd Garud/ && chmod +x garud install.sh && mv garud /usr/bin/ && ./install.sh
    ```
+ **Note:**  You can simply download pre-compiled binary [file](https://github.com/R0X4R/Garud/releases/download/v1.0/garud)

+ **Usage**

    ```css
     █▀▀ ▄▀█ █▀█ █░█ █▀▄
     █▄█ █▀█ █▀▄ █▄█ █▄▀
     coded by R0X4R with <3

     Usage: -d       target you want to scan (target.com)
     Usage: -f       output directory where you want to save file (~/target-output/)
     garud -d target.com -f target-output
    ```
+ **Slack Bot**
   
   ```sh
   wget https://raw.githubusercontent.com/R0X4R/Garud/master/slack-bot.py ~/slack-bot.py
   pip3 install slackclient slacker
   ```
   Add your slack token in slack-bot.py file. <br/>
   
   ![token-test](https://github.com/R0X4R/Garud/blob/master/token-key.jpg?raw=true)
   - Slack bot tutorial: [https://www.freecodecamp.org/news/how-to-build-a-basic-slackbot-a-beginners-guide-6b40507db5c5/](https://www.freecodecamp.org/news/how-to-build-a-basic-slackbot-a-beginners-guide-6b40507db5c5/)  
   
   
### About Garud
I made this tool to automate my recon and save my time. It really give me headache always type such command and then wait to complete one command and I type other command. So I collected some of the tools which is widely used in the bugbounty field. In this script I used Assetfinder, get-titles, httprobe, subjack, subzy, sublister, gau and gf patterns and then it uses ffuf, dalfox, nuclei and kxss to find some low hanging fruits.<br/> 

The script first enumerates all the subdomains of the give target domain using assetfinder and sublister then filters all live domains from the whole subdomain list then it extarct titles of the subdomains using get-title then it scans for subdomain takeover using subjack and subzy. Then it uses gau to extract paramters of the given subdomains then it use gf patterns to filters xss, ssti, ssrf, sqli params from that given subdomains and then it scans for low hanging fruits as well. Then it'll save all the output in a text file like target-xss.txt. <br/>

![forthebadge](https://forthebadge.com/images/badges/open-source.svg) ![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)

#### Thanks to the authors of the tools used in this script.
[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@LukaSikic](https://github.com/LukaSikic) [@haccer](https://github.com/haccer) [@hahwul](https://github.com/hahwul) [@projectdiscovery](https://github.com/projectdiscovery)



**Warning:** This code was originally created for personal use, it generates a substantial amount of traffic, please use with caution.
