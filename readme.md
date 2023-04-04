# 启动
mvn package -DskipTests # 构建jar包
docker-compose build # 构建镜像 （这里注意，构建镜像时，要export对应的数据库连接信息环境变量）
docker-compose up -d # 启动镜像
*测试环境 sh ./start-local.sh 本地启动
kill -9 对应进程ID关闭