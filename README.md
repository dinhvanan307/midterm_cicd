# Midterm: CI/CD với GitHub Actions & ArgoCD

## 1. Set up
- Chuẩn bị 2 repo Github: midterm_cicd và https://github.com/dinhvanan307/midterm-gitops(AgroCD sẽ theo dõi repo này)
- Kubernetes Cluser (K8S) (Docker Desktop).
- Cài đặt ArgoCD (Kết nối K8S và Git).

## 2. Truy cập ArgoCD UI

- Dùng các lệnh để set up
<img width="1120" height="226" alt="image" src="https://github.com/user-attachments/assets/fdf9d580-00fe-4645-9286-b66919455eb7" />

- Lấy mật khẩu
<img width="1122" height="59" alt="image" src="https://github.com/user-attachments/assets/943d0b20-4966-4eef-8f35-770fb92ea8db" />

- Sau đó forward cổng để vào AgroCD UI
<img width="1099" height="57" alt="image" src="https://github.com/user-attachments/assets/22a3e4c0-cc65-4412-ad57-0348001ff9a6" />

Truy cập https://localhost:8080 để vào giao diện ArgoCD.

# Tạo Application trên ArgoCD UI

General:

- Application Name: my-simple-app

- Project Name: default

- Sync Policy: Automatic (và tích vào Prune Resources + Self Heal)

Source (Quan trọng nhất):

- Repository URL: Dán URL của repo midterm-gitops (ví dụ:  https://github.com//midterm-gitops).

- Revision: HEAD

- Path: . (nghĩa là dùng thư mục gốc của repo)

<img width="1919" height="957" alt="image" src="https://github.com/user-attachments/assets/6249bb65-e06f-4666-9e4b-20f50dff31b8" />

<img width="1919" height="961" alt="image" src="https://github.com/user-attachments/assets/57ee25e2-16d8-4550-a224-f0e772faf321" />

Destination

- Cluster URL: https://kubernetes.default.svc (nghĩa là deploy vào chính cluster mà ArgoCD đang chạy).

- Namespace: default

#3 Thiết lập pipeline CI

- Tạo personal access token trên gthub

<img width="1919" height="945" alt="image" src="https://github.com/user-attachments/assets/00873a5f-e3d3-455d-8a17-e1a32e72ae9c" />

- Thêm Secrets vào Repo:

<img width="1919" height="962" alt="image" src="https://github.com/user-attachments/assets/8fbf3b5a-1508-494d-b849-ff7628316cde" />


- Tạo file .github/workflows/ci-cd-pipeline.yml:

<img width="1905" height="954" alt="image" src="https://github.com/user-attachments/assets/bee4968f-ad0c-4ee8-98d8-3341afe5582f" />

Update và commit trên vs code sẽ hiện trên workflow trong tab Actions

<img width="1918" height="954" alt="image" src="https://github.com/user-attachments/assets/be9c8020-842b-4f33-93c1-462093511662" />

Có 2 jobs là build-and-push và update-manifest:

<img width="1919" height="831" alt="image" src="https://github.com/user-attachments/assets/5e374b17-ccdd-431a-8475-8b273c2bc373" />

Giao diện ArgoCD UI sau khi phát hiện thay đổi:

<img width="1919" height="962" alt="image" src="https://github.com/user-attachments/assets/835b205e-9d1a-47cd-ab6e-4bb5d5e09fa0" />




















