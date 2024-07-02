FROM maven:amazoncorretto as build
WORKDIR /javaapp
COPY . .
RUN mvn clean install

FROM artisantek/tomcat:1
COPY --from=build /javaapp/target/*.war /usr/local/tomcat/webapps/
