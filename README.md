```
   ______              __           __
  /\__  _\          __/\ \__       /\ \
  \/_/\ \/     ___ /\_\ \ ,_\      \_\ \
     \ \ \   /' _ `\/\ \ \ \/      /'_` \
      \_\ \__/\ \/\ \ \ \ \ \_  __/\ \L\ \
      /\_____\ \_\ \_\ \_\ \__\/\_\ \___,_\
      \/_____/\/_/\/_/\/_/\/__/\/_/\/__,_ /
```

Batch scripts for Ruby production environment install on Ubuntu Server.

## 系统要求

* Ubuntu Server 14.04, 16.04, 18.04

## 前提

大多数情况下，服务器部署不应用 `root` 账户直接进行操作，所以如果你的服务器本身未创建非 root 账户（如 `yxprod`），你应该先创建一个非 root 账户。

> 注意将 `yxprod` 替换成你希望创建的用户名。

```bash
adduser yxprod
```

输入密码，确认密码后，一路回车即可创建成功。接下来，再将该账户设为sudo用户组，让它可以进行高级操作。

```bash
usermod -aG sudo yxprod
```

## 系统标配

安装系统常见需要的基本软件包，包括中文环境、Node.js、imagemagick、git、zsh、vim、unzip、htop及编译基础库。

```bash
sudo apt-get update
sudo apt-get install -y curl
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_packages | bash
```

## 提高 ssh 安全性

### 修改 ssh 配置文件

用 root 账号修改端口号（默认为 2345 端口，**注意要在云服务器安全组放行**）并禁用密码登陆：

```bash
sed -i 's/^.*Port.*/Port 2345/g' /etc/ssh/sshd_config && sed -i 's/^.*PasswordAuthentication.*/PasswordAuthentication no/g' /etc/ssh/sshd_config
```

防火墙放行 2345 端口：

```bash
ufw allow 2345/tcp
```

### 重启ssh服务
使用如下命令重启ssh服务即可使用root账号和新的端口号登录ssh：

```bash
service ssh restart
```

可以通过以上命令可以通过：

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/ssh_security | bash
```

### 安装 Nginx

Nginx [official package](http://nginx.org/packages/ubuntu/)

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_nginx | bash
```

### 安装 RVM + Ruby

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_rvm_ruby | bash
```

> Default Use Ruby China mirror site for RubyGems and Ruby

## 安装数据库

### PostgreSQL (13)

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_postgresql | bash
```

### MySQL (5.6)

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_mysql | bash
```

### MongoDB

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_mongodb | bash
```

### Redis

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_redis | bash
```

## 其他

### 安装 ElasticSearch

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_elasticsearch | bash
```

## 安装 Docker

该脚本除了 `Docker` 外还会一同安装 `Docker Compose` 。

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_docker | bash
sudo docker info
```

以 docker swarm 模式，一键安装并启动 `traefik` 及 `Portainer`：

```bash
curl https://git.yingxuan.io/yx/init-d/-/raw/master/docker-swarm/init-with-traefik-and-portainer > init-with-traefik-and-portainer
source init-with-traefik-and-portainer
```

### 安装 Dokku

提前映射 `dokku.xxx.com` 和 `*.dokku.xxx.com` 两个 A 记录到指定服务器 IP。

在执行以下命令安装 Dokku 需要先 `su root` 切换到 root 用户。

```bash
curl -sSL https://git.yingxuan.io/yx/init-d/-/raw/master/install_dokku | bash
dokku -v
```

可以登录 `dokku.xxx.com` 完成剩下工作（如果访问是 nginx 默认页面，记得删掉 `/etc/nginx/conf.d/default.conf` 后 `nginx -s reload`）。

常见插件：

```bash
dokku plugin:install https://github.com/dokku/dokku-postgres.git postgres
dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
dokku plugin:install https://github.com/dokku/dokku-mysql.git mysql
dokku plugin:install https://github.com/dokku/dokku-redis.git redis
```
