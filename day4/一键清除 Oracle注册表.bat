@echo off&&setlocal enabledelayedexpansion  
color 0a  
:start  
for /f "tokens=2 delims==" %%a in ('path') do (  
    set "str=%%a"  
    set str=!str: =+!  
    for %%i in (!str!) do (  
        set "var=%%i"  
        set var=!var:+= !  
        echo !var!>>change.txt  
    for /f "delims=" %%i in ('findstr "oracle" change.txt') do set var=%%i  
    )  
      
)  
echo======================================================================================  
echo 1、停止服务  2、删除oracle安装文件   3、删除oracle安装目录   4、清除注册表   5、退出  
echo  
echo  作者:乔磊   
echo======================================================================================  
del /q change.txt  
set /p choice=请选择:  
if %choice%==1 goto stop  
if %choice%==2 goto del  
if %choice%==3 goto delContent  
if %choice%==4 goto delRegedit  
if %choice%==5 goto exit  
goto start  
:exit  
exit  
:stop  
echo 正在停止所有oracle的相关服务......  
net stop OracleDBConsoleDOG  
net stop OracleDBConsoleorcl  
net stop OracleJobSchedulerDOG  
net stop OracleJobSchedulerORCL  
net stop OracleOraDb10g_home1iSQL*Plus  
net stop OracleOraDb10g_home1TNSListener  
net stop OracleServiceDOG  
net stop OracleServiceORCL  
goto start  
:del  
echo 正在开始删除oracle安装文件......  
for /f "tokens=1,2,3,4,5 delims=\" %%a in ("%var%") do set var=%%a\%%b\%%c\%%d\%%e  
start %var%\oui\bin\setup.exe  
goto start  
:delContent  
for /f "tokens=1,2 delims=\" %%a in ("%var%") do set var=%%a\%%b  
rd /s /q "%var%"  
for /f "delims=W" %%i in ("%windir%") do set var=%%i  
rd /s /q "%var%"\progra~1\Oracle  
goto start  
:delRegedit  
echo 正在开始删除注册表中的oracle项值......  
REG DELETE "HKLM\SOFTWARE\ORACLE" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleDBConsoleDOG" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleDBConsoleorcl" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleJobSchedulerDOG" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleJobSchedulerORCL" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleOraDb10g_home1iSQL*Plus" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleOraDb10g_home1TNSListener" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleServiceDOG" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\OracleServiceORCL" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle Services for MTS" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle.dog" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle.oradb" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\Oracle.orcl" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\OracleDBConsoleDOG" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\OracleDBConsoleorcl" /f  
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\OracleOraDb10g_home1iSQL*Plus" /f  
goto start  