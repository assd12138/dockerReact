<!--
 * @Author: 姚振
 * @Date: 2022-09-11 23:22:14
 * @LastEditors: 姚振
 * @LastEditTime: 2022-09-18 23:55:53
 * @Description: file contents
-->

# A

## 创建项目镜像

build 镜像
`docker build -t docker-react .`

## 下载 docker registry 搭建一个本地的镜像仓库

`docker pull registry`
在主机的 localhost:5009 上运行仓库

`docker run -d -p 5009:5000 --restart always --name registry registry`
运行私有仓库容器

查看地址确认本地仓库安装成功
http://127.0.0.1:5009/v2/_catalog

打 tag 标记自己的镜像
`docker image tag docker-react localhost:5009/docker-react`

将镜像推入本地仓库
`docker push localhost:5009/docker-react`

## 进入 dashboard

打开代理
`kubectl proxy`

访问[dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login)

## 用 deployment.yaml 部署 Deployment 和 Service

`kubectl apply -f ./docker/deployment.yaml`

# gocd

## gocd 安装

1. 安装 server 并启动
2. 安装 agent 并启动
3. 访问`http://localhost:8153/`
