#!/bin/bash
# 私有/共有镜像地址
# 替换你自己的镜像仓库,阿里后面还有的命令空间,不要加,防止多个命名空间
dockerUrl=registry.cn-hangzhou.aliyuncs.com/dreamlu
# 批量推向私有仓库
docker images | grep ${dockerUrl} | awk '{print "docker push "$1":"$2}' | sh

# 删除空镜像
docker images|grep none|awk '{print $3 }'|xargs docker rmi

# 删除停止的容器
#docker rm `docker ps -a|grep Exited|awk '{print $1}'`

# ssh 登录
# 自动更新，取消注释，配置ssh免密
#ssh root@ip "cd /root/gt-crud/docker/;./update.sh;exit"
