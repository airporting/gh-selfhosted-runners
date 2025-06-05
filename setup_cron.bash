echo "clearing all previous crontab jobs"
crontab -r

echo "adding auto git pull for this repo to crontab"
(crontab -l 2>/dev/null; echo "0 20 * * * cd $(readlink -e .) && git pull 2>&1 | logger -t CRON") | crontab -
echo "adding recreate_all job to crontab"
(crontab -l 2>/dev/null; echo "0 21 * * SUN,TUE,THU bash $(readlink -e recreate_all.bash) 2>&1 | logger -t CRON") | crontab -
