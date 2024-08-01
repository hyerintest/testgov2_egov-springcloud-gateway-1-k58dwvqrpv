#FROM openjdk:8-alpine
FROM registry.turacocloud.com/turaco-package/openjdk:8-alpine

COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

COPY src src

RUN chmod +x ./gradlew

RUN ./gradlew bootJar

COPY --from=builder build/libs/*.jar apigateway-0.1.jar

EXPOSE 8000
ENTRYPOINT ["sh", "-c", "java", "-jar", "/apigateway-0.1.jar"]

