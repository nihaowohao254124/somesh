#!/bin/bash

# 安装SSH服务
echo "正在安装SSH服务..."
sudo apt-get update && sudo apt-get install -y openssh-server
sudo mkdir -p /var/run/sshd
echo 'PermitRootLogin yes' | sudo tee -a /etc/ssh/sshd_config

# 设置root密码
echo "正在设置root密码..."
echo "root:xxx123" | sudo chpasswd

# 启动SSH服务
echo "正在启动SSH服务..."
sudo /usr/sbin/sshd

# 启动frpc客户端
echo "正在启动frpc客户端..."
chmod +x frpc
nohup ./frpc -c frpc.ini > frpc.log 2>&1 &

echo "所有服务已启动完成！"
