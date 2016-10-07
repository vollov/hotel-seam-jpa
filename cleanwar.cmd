set APP_NAME=hotel
set CATALINA_HOME=e:\a0\tomcat\6.0.45\

set war_file=%CATALINA_HOME%\webapps\%APP_NAME%.war
IF EXIST %war_file% del /F %war_file%

set exploded_dir=%CATALINA_HOME%\webapps\%APP_NAME%
IF EXIST %exploded_dir% rmdir /s /q %exploded_dir%

set cache_dir=%CATALINA_HOME%\work\Catalina\localhost\%APP_NAME%
IF EXIST %cache_dir% rmdir /s /q %cache_dir%
