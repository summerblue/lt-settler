# Laravel Tutorial Settler

在 `lc/homestead` 的基础上，增加了：

- 默认安装 heroku
- 国内 composer 加速
- cnpm 国内 npm 加速

## 教程

1. 下载并导入最新的 box，导入时注意修改 provider 为 `lc/homestead`  https://laravel-china.org/topics/2090 ；
2. 检查 `vagrant box list` 是否有 `lc/homestead`;
3. 检查 `provision.sh` 确定无误；
4. 运行 `./build.sh` 生成定制的 box。
