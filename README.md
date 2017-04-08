# mysql-sat
## Classwork for 4-8-17

Shit I learned during class that wasn't necessarily taught in class.
**Error:** `database already exists` 
**Fix:** `CREATE DATABASE IF NOT EXISTS` 

Then,

**Error:** `table already exists` 
**Fix:** `CREATE DATABASE IF NOT EXISTS` 

What to include in order to read from .csv file?

```
LOAD DATA INFILE '[filepath]'
INTO TABLE [table_name]
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

```
After adding this into my Schema.sql file I was getting errors `The MySQL server is running with the --secure-file-priv option so it cannot execute this statement`

Process to fix this:

In mysql shell run:
`SHOW VARIABLES LIKE "secure_file_priv";`
It should return something that looks like this:
*this is before it was fixed*
```
+------------------+-------+
| Variable_name    | Value |
+------------------+-------+
| secure_file_priv |  NULL |
+------------------+-------+
1 row in set (0.00 sec)

```
I created a my.cnf file (since there wasn't already one) in /etc/my.cnf
I checked this file `vim /usr/local/Cellar/mysql/5.7.16/support-files/mysql.server` to double check that's were it needed to go
and included this info:

```
[client]
loose-local-infile=1
user = root

[mysqld]
secure-file-priv = ""

```
Then I restarted the service to reload the config files:

`mysql.server restart`

Then went back into mysql and re-ran `SHOW VARIABLES LIKE "secure_file_priv";` and

```
+------------------+-------+
| Variable_name    | Value |
+------------------+-------+
| secure_file_priv |       |
+------------------+-------+
1 row in set (0.00 sec)
```
and then reran the `LOAD FILE INTO` command and then...

### BAMMM!
`5000 rows in set (0.01 sec)`

`INSERT mic_drop INTO`

