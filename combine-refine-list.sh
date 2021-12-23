#!/bin/sh
#!/bin/bash
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>combine-refine-list.log 2>&1
# Everything below will go to the file 'log.out':

rm /docker/combine-host2
mkdir /docker/combine-host2
cd /docker/combine-host2

#######################################################
# || section
wget -o filter1.txt https://abp.oisd.nl/
rm filter1.txt
mv index.html filter1.txt

wget -o filter2.txt https://filters.adavoid.org/filters/NoCoin.txt
rm filter2.txt
mv NoCoin.txt filter2.txt

wget -o filter3.txt https://filters.adavoid.org/filters/Spam404.txt
rm filter3.txt
mv Spam404.txt filter3.txt

wget -o filter4.txt https://filters.adavoid.org/ultimate-security-filter.txt
rm filter4.txt
mv ultimate-security-filter.txt filter4.txt

wget -o filter5.txt https://raw.githubusercontent.com/durablenapkin/scamblocklist/master/adguard.txt
rm filter5.txt
mv adguard.txt filter5.txt

wget -o filter6.txt https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt
rm filter6.txt
mv nocoin.txt filter6.txt

wget -o filter7.txt https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV-AGH.txt
rm filter7.txt
mv SmartTV-AGH.txt filter7.txt

wget -o filter8.txt https://raw.githubusercontent.com/DandelionSprout/adfilt/master/NorwegianExperimentalList%20alternate%20versions/NordicFiltersAdGuardHome.txt
rm filter8.txt
mv NordicFiltersAdGuardHome.txt filter8.txt

wget -o filter9.txt https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
rm filter9.txt
mv filter.txt filter9.txt

cat filter1.txt filter2.txt filter3.txt filter4.txt filter5.txt filter6.txt filter7.txt filter8.txt filter9.txt > combine-section0.txt

sort -u combine-section0.txt | uniq -i > combine-section-sort0.txt

# deletes 2 words || and www
sed -e s/'www.'//g combine-section-sort0.txt > combine-section-sort0-step2.txt

sort -u combine-section-sort0-step2.txt | uniq -i > combine-section-sort0-step3.txt

cp combine-section-sort0-step3.txt /docker/host-file/home0.txt

############################################################################################################

# 0.0.0.0 section
wget -o filter101.txt https://www.github.developerdan.com/hosts/lists/amp-hosts-extended.txt
rm filter101.txt
mv amp-hosts-extended.txt filter101.txt

wget -o filter102.txt https://www.github.developerdan.com/hosts/lists/tracking-aggressive-extended.txt
rm filter102.txt
mv tracking-aggressive-extended.txt filter102.txt
wget -o filter103.txt https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt
rm filter103.txt
mv ads-and-tracking-extended.txt filter103.txt
wget -o filter104.txt https://blocklistproject.github.io/Lists/ads.txt
rm filter104.txt
mv ads.txt filter104.txt
wget -o filter105.txt https://blocklistproject.github.io/Lists/crypto.txt
rm filter105.txt
mv crypto.txt filter105.txt
wget -o filter106.txt https://blocklistproject.github.io/Lists/fraud.txt
rm filter106.txt
mv fraud.txt filter106.txt
wget -o filter107.txt https://blocklistproject.github.io/Lists/malware.txt
rm filter107.txt
mv malware.txt filter107.txt
wget -o filter108.txt https://blocklistproject.github.io/Lists/phishing.txt
rm filter108.txt
mv phishing.txt filter108.txt
wget -o filter109.txt https://blocklistproject.github.io/Lists/ransomware.txt
rm filter109.txt
mv ransomware.txt filter109.txt
wget -o filter110.txt https://blocklistproject.github.io/Lists/redirect.txt
rm filter110.txt
mv redirect.txt filter110.txt
wget -o filter111.txt https://blocklistproject.github.io/Lists/scam.txt
rm filter111.txt
mv scam.txt filter111.txt
wget -o filter112.txt https://blocklistproject.github.io/Lists/tracking.txt
rm filter112.txt
mv tracking.txt filter112.txt
wget -o filter113.txt https://hosts.oisd.nl/
rm filter113.txt
mv index.html filter113.txt
wget -o filter114.txt https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt
rm filter114.txt
mv adservers.txt filter114.txt
wget -o filter115.txt https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
rm filter115.txt
mv hosts filter115.txt
wget -o filter116.txt https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt
rm filter116.txt
mv hosts.txt filter116.txt
wget -o filter117.txt https://someonewhocares.org/hosts/zero/hosts
rm filter117.txt
mv hosts filter117.txt
wget -o filter118.txt https://abpvn.com/android/abpvn.txt
rm filter118.txt
mv abpvn.txt filter118.txt
wget -o filter119.txt https://raw.githubusercontent.com/MajkiIT/polish-ads-filter/master/polish-pihole-filters/hostfile.txt
rm filter119.txt
mv hostfile.txt filter119.txt
wget -o filter120.txt https://raw.githubusercontent.com/yous/YousList/master/hosts.txt
rm filter120.txt
mv hosts.txt filter120.txt
wget -o filter121.txt https://filtri-dns.ga/filtri.txt
rm filter121.txt
mv filtri.txt filter121.txt
cp /docker/host-file/backup-dead-host/malware.txt /docker/combine-host2/filter122.txt
cp /docker/host-file/backup-dead-host/malwaredomainlist.com.block-energizer-pro-filter.txt /docker/combine-host2/filter123.txt

cat filter101.txt filter102.txt filter103.txt filter104.txt filter105.txt filter106.txt filter107.txt filter108.txt filter109.txt filter110.txt filter111.txt filter112.txt filter113.txt filter114.txt filter115.txt filter116.txt filter117.txt filter118.txt filter119.txt filter120.txt filter121.txt filter122.txt filter123.txt > combine-section1.txt

sort -u combine-section1.txt | uniq -i > combine-section-sort1.txt

# deletes 2 words
sed -e s/'0.0.0.0 www.'//g combine-section-sort1.txt > combine-section-sort1-step2.txt
sed -e s/'0.0.0.0 '//g combine-section-sort1-step2.txt > combine-section-sort1-step3.txt

sort -u combine-section-sort1-step3.txt > combine-section-sort1-step4.txt

cp combine-section-sort1-step4.txt /docker/host-file/home1.txt

############################################################################################

# section -nothing infront of websites-
#wget -o filter201.txt https://gist.githubusercontent.com/johnrlive/d9c9de7ecc79cbfdb58bd53af5faeeea/raw/4aaa7e9c76815a8a5a2de8c3ef42d21b1f06c6b8/Samsung%2520Smart-TV%2520Blocklist%2520Adlist%2520(for%2520PiHole)
wget -o filter202.txt https://raw.githubusercontent.com/passel/pihole-blocklists/master/scam-spam.txt
rm filter202.txt
mv scam-spam.txt filter202.txt
wget -o filter203.txt https://raw.githubusercontent.com/passel/pihole-blocklists/master/malware-malicious.txt
rm filter203.txt
mv malware-malicious.txt filter203.txt
wget -o filter204.txt https://raw.githubusercontent.com/passel/pihole-blocklists/master/ads.txt
rm filter204.txt
mv ads.txt filter204.txt
wget -o filter205.txt https://blocklistproject.github.io/Lists/abuse.txt
rm filter205.txt
mv abuse.txt filter205.txt
wget -o filter206.txt https://infosec.cert-pa.it/analyze/listdomains.txt
rm filter206.txt
mv listdomains.txt filter206.txt
wget -o filter207.txt https://v.firebog.net/hosts/Easylist.txt
rm filter207.txt
mv Easylist.txt filter207.txt
wget -o filter208.txt https://v.firebog.net/hosts/AdguardDNS.txt
rm filter208.txt
mv AdguardDNS.txt filter208.txt
wget -o filter209.txt https://s3.amazonaws.com/lists.disconnect.me/simple_ad.txt
rm filter209.txt
mv simple_ad.txt filter209.txt
wget -o filter210.txt https://s3.amazonaws.com/lists.disconnect.me/simple_tracking.txt
rm filter210.txt
mv simple_tracking.txt filter210.txt
wget -o filter211.txt https://raw.githubusercontent.com/yourduskquibbles/webannoyances/master/ultralist.txt
rm filter211.txt
mv ultralist.txt filter211.txt
wget -o filter212.txt https://raw.githubusercontent.com/kboghdady/youTube_ads_4_pi-hole/master/huluads.txt
rm filter212.txt
mv huluads.txt filter212.txt
wget -o filter213.txt https://raw.githubusercontent.com/Spam404/lists/master/main-blacklist.txt
rm filter213.txt
mv main-blacklist.txt filter213.txt
wget -o filter214.txt https://raw.githubusercontent.com/mitchellkrogza/The-Big-List-of-Hacked-Malware-Web-Sites/master/hacked-domains.list
rm filter214.txt
mv hacked-domains.list filter214.txt
wget -o filter215.txt https://raw.githubusercontent.com/cchevy/macedonian-pi-hole-blocklist/master/hosts.txt
rm filter215.txt
mv hosts.txt filter215.txt
wget -o filter216.txt https://raw.githubusercontent.com/DRSDavidSoft/additional-hosts/master/domains/blacklist/unwanted-iranian.txt
rm filter216.txt
mv unwanted-iranian.txt filter216.txt
cp /docker/host-file/backup-dead-host/280blocker_domain-10.21.2020-5.16.00am.txt /docker/combine-host2/filter217.txt
cp /docker/host-file/backup-dead-host/Akamaru-PiHoleList-smarttv.txt /docker/combine-host2/filter218.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-fsa.txt /docker/combine-host2/filter219.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-grm.txt /docker/combine-host2/filter220.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-pha.txt /docker/combine-host2/filter221.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-pup.txt /docker/combine-host2/filter222.txt
cp /docker/host-file/backup-dead-host/KitsapCreator-pihole_blocklist-malware_malicious.txt /docker/combine-host2/filter223.txt
cp /docker/host-file/backup-dead-host/list_browser_UBO.txt /docker/combine-host2/filter224.txt
cp /docker/host-file/backup-dead-host/malwaredomainlist.com.hostlist2.txt /docker/combine-host2/filter225.txt

#ignore 201
cat filter202.txt filter203.txt filter204.txt filter205.txt filter206.txt filter207.txt filter208.txt filter209.txt filter210.txt filter211.txt filter212.txt filter213.txt filter214.txt filter215.txt filter216.txt filter217.txt filter218.txt filter219.txt filter220.txt filter221.txt filter222.txt filter223.txt filter224.txt filter225.txt > combine-section2.txt

sort -u combine-section2.txt | uniq -i > combine-section-sort2.txt

# deletes 2 words
sed -e s/'www.'//g combine-section-sort2.txt > combine-section-sort2-step2.txt
sed -e s/'0.0.0.0 '//g combine-section-sort2-step2.txt > combine-section-sort2-step3.txt

sort -u combine-section-sort2-step3.txt | uniq -i > combine-section-sort2-step4.txt

cp combine-section-sort2-step4.txt /docker/host-file/home2.txt

##############################################################################
#127.0.0.1 (space) section
#wget -o filter301.txt https://sysctl.org/cameleon/hosts.win
#rm filter301.txt
#mv hosts.win filter301.txt
cp /docker/host-file/backup-dead-host/offline-hosts.win.txt filter301.txt

wget -o filter302.txt https://phishing.army/download/phishing_army_blocklist_extended.txt
rm filter302.txt
mv phishing_army_blocklist_extended.txt filter302.txt
wget -o filter303.txt https://infosharing.cybersaiyan.it/feeds/CS-PIHOLE
rm filter303.txt
mv CS-PIHOLE filter303.txt
wget -o filter304.txt https://urlhaus.abuse.ch/downloads/hostfile/
rm filter304.txt
mv index.html filter304.txt
wget -o filter305.txt https://raw.githubusercontent.com/xorcan/hosts/master/xhosts.txt
rm filter305.txt
mv xhosts.txt filter305.txt
wget -o filter306.txt https://raw.githubusercontent.com/lassekongo83/Frellwits-filter-lists/master/Frellwits-Swedish-Hosts-File.txt
rm filter306.txt
mv Frellwits-Swedish-Hosts-File.txt filter306.txt

cp /docker/host-file/backup-dead-host/hosts-file-net-ad_servers.txt /docker/combine-host2/filter307.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-emd.txt /docker/combine-host2/filter308.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-exp.txt /docker/combine-host2/filter309.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-hjk.txt /docker/combine-host2/filter310.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-mmt.txt /docker/combine-host2/filter311.txt
cp /docker/host-file/backup-dead-host/hosts-file-net-psh.txt /docker/combine-host2/filter312.txt
cp /docker/host-file/backup-dead-host/KitsapCreator-pihole_blocklist-ads.txt /docker/combine-host2/filter313.txt
cp /docker/host-file/backup-dead-host/zeustracker.abuse.ch.blocklist.txt /docker/combine-host2/filter314.txt

cat filter301.txt filter302.txt filter303.txt filter304.txt filter305.txt filter306.txt filter307.txt filter308.txt filter309.txt filter310.txt filter311.txt filter312.txt filter313.txt filter314.txt > combine-section3.txt

sort -u combine-section3.txt | uniq -i > combine-section-sort3.txt

# deletes 2 words
sed -e s/'127.0.0.1 www.'//g combine-section-sort3.txt > combine-section-sort3-step2.txt
sed -e s/'127.0.0.1	www.'//g combine-section-sort3-step2.txt > combine-section-sort3-step3.txt
sed -e s/'127.0.0.1	  www.'//g combine-section-sort3-step3.txt > combine-section-sort3-step4.txt
sed -e s/'127.0.0.1	 '//g combine-section-sort3-step4.txt > combine-section-sort3-step5.txt
sed -e s/'127.0.0.1	'//g combine-section-sort3-step5.txt > combine-section-sort3-step6.txt
sed -e s/'127.0.0.1 '//g combine-section-sort3-step6.txt > combine-section-sort3-step7.txt
sed -e s/' www.'//g combine-section-sort3-step7.txt > combine-section-sort3-step8.txt

sort -u combine-section-sort3-step8.txt | uniq -i > combine-section-sort3-step9.txt

cp combine-section-sort3-step9.txt /docker/host-file/home3.txt

#################################################################################
#127.0.0.1 (no space) section
wget -o filter401.txt https://adaway.org/hosts.txt
rm filter401.txt
mv hosts.txt filter401.txt
wget -o filter402.txt https://raw.githubusercontent.com/AdAway/adaway.github.io/master/hosts.txt
rm filter402.txt
mv hosts.txt filter402.txt

cp /docker/host-file/backup-dead-host/malwaredomainlist.com.hostlist.txt /docker/combine-host2/filter403.txt

cat filter401.txt filter402.txt filter403.txt > combine-section4.txt

sort -u combine-section4.txt | uniq -i > combine-section-sort4.txt

sed -e s/'127.0.0.1 www.'//g combine-section-sort4.txt > combine-section-sort4-step2.txt
sed -e s/'127.0.0.1  www.'//g combine-section-sort4-step2.txt > combine-section-sort4-step3.txt

sort -u combine-section-sort4-step3.txt | uniq -i > combine-section-sort4-step4.txt

cp combine-section-sort4-step4.txt /docker/host-file/home4.txt

#####################################################################################
#combine-section-sort1.txt
cat combine-section-sort0-step3.txt combine-section-sort1-step4.txt combine-section-sort2-step4.txt combine-section-sort3-step5.txt combine-section-sort4-step3.txt > combine-section-sort-all-step3.txt
sort -u combine-section-sort-all-step3.txt | uniq -i > combine-section-sort-all-finished-step3.txt


sed -s s/'127.0.0.1	www.'//g combine-section-sort-all-finished-step3.txt > combine-section-sort-all-finished-step4.txt
sed -s s/'127.0.0.1	'//g combine-section-sort-all-finished-step4.txt > combine-section-sort-all-finished-step5.txt
sed -s s/'127.0.0.1  '//g combine-section-sort-all-finished-step5.txt > combine-section-sort-all-finished-step6.txt
sed -s s/'127.0.0.1  www.'//g combine-section-sort-all-finished-step6.txt > combine-section-sort-all-finished-step7.txt
sed -s s/'127.0.0.1 '//g combine-section-sort-all-finished-step7.txt > combine-section-sort-all-finished-step8.txt
sed -s s/'127.0.0.1 www.'//g combine-section-sort-all-finished-step8.txt > combine-section-sort-all-finished-step9.txt
sort -u combine-section-sort-all-finished-step9.txt | uniq -i > combine-section-sort-all-finished-step10.txt

cp combine-section-sort-all-finished-step10.txt /docker/host-file/home.txt

sed '1,5929d' /docker/host-file/home.txt

#rm -rf /docker/combine-host2
