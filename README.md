# hotel-seam-jpa
Demo development environment with JBoss Seam JPA, tomcat, and TestNG

## jboss-seam-2.2.1.Final
- use the lib dir to load the embeded jboss seam for testng
- add mysql-ds.xml to bootstrap/deploy folder
- use testresources to load JPA configuration for testng

##Tomcat
- use tomcat persistance.xml
- add datasource

## JBoss 7.1.0
- use jboss persistance.xml
- add datasource



### Tomcat 6 datasource
add below to $TOMCAT_HOME\conf\context.xml

<Resource name="jdbc/hoteljpaDS" auth="Container" type="javax.sql.DataSource"
               maxActive="100" maxIdle="30" maxWait="10000"
               username="root" password="justdoit" driverClassName="com.mysql.jdbc.Driver"
               url="jdbc:mysql://localhost:3306/hotel_jpa"/>

persistence.xml
<!-- Tomcat -->
<non-jta-data-source>java:/comp/env/jdbc/hoteljpaDS</non-jta-data-source>

###Jboss 7 datasource
$JBOSS_HOME\standalone\configuration\standalone-full.xml
<datasource jta="true" jndi-name="java:jboss/datasources/hoteljpaDS" pool-name="hoteljpaPool" enabled="true">
    <connection-url>jdbc:mysql://localhost:3306/hotel_jpa</connection-url>
    <driver-class>com.mysql.jdbc.Driver</driver-class>
    <driver>mysql</driver>
    <pool>
        <min-pool-size>5</min-pool-size>
        <max-pool-size>20</max-pool-size>
    </pool>
    <security>
        <user-name>root</user-name>
        <password>justdoit</password>
    </security>
</datasource>
<drivers>
    <driver name="mysql" module="com.mysql"/>
    <driver name="h2" module="com.h2database.h2">
        <xa-datasource-class>org.h2.jdbcx.JdbcDataSource</xa-datasource-class>
    </driver>
</drivers>