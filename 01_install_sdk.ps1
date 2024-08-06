chcp 65001
## c++
./install_cmd.ps1 mingw

## end c++

## rust
[Environment]::SetEnvironmentVariable('RUSTUP_DIST_SERVER', "https://rsproxy.cn", 'User')
$env:RUSTUP_DIST_SERVER = "https://rsproxy.cn"
[Environment]::SetEnvironmentVariable('RUSTUP_UPDATE_ROOT', "https://rsproxy.cn/rustup", 'User')
$env:RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"

./install_cmd.ps1 rustup # or scoop si rustup

New-Item -Path $env:USERPROFILE\.cargo\config -Type File -Force -Value(
@'
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index"
'@
)
Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vs_BuildTools.exe' -OutFile "$env:TEMP\vs_BuildTools.exe"

& "$env:TEMP\vs_BuildTools.exe" --passive --wait --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --remove Microsoft.VisualStudio.Component.VC.CMake.Project	

./install_cmd.ps1 cmake
## end rust

## node
./install_cmd.ps1 nodejs-lts
npm config set registry https://registry.npmmirror.com
npm install -g pnpm
pnpm setup
## pnpm config set global-bin-dir $env:PNPM_HOME\bin
[Environment]::SetEnvironmentVariable('ELECTRON_MIRROR', "https://npmmirror.com/mirrors/electron/", 'User')
[Environment]::setEnvironmentVariable('ELECTRON_CUSTOM_DIR', "30.0.6",'User')
[Environment]::setEnvironmentVariable('ELECTRON_BUILDER_BINARIES_MIRROR', "https://npmmirror.com/mirrors/electron-builder-binaries/",'User')
## end node

## python
./install_cmd.ps1 python
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
pip config set global.index https://mirrors.aliyun.com/pypi
pip config set global.trusted-host mirrors.aliyun.com
pip install setuptools
## end python

## go
./install_cmd.ps1 go@1.22.3
go env -w GO111MODULE=on
go env -w GOPROXY=https://mirrors.aliyun.com/goproxy/,direct
## end go

## jdk17
./install_cmd.ps1 openjdk17

# -Dmaven.multiModuleProjectDirectory=$MAVEN_HOME -Dmaven.wagon.http.ssl.insecure=true -Dmaven.wagon.http.ssl.allowall=true -Dmaven.wagon.http.ssl.ignore.validity.dates=true
New-Item -Path $env:USERPROFILE\.m2\settings.xml -Type File -Force -Value(
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
     <name>aliyun</name>
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
     <name>aliyun-apache-snapshots</name>
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
'@
)
## end jdk17

## redis
scoop install redis
# redis-server.exe
## end redis

## mysql 8
scoop install mysql-lts
# mysqld --console
## end mysql 8