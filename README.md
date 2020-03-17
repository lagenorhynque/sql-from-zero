# sql-from-zero

Study notes on [『SQL 第2版 ゼロからはじめるデータベース操作』](https://www.shoeisha.co.jp/book/detail/9784798144450).

## How to connect to databases

### 1. Start docker containers

```sh
$ docker-compose up -d
```

### 2-1. Connect to MariaDB database

```sh
$ mysql -h127.0.0.1 -udev -p shop
Enter password:
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 7
Server version: 10.5.1-MariaDB-1:10.5.1+maria~bionic mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [shop]>
```


### 2-2. Connect to PostgreSQL database

```sh
$ psql -h127.0.0.1 -p5432 -Udev -dshop
Password for user dev:
psql (12.2)
Type "help" for help.

shop=#
```
