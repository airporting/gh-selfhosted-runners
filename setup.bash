parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

read -p "Enter your GitHub token: " token

echo "installing deps"
sudo apt-get install jq

echo "downloading multi-runners tool"
git clone https://github.com/vbem/multi-runners.git

echo "MR_GITHUB_PAT=\"$token\"" > multi-runners/.env

bash setup_cron.bash

echo "creating runners for the first time"
bash recreate_all.bash

sudo fallocate -l 8G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
