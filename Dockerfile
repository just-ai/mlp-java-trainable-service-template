FROM openjdk:17

WORKDIR /app

COPY target/mlp-java-trainable-service-template/lib /app/lib
COPY target/mlp-java-trainable-service-template-* /app

ENTRYPOINT ["java", "-cp", "*:lib/*", "com.mlp.fitaction.MainKt"]
