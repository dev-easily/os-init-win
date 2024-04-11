############# ����SDK #############
chcp 65001
Write-Host "��װ��������node"
scoop install nodejs-lts
npm config set registry https://registry.npmmirror.com

Write-Host "��װ��������python"
scoop install python
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
# for pip search
pip config set global.index https://mirrors.aliyun.com/pypi
pip config set global.trusted-host mirrors.aliyun.com

Write-Host "��װ��������go"
scoop install go
go env -w GO111MODULE=on
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

Write-Host "��װ��������jdk21"
scoop install openjdk

Write-Host "���ÿ�������maven3���������������� Idea �Դ��� maven��"
# scoop install maven
Write-Host "�����ʹ���ҵ�����"
New-Item -Path $env:USERPROFILE\.m2\settings.xml -Type File -Force

@'
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">

    <localRepository>D:\DEV\mvn_repository</localRepository>
    <repositories>
            <repository>
                    <id>spring</id>
                    <url>https://maven.aliyun.com/repository/spring</url>
                    <releases>
                            <enabled>true</enabled>
                    </releases>
                    <snapshots>
                            <enabled>true</enabled>
                    </snapshots>
            </repository>
    </repositories>
    <mirrors>
            <mirror>
                    <id>aliyunmaven</id>
                    <mirrorOf>*</mirrorOf>
                    <name>�����ƹ����ֿ�</name>
                    <url>https://maven.aliyun.com/repository/public</url>
            </mirror>
    </mirrors>
    <interactiveMode>true</interactiveMode>
    <usePluginRegistry>false</usePluginRegistry>
    <offline>false</offline>
</settings>
'@ > $env:USERPROFILE\.m2\settings.xml