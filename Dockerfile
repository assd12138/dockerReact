# 基于node镜像打包
FROM node:lts AS builder
# 设置工作目录
WORKDIR /app

# 复制依赖列表
COPY package.json .
COPY yarn.lock .

# 安装依赖
RUN yarn install

# 复制源码文件
COPY . .

# 打包
RUN yarn build

# 基于nginx镜像运行
FROM nginx:stable AS runner

# 复制打包产物
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80

# 运行nginx
CMD ["nginx", "-g", "daemon off;"]
