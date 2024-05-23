chcp 65001
## node
./install_cmd.ps1 nodejs-lts
npm config set registry https://registry.npmmirror.com
[Environment]::SetEnvironmentVariable('ELECTRON_MIRROR', "https://npmmirror.com/mirrors/electron/", 'User')
[Environment]::setEnvironmentVariable('ELECTRON_CUSTOM_DIR', "30.0.6",'User')
[Environment]::setEnvironmentVariable('ELECTRON_BUILDER_BINARIES_MIRROR', "https://npmmirror.com/mirrors/electron-builder-binaries/",'User')

## python
./install_cmd.ps1 python
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set global.index https://mirrors.aliyun.com/pypi
pip config set global.trusted-host mirrors.aliyun.com
pip install setuptools

## go
./install_cmd.ps1 go
go env -w GO111MODULE=on
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

./install_cmd.ps1 openjdk17

New-Item -Path $env:USERPROFILE\.m2\settings.xml -Type File -Force
# -Dmaven.multiModuleProjectDirectory=$MAVEN_HOME -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true
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
     <name>阿里云公共仓库</name>
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
     <name>阿里云阿帕奇仓库</name>
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


scoop install redis
# redis-server.exe
scoop install mysql-lts
# mysqld --console