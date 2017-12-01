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

## Requirements

* Ubuntu Server 14.04

## Basic Usage

Install packages first

```bash
sudo apt-get update
sudo apt-get install -y curl
curl -sSL https://git.io/vbq1p | bash
```

### Install Nginx

Nginx [official package](http://nginx.org/packages/ubuntu/)

```bash
curl -sSL https://git.io/vbqMG | bash
```

### Install RVM + Ruby

```bash
curl -sSL https://git.io/vbqM8 | bash
```

> Default Use Ruby China mirror site for RubyGems and Ruby

## Database Installation

### Install PostgreSQL (9.6)

```bash
curl -sSL https://git.io/vbqQn | bash
```

### Install MySQL (5.6)

```bash
curl -sSL https://git.io/vbqQO | bash
```

### Install MongoDB

```bash
curl -sSL https://git.io/vbqME | bash
```

### Install Redis

```bash
curl -sSL https://git.io/vbqMo | bash
```

## Others

### Install ElasticSearch

```bash
curl -sSL https://git.io/vbqM5 | bash
```

## Install Docker

```bash
curl -sSL https://git.io/vbqMj | bash
sudo docker info
```
