#!/usr/bin/env bash

# Install heroku
sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install heroku

# Composer speed up
sudo su vagrant <<'EOF'
/usr/local/bin/composer config -g repo.packagist composer https://packagist.laravel-china.org
EOF

# Caching up Laravel with composer
sudo su vagrant <<'EOF'
cd ~
/usr/local/bin/composer create-project laravel/laravel cached --prefer-dist "5.1.*"
/usr/local/bin/composer create-project laravel/laravel cached --prefer-dist "5.3.*"
/usr/local/bin/composer create-project laravel/laravel cached --prefer-dist "5.4.*"
composer create-project laravel/laravel Laravel dev-develop
EOF

# cnpm for npm speed up
printf '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"' >> /home/vagrant/.bashrc

# Caching up npm/yarn install
sudo su vagrant <<'EOF'
yarn config set registry 'https://registry.npm.taobao.org'
cd ~/cached
yarn install --no-bin-links
EOF
