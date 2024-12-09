parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

read -p "Enter your GitHub token: " token

echo "downloading multi-runners tool"
git clone https://github.com/vbem/multi-runners.git

echo "MR_GITHUB_PAT=\"$token\"" > multi-runners/.env

echo "adding recreate_all job to crontab"
(crontab -l 2>/dev/null; echo "0 3 * * SUN bash $(readlink -e recreate_all.bash) 2>&1 | logger -t CRON") | crontab -

echo "creating runners for the first time"
bash recreate_all.bash

