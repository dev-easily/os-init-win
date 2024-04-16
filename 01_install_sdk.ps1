############# ����SDK #############
chcp 65001
Write-Host "��װ��������node"
scoop install nodejs-lts
npm config set registry https://registry.npmmirror.com
[Environment]::SetEnvironmentVariable('ELECTRON_MIRROR', "https://npmmirror.com/mirrors/electron/", 'User')
[Environment]::setEnvironmentVariable('ELECTRON_CUSTOM_DIR', "{{ version }}",'User')

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

Write-Host "��װ��������jdk17"
scoop install openjdk17

Write-Host "���ÿ�������maven3���������������� Idea �Դ��� maven��"
# scoop install maven
Write-Host "�����ʹ���ҵ�����"
New-Item -Path $env:USERPROFILE\.m2\settings.xml -Type File -Force

@'
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <localRepository/>
  <interactiveMode/>
  <usePluginRegistry/>
  <offline/>
  <pluginGroups/>
  <servers/>
  <mirrors>
    <mirror>
     <id>aliyunmaven</id>
     <mirrorOf>central</mirrorOf>
     <name>�����ƹ����ֿ�</name>
     <url>https://maven.aliyun.com/repository/central</url>
    </mirror>
    <mirror>
      <id>repo1</id>
      <mirrorOf>central</mirrorOf>
      <name>central repo</name>
      <url>http://repo1.maven.org/maven2/</url>
    </mirror>
    <mirror>
     <id>aliyunmaven</id>
     <mirrorOf>apache snapshots</mirrorOf>
     <name>�����ư�����ֿ�</name>
     <url>https://maven.aliyun.com/repository/apache-snapshots</url>
    </mirror>
  </mirrors>
  <proxies/>
  <activeProfiles/>
  <profiles>
    <profile>  
        <repositories>
           <repository>
                <id>aliyunmaven</id>
                <name>aliyunmaven</name>
                <url>https://maven.aliyun.com/repository/public</url>
                <layout>default</layout>
                <releases>
                        <enabled>true</enabled>
                </releases>
                <snapshots>
                        <enabled>true</enabled>
                </snapshots>
            </repository>
            <repository>
                <id>MavenCentral</id>
                <url>http://repo1.maven.org/maven2/</url>
            </repository>
            <repository>
                <id>aliyunmavenApache</id>
                <url>https://maven.aliyun.com/repository/apache-snapshots</url>
            </repository>
        </repositories>
        <pluginRepositories>
            <pluginRepository>
                <id>aliyun-plugin</id>
                <url>https://maven.aliyun.com/repository/public</url>
                <releases>
                    <enabled>true</enabled>
                </releases>
                <snapshots>
                    <enabled>false</enabled>
                </snapshots>
            </pluginRepository>
        </pluginRepositories>             
     </profile>
  </profiles>
</settings>
'@ > $env:USERPROFILE\.m2\settings.xml