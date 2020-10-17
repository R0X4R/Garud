![eagle](https://user-images.githubusercontent.com/32596297/92586656-2fe82700-f2b4-11ea-83f5-8dedbb4d9c16.png)

# Garud
An automation tool that scans sub-domains, sub-domain takeover and then filters out xss, ssti, ssrf and more injection point parameters.<br/>

![garud](https://user-images.githubusercontent.com/32596297/92571372-a8dd8380-f2a0-11ea-9f2e-274dc743ace1.gif)

+ **Requirements:** Go Language, Python 2.7 or Python 3.
+ **System requirements:** Recommended to run on vps with 1VCPU and 2GB ram.
+ **Tools used - You must need to install these tools to use this script**<br/>

  + [SubFinder](https://github.com/projectdiscovery/subfinder)
  + [Findomain](https://github.com/Edu4rdSHL/findomain)
  + [Amass](https://github.com/OWASP/Amass)
  + [Assetfinder](https://github.com/tomnomnom/assetfinder)
  + [GF Patterns](https://github.com/1ndianl33t/Gf-Patterns)
  + [Gau](https://github.com/lc/gau)
  + [Subzy](https://github.com/LukaSikic/subzy)
  + [Subjack](https://github.com/haccer/subjack): save [fingerprints.json](https://github.com/haccer/subjack/blob/master/fingerprints.json) file into ~/tools/ directory.
  + [HTTPX](https://github.com/projectdiscovery/httpx)
  + [Waybackurls](https://github.com/tomnomnom/waybackurls)
  
+ **Installation**
```sh
git clone https://github.com/R0X4R/Garud.git && cd Garud/ && chmod +x garud && mv garud /usr/local/bin/
```

+ **Usage**
```sh
garud target.com <filename> <waybackurls or gau>
```

### About Garud
I made this tool to automate my recon and save my time. It really give me headache always type such command and then wait to complete one command and I type other command. So I collected some of the tools which is widely used in the bugbounty field. In this script I used Assetfinder, get-titles, httprobe, subjack, subzy, sublister, gau and gf patterns.<br/> 
The script first enumerates all the subdomains of the give target domain using assetfinder and sublister then filters all live domains from the whole subdomain list then it extarct titles of the subdomains using get-title then it scans for subdomain takeover using subjack and subzy. Then it uses gau to extract paramters of the given subdomains then it use gf patterns to filters xss, ssti, ssrf, sqli params from that given subdomains. Then it'll save all the output in a text file like target-xss.txt. <bR/>

![forthebadge](https://forthebadge.com/images/badges/open-source.svg) <a href="https://www.buymeacoffee.com/R0X4R" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a> ![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)

#### Thanks to the authors of the tools used in this script.
[@aboul3la](https://github.com/aboul3la) [@tomnomnom](https://github.com/tomnomnom) [@lc](https://github.com/lc) [@LukaSikic](https://github.com/LukaSikic) [@haccer](https://github.com/haccer)



**Warning:** This code was originally created for personal use, it generates a substantial amount of traffic, please use with caution.
