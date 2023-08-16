#build phase
FROM gradle:8.2.1-jdk17-alpine AS build

WORKDIR /app/build/docker-with-spring

COPY build.gradle settings.gradle /app/build/docker-with-spring/

RUN gradle clean build --no-daemon > /dev/null 2>&1 || true

COPY . /app/build/docker-with-spring

RUN gradle clean build -x test --no-daemon


# run phase
FROM eclipse-temurin:17-jdk

ARG JAR_FILE=docker-with-spring-0.0.1-SNAPSHOT.jar

RUN mkdir /docker-with-spring

WORKDIR /docker-with-spring

COPY --from=build /app/build/docker-with-spring/build/libs/${JAR_FILE} /docker-with-spring/app.jar

ENTRYPOINT ["java","-jar","app.jar"]

