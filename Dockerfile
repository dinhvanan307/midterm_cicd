# Giai đoạn 1: Build ứng dụng Java
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# --- SỬA LỖI: Cấp quyền thực thi cho mvnw ---
RUN chmod +x ./mvnw

RUN ./mvnw dependency:resolve
COPY src ./src
RUN ./mvnw package -DskipTests

# Giai đoạn 2: Tạo image chạy cuối cùng (nhẹ hơn)
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
# Sao chép file .jar đã build từ giai đoạn 'build'
COPY --from=build /app/target/midterm-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]