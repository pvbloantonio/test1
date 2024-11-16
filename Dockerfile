FROM openjdk:17-jdk-slim

WORKDIR /app

# Copia el JAR empaquetado a la imagen Docker
COPY target/mi-proyecto-1.0-SNAPSHOT.jar app.jar

# Ejecutar la aplicación con Java
ENTRYPOINT ["java", "-jar", "app.jar"]
