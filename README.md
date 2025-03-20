# Inception

## 🛠 Project Overview

Inception is a system administration project focused on containerization using Docker and Docker Compose. The goal is to set up and manage a virtualized environment with multiple services running in isolated containers on a Linux host.

## � Technologies Used

- **Docker & Docker Compose** – For container orchestration.
- **Nginx** – As a reverse proxy and web server.
- **WordPress** – Content management system (CMS).
- **MariaDB** – SQL database for WordPress.
- **Linux** – Base environment for deployment.

## 📌 Key Features

- Multi-container architecture using Docker Compose.
- Secure setup with user permissions and SSL/TLS encryption.
- Data persistence using volumes and bind mounts.
- Automated service startup and networking configuration.

## 📂 Project Structure

.
├── Makefile
├── README.md
└── srcs
    ├── docker-compose.yml
    └── requirements
        ├── mariadb
        │   ├── conf
        │   │   ├── init.sql
        │   │   └── my.cnf
        │   ├── Dockerfile
        │   └── script
        │       └── mariadb.sh
        ├── nginx
        │   ├── conf
        │   │   ├── default.conf
        │   │   └── nginx.conf
        │   ├── Dockerfile
        │   └── script
        │       └── nginx.sh
        └── wordpress
            ├── conf
            │   └── www.conf
            ├── Dockerfile
            └── script
                └── wordpress.sh
