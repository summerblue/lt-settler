#!/usr/bin/env bash

# 安装 heroku
# sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
# curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
# sudo apt-get update
# sudo apt-get install heroku
sudo wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
heroku --version

# Composer 加速
sudo su vagrant <<'EOF'
/usr/local/bin/composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
EOF

# NPM 加速
sudo su vagrant <<'EOF'
/usr/bin/npm config set registry=https://registry.npm.taobao.org
/usr/bin/yarn config set registry https://registry.npm.taobao.org
EOF

# 安装 Elasticsearch
sudo su vagrant <<'EOF'
cd ~
git clone https://github.com/summerblue/laravel-ubuntu-init.git
cd laravel-ubuntu-init/16.04/
sudo ./install_elasticsearch.sh 7
systemctl disable elasticsearch.service
EOF

