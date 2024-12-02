echo "downloading multi-runners tool"
git clone https://github.com/vbem/multi-runners.git

echo "adding recreate_all job to crontab"
(crontab -l 2>/dev/null; echo "0 3 * * SUN bash $(readlink -e recreate_all.bash)") | crontab -

echo "creating runners for the first time"
bash recreate_all.bash
