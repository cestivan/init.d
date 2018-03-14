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

* Ubuntu Server 14.04, 16.04

## 前提

大多数情况下，服务器部署不应用`root`账户直接进行操作，所以如果你的服务器本身未创建非root账户（如`ubuntu`），你应该先创建一个非root账户。

> 注意将`ubuntu`替换成你希望创建的用户名。

```bash
adduser ubuntu
```

输入密码，确认密码后，一路回车即可创建成功。接下来，再将该账户设为sudo用户组，让它可以进行高级操作。

```bash
usermod -aG sudo username
```

## 系统标配

安装系统常见需要的基本软件包，包括中文环境、Node.js、imagemagick、git、zsh、vim、unzip、htop及编译基础库。

```bash
sudo apt-get update
sudo apt-get install -y curl
curl -sSL https://git.io/vbq1p | bash
```

### 安装 Nginx

Nginx [official package](http://nginx.org/packages/ubuntu/)

```bash
curl -sSL https://git.io/vbqMG | bash
```

### 安装 RVM + Ruby

```bash
curl -sSL https://git.io/vbqM8 | bash
```

> Default Use Ruby China mirror site for RubyGems and Ruby

## 安装数据库

### PostgreSQL (9.6)

```bash
curl -sSL https://git.io/vbqQn | bash
```

### MySQL (5.6)

```bash
curl -sSL https://git.io/vbqQO | bash
```

### MongoDB

```bash
curl -sSL https://git.io/vbqME | bash
```

### Redis

```bash
curl -sSL https://git.io/vbqMo | bash
```

## 其他

### ElasticSearch

```bash
curl -sSL https://git.io/vbqM5 | bash
```

## Docker

该脚本除了 `Docker` 外还会一同安装 `Docker Compose` 。

```bash
curl -sSL https://git.io/vbqMj | bash
sudo docker info
```
