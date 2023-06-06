# 给第一步构建阶段取别名 builder
FROM node:14-alpine as builder
WORKDIR /usr/app
COPY package.json .
RUN npm install
COPY . .
RUN ["npm", "run", "build"]

# FROM 指令划分构架阶段，下面是第二步
FROM nginx
# 指明文件从 build 阶段产生的镜像中来
COPY --from=builder /usr/app/build /usr/share/nginx/html
# nginx 镜像有默认启动命令，不需要我们设置


# 第一步 docker build .
# 第二步 docker run -p 80:80 2dd03579b6d6c5