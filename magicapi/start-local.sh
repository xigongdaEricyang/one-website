export MYSQL_CN_URL=jdbc:mysql://192.168.8.44:3306/website
export MYSQL_CN_USERNAME=root
export MYSQL_CN_PASSWORD=nebula
export MYSQL_CN_TZ=Asia/Shanghai

export MYSQL_EN_URL=jdbc:mysql://192.168.8.44:3306/website_en
export MYSQL_EN_USERNAME=root
export MYSQL_EN_PASSWORD=nebula
export MYSQL_EN_TZ=America/New_York

export MAGIC_LOCATION_PATH=./
export SECURITY_USERNAME=admin
export SECURITY_PASSWORD=123456

nohup java -jar ./target/magicapi-0.0.1-SNAPSHOT.jar --spring.config.location=./src/main/resources/application.yml > ../logs/magicapi.log 2>&1 & 