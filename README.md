## PHP7 fpm alpine 

Image with few additional php extensions, used for automated builds on docker hub

### Extensions

```
mbstring
intl
simplexml
pdo
pdo_mysql
gd
redis
```

### Docker Compose example

CakePHP 3 app.  
Running this php7-fpm image with nginx, mariadb, redis.

```
version: '3'
services:
  web:
    image: nginx:alpine
    ports:
      - "8080:80"
    volumes:
      - .:/var/www
      - ./config/nginx.conf:/etc/nginx/conf.d/default.conf
    depends_on:
      - fpm
      - db
  fpm:
    image: luboson/php7-fpm-alpine:latest
    volumes:
      - .:/var/www
    working_dir: /var/www
    depends_on:
      - redis
  db:
    image: mariadb:latest
    volumes:
      - ./config/sql:/docker-entrypoint-initdb.d
    environment: 
      - MYSQL_ROOT_PASSWORD=secret
      - MYSQL_DATABASE=my_app
      - MYSQL_USER=my_app
      - MYSQL_PASSWORD=secret
  redis:
    image: redis:alpine
networks:
  default:
    driver: bridge
```
