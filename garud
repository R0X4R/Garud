#!/usr/bin/env bash
# coded by R0X4R
# Garud - version 4.0
# Contributers: KathanP19 (https://github.com/KathanP19), frost19k (https://github.com/frost19k), f8al (https://github.com/f8al), theamanrawat (https://github.com/theamanrawat), remonsec (https://github.com/remonsec), simrotion13 (https://github.com/simrotion13)

#@> CHECK CONNECTION
wget -q --spider http://google.com
if [ $? -ne 0 ];then
    echo "Connect to internet before running Garud!"
    exit 127
fi

#@> VARIABLES
DM=
EC=
SL=False
JO=False
RO=False
VR="Garud v4.0"
PR="21,22,80,81,280,300,443,583,591,593,832,981,1010,1099,1311,2082,2087,2095,2096,2480,3000,3128,3333,4243,4444,4445,4567,4711,4712,4993,5000,5104,5108,5280,5281,5601,5800,6543,7000,7001,7002,7396,7474,8000,8001,8008,8009,8014,8042,8060,8069,8080,8081,8083,8088,8090,8091,8095,8118,8123,8172,8181,8222,8243,8280,8281,8333,8337,8443,8500,8530,8531,8834,8880,8887,8888,8983,9000,9001,9043,9060,9080,9090,9091,9092,9200,9443,9502,9800,9981,10000,10250,10443,11371,12043,12046,12443,15672,16080,17778,18091,18092,20720,28017,32000,55440,55672"

#@> COLORS
BK="\e[7m"
RT="\e[0m"
YW="\e[93m"
GR="\e[32m"

#@> PRINT USAGE
PRINT_USAGE(){
    echo -e ""
    echo -e "${YW}
\t\t█▀▀▀ █▀▀█ █▀▀█ █░░█ █▀▀▄
\t\t█░▀█ █▄▄█ █▄▄▀ █░░█ █░░█
\t\t▀▀▀▀ ▀░░▀ ▀░▀▀ ░▀▀▀ ▀▀▀░
${RT}"
    echo -e "[${YW}GARUD${RT}] == A RECONNAISSANCE SUITE FOR BUG BOUNTY (${BK}@R0X4R${RT})"
    echo -e ""
    echo -e "Example Usage:"
    echo -e "garud [-d target.tld] [-x exclude domains] [--json] [-s]"
    echo -e ""
    echo -e "Flags:"
    echo -e "   -d, --domain                 ${BK}string${RT}     Add your target                         -d target.tld"
    echo -e "   -x, --exclude                ${BK}string${RT}     Exclude out of scope domains            -x /home/dommains.list"
    echo -e ""
    echo -e "${BK}Optional Flags: ${RT}"
    echo -e "   -s, --silent                            Hide output in the terminal             ${GR}Default: ${BK}False${RT}"
    echo -e "   -j, --json                              Store output in a single json file      ${GR}Default: ${BK}False${RT}"
    echo -e "   -v, --version                           Print current version of Garud"
    exit 0
}

#@> ARGUMENTS
while [ -n "$1" ]; do
    case $1 in
            -d|--domain)
                DM=$2
                shift ;;

            -h|--help)
                PRINT_USAGE
                shift ;;

            -j|--json)
                JO='true'
                ;;

            -s|--silent)
                SL='true'
                ;;

            -x|--exclude)
                EC=$2
                shift ;;

            -v|--version)
                echo -e "$VR"
                exit 0 ;;

            *)
                PRINT_USAGE
    esac
    shift
done


#@> INITIAL CONFIGS
if [ -z "$DM" ]; then
    echo -e "\n${BK}ERROR${RT} - TARGET NOT SUPPLIED."
    PRINT_USAGE
fi

if [ "$RO" == "true" ]; then
    JO='true'
fi

#@> DOCKER
if [ -z "$CHROME_BIN" ]; then
    CHROME_BIN="/snap/bin/chromium"
fi

#@> EXIT FUNCTION
trap ctrl_c INT
ctrl_c(){
    echo -e ""
    echo -e "${YW} [!] ${RT} KEYBOARD INTERRUPTION, ${GR}EXITING GARUD${RT}..."
    exit 127
}

#@> BANNER
INFOM(){
    clear
    echo -e ""
    echo -e "${YW}
\t\t█▀▀▀ █▀▀█ █▀▀█ █░░█ █▀▀▄
\t\t█░▀█ █▄▄█ █▄▄▀ █░░█ █░░█
\t\t▀▀▀▀ ▀░░▀ ▀░▀▀ ░▀▀▀ ▀▀▀░
${RT}"
    echo -e "[${YW}GARUD${RT}] == A RECONNAISSANCE SUITE FOR BUG BOUNTY (${BK}@R0X4R${RT})"
    OT=$(echo -e "$(echo $DM | sed -e 's/\.[a-z]*$//')_$(date +"%Y_%M_%d-%H_%M_%S")")
    mkdir -p $OT 2> /dev/null
    cd $OT
    echo -e ""
    echo -e "${BK}DOMAIN> ${RT}" | tr -d "\n"; echo -e " $DM" | pv -qL 6
    echo -e "${BK}OUTPUT> ${RT}" | tr -d "\n"; echo -e " $(pwd | sed 's/\// < /g' | cut -c 4-)" | pv -qL 6
    echo -e "[GARUD] - Scanning started on $DM at $(date)" | notify -silent
}

#@> MAKE FOLDERS
MAKDR(){
    mkdir -p .tmp
    mkdir -p database
    mkdir -p database/.gf
    mkdir -p database/dirs
    mkdir -p vulns
    [ "$JO" == "False" ] || mkdir -p .json
}

#@> SUBDOMAIN ENUMERATION
SUBD_PASV(){
    curl -s "https://crt.sh/?q=%25.$DM&output=json" | jq -r '.[].name_value' 2>/dev/null | sed 's/\*\.//g' | sort -u | grep -o "\w.*$DM" | anew -q .tmp/cert.list
    curl -s "https://api.hackertarget.com/hostsearch/?q=$DM" | grep -o "\w.*$DM" | anew -q .tmp/htarget.list
    curl -s "https://riddler.io/search/exportcsv?q=pld:$DM" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | grep -o "\w.*$DM" | anew -q .tmp/riddler.list
    assetfinder --subs-only $DM | anew -q .tmp/assetfinder.list
    python3 ~/tools/Sublist3r/sublist3r.py -d $DM -o .tmp/sublister.list &> /dev/null
    subfinder -silent -d $DM -all -t 100 -o .tmp/subfinder.list &> /dev/null
    amass enum -passive -d $DM -o .tmp/amass.list &> /dev/null
    crobat -s $DM | anew -q .tmp/crobat.list
}

SUBD_ACTV(){
    timeout 50m ffuf -u http://FUZZ.$DM/ -t 100 -p '1.0-2.0' -w ~/wordlists/subdomains.txt -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -mc 200 -r -o .tmp/ffuf.json -s 2> /dev/null &> /dev/null
    timeout 50m gobuster dns -d $DM --no-error -z -q -t 100 -w ~/wordlists/subdomains.txt 2> /dev/null | sed 's/Found: //g' | anew -q .tmp/gobuster.list
    timeout 50m amass enum -active -brute -w ~/wordlists/subdomains.txt -d $DM -o .tmp/amassact.list &> /dev/null
    cat .tmp/ffuf.json 2> /dev/null | jq -r '.results[] | .host' 2> /dev/null | anew -q .tmp/ffuf.list && rm -rf .tmp/ffuf.json
}

SUBD_SCND(){
    cat .tmp/*.list | grep -v "*" | sed '/@\|<BR>\|\_\|*/d' | grep "$DM" | anew -q .tmp/domains
    xargs -a .tmp/domains -P 50 -I % bash -c "assetfinder --subs-only % | anew -q .tmp/seconddomains.list" 2> /dev/null; timeout 30m xargs -a .tmp/domains -P 10 -I % bash -c "amass enum -passive -d %" 2> /dev/null | anew -q .tmp/seconddomains.list
}

SUBD_CHCK(){
    #@> FILTERING DOMAINS
    if [ -f "$EC" ]; then
        cat .tmp/*.list | grep -v "*" | grep -vf $EC | sort -u | sed '/@\|<BR>\|\_\|*/d' | dnsx -a -aaaa -cname -ns -ptr -mx -soa -retry 3 -r ~/wordlists/resolvers.txt -t 10 -silent | anew -q database/subdomains.txt
    else
        cat .tmp/*.list | grep -v "*" | sort -u | sed '/@\|<BR>\|\_\|*/d' | dnsx -a -aaaa -cname -ns -ptr -mx -soa -retry 3 -r ~/wordlists/resolvers.txt -t 10 -silent | anew -q database/subdomains.txt
    fi

    #@> WEB PROBING AND SCREENSHOT
    naabu -retries 3 -r ~/wordlists/resolvers.txt -l database/subdomains.txt -p "$PR" -silent -no-color 2> /dev/null | anew -q database/ports.txt
    cat database/ports.txt | httprobe -prefer-https | anew -q database/lives.txt
    xargs -a database/lives.txt -P 50 -I % bash -c "echo % | aquatone -chrome-path $CHROME_BIN -out database/screenshots/ -threads 10 -silent" 2> /dev/null &> /dev/null
    [ "$JO" == "False" ] || cat database/lives.txt | python3 -c "import sys; import json; print (json.dumps({'liveurls':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/liveurls.json &> /dev/null
    [ "$JO" == "False" ] || cat database/subdomains.txt | python3 -c "import sys; import json; print (json.dumps({'subdomains':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/subdomains.json &> /dev/null
    [ "$JO" == "False" ] || cat database/ports.txt | python3 -c "import sys; import json; print (json.dumps({'ports':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/ports.json &> /dev/null
}

SUBD_SCAN(){
    echo -e ""
    echo -e "${BK}        ${RT}" | tr -d '\n' | pv -qL 4; echo -e " STARTING SUBDOMAIN SCANNING ON ${BK}$DM${RT} (${YW}it may take time${RT})"
    SUBD_PASV
    SUBD_ACTV
    SUBD_SCND
    SUBD_CHCK
    [ "$SL" == "False" ] && cat database/lives.txt 2> /dev/null
    echo -e "Subdomain enumeration completed, total [Subdomains:$(cat database/subdomains.txt | wc -l)  Activeurls:$(cat database/lives.txt | wc -l)] found" | notify -silent &> /dev/null
}

#@> WEB CRAWLING AND FILTERING
WEBC_RAWL(){
    echo -e "${BK}        ${RT}" | tr -d '\n' | pv -qL 6; echo -e " STARTING WEBCRAWLING ON ${BK}$DM${RT} (${YW}it may take time${RT})"
    agnee -d $DM -q -o database/dorks.txt -p 4
    timeout 50m gospider -S database/lives.txt -d 10 -c 20 -t 50 -K 3 --no-redirect --js -a -w --blacklist ".(eot|jpg|jpeg|gif|css|tif|tiff|png|ttf|otf|woff|woff2|ico|svg|txt)" --include-subs -q -o .tmp/gospider 2> /dev/null | anew -q .tmp/gospider.list
    xargs -a database/lives.txt -P 50 -I % bash -c "echo % | waybackurls" 2> /dev/null | anew -q .tmp/waybackurls.list
    xargs -a database/lives.txt -P 50 -I % bash -c "echo % | gau --blacklist eot,jpg,jpeg,gif,css,tif,tiff,png,ttf,otf,woff,woff2,ico,svg,txt --retries 3 --threads 50" 2> /dev/null | anew -q .tmp/gau.list 2> /dev/null &> /dev/null
    cat .tmp/gospider.list .tmp/gau.list .tmp/waybackurls.list 2> /dev/null | sed '/\[/d' | grep $DM | sort -u | uro | anew -q database/urls.txt # <-- Filtering duplicate and common endpoints
    [ "$JO" == "False" ] || cat database/urls.txt | python3 -c "import sys; import json; print (json.dumps({'endpoints':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/urls.json &> /dev/null

    #@> FILTERING ENDPOINTS USING PATTERNS
    gf xss database/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q database/.gf/xss.list
    gf lfi database/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q database/.gf/lfi.list
    gf rce database/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q database/.gf/rce.list
    gf ssrf database/urls.txt | sed "s/'\|(\|)//g" | bhedak "http://169.254.169.254/latest/meta-data/hostname" 2> /dev/null | anew -q database/.gf/ssrf.list
    gf ssti database/urls.txt | sed "s/'\|(\|)//g" | bhedak "FUZZ" 2> /dev/null | anew -q database/.gf/ssti.list
    gf sqli database/urls.txt | sed "s/'\|(\|)//g" | bhedak "(select(0)from(select(sleep(5)))v)" 2> /dev/null | anew -q database/.gf/sqli.list
    gf redirect database/urls.txt | sed "s/'\|(\|)//g" | bhedak "http://www.evil.com/" 2> /dev/null | anew -q database/.gf/redirect.list

    xargs -a database/.gf/xss.list -P 30 -I % bash -c "echo % | kxss" 2> /dev/null | grep "< >\|\"" | awk '{print $2}' | anew -q .tmp/xssp.list
    cat .tmp/xssp.list 2> /dev/null | bhedak "\">/><svg/onload=confirm(document.domain)>" 2> /dev/null | anew -q .tmp/xss.txt
}

#@> NUCLEI SCAN
NUCL_SCAN(){
    echo -e "${BK}        ${RT}" | tr -d '\n' | pv -qL 6; echo -e " STARTING NUCLEI VULNERABILITY SCANNING ON ${BK}$DM${RT} (${YW}it may take time${RT})"
    nuclei -update-templates 2> /dev/null &> /dev/null
    xargs -a database/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s info -c 10 -silent" 2> /dev/null | anew -q vulns/nuclei.txt
    xargs -a database/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s low -c 10 -silent" 2> /dev/null | anew vulns/nuclei.txt | notify -silent &> /dev/null
    xargs -a database/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s medium -c 10 -silent" 2> /dev/null | anew vulns/nuclei.txt | notify -silent &> /dev/null
    xargs -a database/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s high -c 10 -silent" 2> /dev/null | anew vulns/nuclei.txt | notify -silent &> /dev/null
    xargs -a database/lives.txt -P 50 -I % bash -c "nuclei -target % -t ~/nuclei-templates/ -nc -s critical -c 10 -silent" 2> /dev/null | anew vulns/nuclei.txt | notify -silent &> /dev/null
    [ "$JO" == "False" ] || cat vulns/nuclei.txt | python3 -c "import sys; import json; print (json.dumps({'nuclei_info':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/nuclei.json &> /dev/null
    [ "$SL" == "False" ] && cat vulns/nuclei.txt
}

#@> VULNERABILITY SCANNING
VULN_SCAN(){
    echo -e "${BK}        ${RT}" | tr -d '\n' | pv -qL 6; echo -e " STARTING INJECTION VULNERABILITY SCANNING ON ${BK}$DM${RT} (${YW}it may take time${RT})"

    crlfuzz -l database/lives.txt -c 50 -s | anew vulns/crlf.txt | notify -silent &> /dev/null
    [ "$SL" == "False" ] && cat vulns/crlf.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/crlf.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_crlf':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/crlf.json &> /dev/null

    cat database/urls.txt | cut -d"?" -f1 | cut -d"=" -f1 | grep -iaE "([^.]+)\.zip$|([^.]+)\.zip\.[0-9]+$|([^.]+)\.zip[0-9]+$|([^.]+)\.zip[a-z][A-Z][0-9]+$|([^.]+)\.zip\.[a-z][A-Z][0-9]+$|([^.]+)\.rar$|([^.]+)\.tar$|([^.]+)\.tar\.gz$|([^.]+)\.tgz$|([^.]+)\.sql$|([^.]+)\.db$|([^.]+)\.sqlite$|([^.]+)\.pgsql\.txt$|([^.]+)\.mysql\.txt$|([^.]+)\.gz$|([^.]+)\.config$|([^.]+)\.log$|([^.]+)\.bak$|([^.]+)\.backup$|([^.]+)\.bkp$|([^.]+)\.crt$|([^.]+)\.dat$|([^.]+)\.eml$|([^.]+)\.java$|([^.]+)\.lst$|([^.]+)\.key$|([^.]+)\.passwd$|([^.]+)\.pl$|([^.]+)\.pwd$|([^.]+)\.mysql-connect$|([^.]+)\.jar$|([^.]+)\.cfg$|([^.]+)\.dir$|([^.]+)\.orig$|([^.]+)\.bz2$|([^.]+)\.old$|([^.]+)\.vbs$|([^.]+)\.img$|([^.]+)\.inf$|([^.]+)\.sh$|([^.]+)\.py$|([^.]+)\.vbproj$|([^.]+)\.mysql-pconnect$|([^.]+)\.war$|([^.]+)\.go$|([^.]+)\.psql$|([^.]+)\.sql\.gz$|([^.]+)\.vb$|([^.]+)\.webinfo$|([^.]+)\.jnlp$|([^.]+)\.cgi$|([^.]+)\.tmp$|([^.]+)\.ini$|([^.]+)\.webproj$|([^.]+)\.xsql$|([^.]+)\.raw$|([^.]+)\.inc$|([^.]+)\.lck$|([^.]+)\.nz$|([^.]+)\.rc$|([^.]+)\.html\.gz$|([^.]+)\.gz$|([^.]+)\.env$|([^.]+)\.yml$" | httpx -silent -follow-host-redirects | anew -q vulns/files.txt &> /dev/null
    [ "$JO" == "False" ] || cat vulns/files.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'sensitive':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/files.json &> /dev/null

    xargs -a .tmp/xss.txt -P 50 -I % bash -c "curl -s -L -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"<svg/onload=confirm(document.domain)>\" && echo -e \"[POTENTIAL XSS] - % \n \"" 2> /dev/null | grep "POTENTIAL XSS" | anew vulns/xss.txt | notify -silent &> /dev/null
    [ "$SL" == "False" ] && cat vulns/xss.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/xss.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_xss':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/xss.json &> /dev/null

    xargs -a database/.gf/ssrf.list -P 50 -I % bash -c "curl -ks -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"compute.internal\" && echo -e \"[POTENTIAL SSRF] - % \n \"" 2> /dev/null | grep "POTENTIAL SSRF" | anew vulns/ssrf.txt | notify -silent &> /dev/null
    [ "$SL" == "False" ] && cat vulns/ssrf.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/ssrf.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_ssrf':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/ssrf.json &> /dev/null

    xargs -a database/.gf/redirect.list -P 50 -I % bash -c "curl -s -iL -H \"X-Bugbounty: Testing\" -H \"User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36\" --insecure '%' | grep \"Evil.Com - We get it...Daily\" && echo -e \"[POTENTIAL REDIRECT] - % \n \"" 2> /dev/null | grep "POTENTIAL REDIRECT" | anew vulns/redirect.txt | notify -silent &> /dev/null
    [ "$SL" == "False" ] && cat vulns/redirect.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/redirect.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_redirect':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/redirect.json &> /dev/null

    timeout 50m xargs -a database/.gf/sqli.list -P 50 -I % bash -c "echo % | jeeves --payload-time 5" | grep "Vulnerable To" | anew vulns/sqli.txt | notify -silent 2> /dev/null &> /dev/null
    [ "$SL" == "False" ] && cat vulns/sqli.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/sqli.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'vuln_redirect':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/redirect.json &> /dev/null

    dalfox file .tmp/xssp.list --silence --no-color --waf-evasion --no-spinner --mass --mass-worker 100 --skip-bav -w 100 -H "X-Bugbounty: Testing" -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" 2> /dev/null | anew vulns/dalfoxss.txt | notify -silent &> /dev/null
    [ "$SL" == "False" ] && cat vulns/dalfoxss.txt 2> /dev/null
    [ "$JO" == "False" ] || cat vulns/dalfoxss.txt 2> /dev/null | python3 -c "import sys; import json; print (json.dumps({'dalfox':list(sys.stdin)}))" | sed 's/\\n//g' | tee .json/dalfox.json &> /dev/null

    [ "$JO" == "False" ] || cat .json/*.json | jq -s 'add' 2> /dev/null | tee output.json &> /dev/null
}

#@> DIRECTORY FUZZING
FUZZ_DIRS(){
    echo -e "${BK}        ${RT}" | tr -d '\n' | pv -qL 6; echo -e " STARTING DIRECTORY FUZZING ON ${BK}$DM${RT} (${YW}it may take time${RT})"
    for target in $(cat database/lives.txt); do
        fuzzout=$(echo $target | awk -F// '{print $NF}' | sed -E 's/[\.|:]+/_/g')
        ffuf -u $target/FUZZ -ac -t 100 -mc 200 -sf -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.77 Safari/537.36" -w ~/wordlists/fuzz.txt -p '0.6-1.2' -e .html,.json,.php,.asp,.aspx,.log,.sql,.txt,.asp,.jsp,.bak,~,.db -maxtime 900 -o database/dirs/$fuzzout.json -s 2> /dev/null &> /dev/null
        cat database/dirs/$fuzzout.json | jq -r '.results[] | .status, .length, .url' 2> /dev/null | xargs -n3 | anew -q database/dirs/$fuzzout.txt
        rm -rf database/dirs/$fuzzout.json
    done
}

#@> SENDING FINAL NOTIFICATION
SEND_NOTE(){
    echo -e ""
    echo -e "${BK} SCANNING COMPLETED SUCCESSFULLY ON $DM ${RT}"
    echo -e "[GARUD] - Scanning completed on $DM at $(date)" | notify -silent
}

VAULT(){
    SUBD_SCAN 2> /dev/null
    WEBC_RAWL 2> /dev/null
    NUCL_SCAN 2> /dev/null
    VULN_SCAN 2> /dev/null
    FUZZ_DIRS 2> /dev/null
    SEND_NOTE 2> /dev/null
}

while true
do
    INFOM
    MAKDR
    VAULT
    exit
done