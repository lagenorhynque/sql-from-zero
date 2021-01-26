# sql-from-zero

Study notes on [『SQL 第2版 ゼロからはじめるデータベース操作』](https://www.shoeisha.co.jp/book/detail/9784798144450).

## How to connect to databases

### 1. Start docker containers

```sh
$ docker-compose up -d
```

### 2-1. Connect to MySQL database

```sh
$ docker-compose exec mysql mysql -udev -p shop
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.23 MySQL Community Server - GPL

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>
```

### 2-2. Connect to MariaDB database

```sh
$ docker-compose exec mariadb mysql -udev -p shop
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 6
Server version: 10.5.8-MariaDB-1:10.5.8+maria~focal mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [shop]>
```

### 2-3. Connect to PostgreSQL database

```sh
$ docker-compose exec postgresql psql -Udev -dshop
psql (13.1 (Debian 13.1-1.pgdg100+1))
Type "help" for help.

shop=#
```
