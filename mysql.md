## 配置
### ubuntu 24.04
#### 安装mysql
```bash
sudo apt-get update
sudo apt-get install mysql-server # 安装mysql服务端
sudo apt-get install mysql-client # 安装mysql客户端
```
#### 配置mysql
```bash
sudo mysql_secure_installation # 安全配置mysql
```
出现如下状况：
> 
(base) sunsky@sunsky-huawei:~$ sudo mysql_secure_installation

Securing the MySQL server deployment.

Connecting to MySQL using a blank password.

VALIDATE PASSWORD COMPONENT can be used to test passwords
and improve security. It checks the strength of password
and allows the users to set only those passwords which are
secure enough. Would you like to setup VALIDATE PASSWORD component?

Press y|Y for Yes, any other key for No:
>
输入n，不开启VALIDATE安全，继续执行下一步。
>
There are three levels of password validation policy:

LOW    Length >= 8
MEDIUM Length >= 8, numeric, mixed case, and special characters
STRONG Length >= 8, numeric, mixed case, special characters and dictionary                  file

Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:
>
简单的课程设计作业，选择0，继续执行下一步。
>
Skipping password set for root as authentication with auth_socket is used by default.
If you would like to use password authentication instead, this can be done with the "ALTER_USER" command.
See https://dev.mysql.com/doc/refman/8.0/en/alter-user.html#alter-user-password-management for more information.

By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) :
>
为了方便（偷懒），选择n，跳过匿名用户的删除。
>
... skipping.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : 
>
选择n，跳过远程root登录的禁止。
>
 ... skipping.
By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : 
>
选择n，跳过测试数据库的删除。
>
 ... skipping.
Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : 
>
选择y，重新加载权限表。
>
Success.

All done!
>
完成配置。
#### 测试mysql
```bash
    systemctl status mysql.service
```
出现如下状况就说明mysql服务启动成功：
>
(base) sunsky@sunsky-huawei:~$ systemctl status mysql.service
● mysql.service - MySQL Community Server
     Loaded: loaded (/usr/lib/systemd/system/mysql.service; enabled; preset: en>
     Active: active (running) since Fri 2024-11-22 08:32:24 CST; 12min ago
    Process: 8466 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=e>
   Main PID: 8479 (mysqld)
     Status: "Server is operational"
      Tasks: 39 (limit: 18314)
     Memory: 364.8M (peak: 378.1M)
        CPU: 7.101s
     CGroup: /system.slice/mysql.service
             └─8479 /usr/sbin/mysqld

11月 22 08:32:23 sunsky-huawei systemd[1]: Starting mysql.service - MySQL Commu>
11月 22 08:32:24 sunsky-huawei systemd[1]: Started mysql.service - MySQL Commun>
lines 1-14/14 (END)
>

```sql
CREATE USER 'sunsky'@'locolhost' IDENTIFIED BY 'mysqlmima';
SELECT user,authentication_string,plugin,host FROM mysql.user;
```

