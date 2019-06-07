# 学生成绩管理系统

## 使用说明

#### 1.新建数据库ssms，将ssms.sql导入该数据库

#### 2.用解压文件打开ssms.war, 打开ssms.war\WEB-INF\classes\c3p0-config.xml文件，修改服务器所在数据库用户名和密码

#### 3.将ssms.war文件放入tomcat/webapps目录下

#### 4.启动Tomcat服务器

#### 5.打开浏览器，输入 localhost:8080/ssms 进入登录界面

#### 6.输入用户名和密码访问系统

##### 对应角色编号：

​	管理员:1       学生：2	   教师:3	

![01](assert\01.png)

##### note:可将ssms.zip项目文件导入eclipse、Intellij使用，须将src下c3p0-config.xml中的用户名和密码改为自己数据库的用户名和密码。