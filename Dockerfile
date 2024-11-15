FROM openjdk:17-jdk-slim

WORKDIR /app

# Copia el archivo JAR generado a la imagen
COPY target/*.jar app.jar


# Ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "app.jar"]

