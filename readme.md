# Laravel Tutorial Settler

在 `lc/homestead` 的基础上，增加了：

- 默认安装 heroku 命令
- 国内 Composer 加速
- cnpm 国内 npm 加速
- 默认安装 Elasticsearch

## 原理

基于 [laravel/homestead](https://app.vagrantup.com/laravel/boxes/homestead) 构建自定义的 BOX。

## 教程

1. 下载并导入最新的 box，导入时注意修改 provider 为 `lc/homestead`  https://laravel-china.org/topics/2090 ；
2. 检查 `vagrant box list` 是否有 `lc/homestead`;
3. 如果有需要的话，修改 `provision.sh` 并确定无误，这个脚本将会在新的 Box 里运行，请利用此脚本来定制软件和配置；
4. 运行 `./build.sh` 生成定制的 box。
