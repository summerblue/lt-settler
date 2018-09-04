#!/usr/bin/env bash

# 安装 heroku
sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install heroku

# Composer 加速
sudo su vagrant <<'EOF'
/usr/local/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org
EOF

# NPM 加速
printf '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> /home/vagrant/.bashrc

# 自动配置好所有项目
sudo su vagrant <<'EOF'
mkdir -p ~/LaravelChina
cd ~/LaravelChina
git clone https://github.com/summerblue/laravel-tutorial.git l01
cd l01
cp .env.example .env
composer install
SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass yarn install --no-bin-links
cd ~/LaravelChina
git clone https://github.com/summerblue/larabbs.git l02
cd l02
cp .env.example .env
composer install
SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass yarn install --no-bin-links
cd ~/LaravelChina
git clone https://github.com/summerblue/larabbs.git l03
cd l03
git checkout api
cp .env.example .env
composer install
SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass yarn install --no-bin-links
cd ~/LaravelChina
git clone https://github.com/summerblue/larabbs.git l04
cd l04
git checkout weapp
cp .env.example .env
composer install
SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass yarn install --no-bin-links
cd ~/LaravelChina
git clone https://github.com/summerblue/laravel-shop.git l05
cd l05
cp .env.example .env
composer install
SASS_BINARY_SITE=http://npm.taobao.org/mirrors/node-sass yarn install --no-bin-links
EOF

# 安装 Elasticsearch
sudo su vagrant <<'EOF'
cd ~
git clone https://github.com/summerblue/laravel-ubuntu-init.git
cd laravel-ubuntu-init/16.04/
sudo ./install_elasticsearch.sh
systemctl disable elasticsearch.service
EOF

