FROM gradle:8.2.1-jdk17-alpine
# AS build

WORKDIR /app/rabbit-mq

COPY build.gradle settings.gradle /app/rabbit-mq/

RUN gradle clean build --no-daemon > /dev/null 2>&1 || true

COPY . /app/rabbit-mq

RUN gradle clean build -x test --no-daemon


# FROM eclipse-temurin:17-jdk

ARG JAR_FILE=nbr-0.1.jar

RUN mkdir /rabbit-mq

WORKDIR /rabbit-mq

# COPY --from=build /app/rabbit-mq/build/libs/${JAR_FILE} /rabbit-mq/app.jar

COPY /app/rabbit-mq/build/libs/${JAR_FILE} /rabbit-mq/app.jar

ENTRYPOINT ["java","-jar","app.jar"]

