# 三部曲1：规定基础镜像
FROM node:14-alpine

# 增加基础目录
WORKDIR /usr/app

# 三部曲2：运行命令来安装必要的依赖、程序
COPY package.json .
RUN npm install
COPY . .

# 三部曲3：规定容器启动参数
CMD ["npm", "start"]