export MYSQL_CN_URL=jdbc:mysql://192.168.8.44:3306/website
export MYSQL_CN_USERNAME=root
export MYSQL_CN_PASSWORD=nebula
export MYSQL_CN_TZ=Asia/Shanghai

export MYSQL_EN_URL=jdbc:mysql://192.168.8.157:3306/website_en
export MYSQL_EN_USERNAME=root
export MYSQL_EN_PASSWORD=nebula
export MYSQL_EN_TZ=America/New_York

export MAGIC_LOCATION_PATH=./

nohup java -jar ./target/one-website-0.0.4-SNAPSHOT.jar --spring.config.location=./src/main/resources/application.yml > ./logs/cms.log 2>&1 &