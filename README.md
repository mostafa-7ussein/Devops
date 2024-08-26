# WordPress Deployment with Docker Compose and Jenkins Pipeline

This project sets up a WordPress site with a MySQL database and phpMyAdmin for database management using Docker Compose. The deployment process is automated using Jenkins.

## Project Structure

- `docker-compose.yml`: Defines the services for WordPress, MySQL, and phpMyAdmin.
- `Jenkinsfile`: Jenkins pipeline script for automated deployment.

## Services

1. **MySQL Database**
    - Image: `mysql`
    - Environment Variables:
        - `MYSQL_ROOT_PASSWORD`: The root password for MySQL (default: `1234`).
        - `MYSQL_DATABASE`: The name of the database for WordPress (`wp_db`).
        - `MYSQL_USER`: MySQL user (`wp_user`).
        - `MYSQL_PASSWORD`: Password for the MySQL user (`1234`).

2. **WordPress**
    - Image: `wordpress:latest`
    - Ports: `2006:80` (Access WordPress at `http://localhost:2006`)
    - Environment Variables:
        - `WORDPRESS_DB_HOST`: MySQL host (`mysql_database:3306`).
        - `WORDPRESS_DB_USER`: MySQL user (`wp_user`).
        - `WORDPRESS_DB_PASSWORD`: MySQL password (`1234`).
        - `WORDPRESS_DB_NAME`: MySQL database name (`wp_db`).

3. **phpMyAdmin**
    - Image: `phpmyadmin/phpmyadmin`
    - Ports: `2005:80` (Access phpMyAdmin at `http://localhost:2005`)
    - Environment Variables:
        - `PMA_HOST`: MySQL host (`mysql_database`).
        - `MYSQL_ROOT_PASSWORD`: MySQL root password (`1234`).

## Volumes

- **mysql**: Persists MySQL data in the host machine.

## Jenkins Pipeline

The Jenkins pipeline (`Jenkinsfile`) includes the following stages:

1. **Checkout**: Pulls the latest code from the repository.
2. **Deploy**: Runs `docker-compose up -d` to start the services in detached mode.
3. **Post Actions**: Cleans up unused Docker resources with `docker system prune -f`.

## Prerequisites

- Docker
- Docker Compose
- Jenkins

## Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/your-repo/your-project.git
   cd your-project
