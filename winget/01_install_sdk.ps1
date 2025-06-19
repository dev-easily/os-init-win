# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-Cpp {
    winget install -e --id MSYS2.Mingw --location "D:\winget_apps\MSYS2.Mingw"
}

function Install-Rust {
    [Environment]::SetEnvironmentVariable('RUSTUP_DIST_SERVER', "https://rsproxy.cn", 'User')
    $env:RUSTUP_DIST_SERVER = "https://rsproxy.cn"
    [Environment]::SetEnvironmentVariable('RUSTUP_UPDATE_ROOT', "https://rsproxy.cn/rustup", 'User')
    $env:RUSTUP_UPDATE_ROOT = "https://rsproxy.cn/rustup"
    winget install -e --id Rustlang.Rustup --location "D:\winget_apps\Rustlang.Rustup"
    New-Item -Path $env:CARGO_HOME\config.toml -Type File -Force -Value(
    @'
[source.crates-io]
replace-with = 'ustc'

[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
'@
    )
    Invoke-WebRequest -Uri 'https://aka.ms/vs/17/release/vs_BuildTools.exe' -OutFile "$env:TEMP\vs_BuildTools.exe"
    & "$env:TEMP\vs_BuildTools.exe" --passive --wait --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended --remove Microsoft.VisualStudio.Component.VC.CMake.Project
    winget install -e --id Kitware.CMake --location "D:\winget_apps\Kitware.CMake"
    cargo install crm
    crm use ustc-sparse
}

function Install-Node {
    winget install -e --id OpenJS.NodeJS.LTS --location "D:\winget_apps\OpenJS.NodeJS.LTS"
    npm config set registry https://registry.npmmirror.com
    npm install -g pnpm
    pnpm setup
    [Environment]::SetEnvironmentVariable('ELECTRON_MIRROR', "https://npmmirror.com/mirrors/electron/", 'User')
    [Environment]::setEnvironmentVariable('ELECTRON_CUSTOM_DIR', "30.0.6",'User')
    [Environment]::setEnvironmentVariable('ELECTRON_BUILDER_BINARIES_MIRROR', "https://npmmirror.com/mirrors/electron-builder-binaries/",'User')
}

function Install-Python {
    winget install -e --id Python.Python.3 --location "D:\winget_apps\Python.Python.3"
    pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
    pip config set global.index https://mirrors.aliyun.com/pypi
    pip config set global.trusted-host mirrors.aliyun.com
    pip install setuptools
}

function Install-Go {
    winget install -e --id GoLang.Go --location "D:\winget_apps\GoLang.Go"
    go env -w GO111MODULE=on
    go env -w GOPROXY=https://goproxy.cn,direct
    go install golang.org/x/tools/cmd/godoc@latest
}

function Install-JDK17 {
    winget install -e --id Oracle.JavaRuntimeEnvironment --location "D:\winget_apps\Oracle.JavaRuntimeEnvironment"
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
}

function Install-Flutter {
    $env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
    $env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
    New-Item -Path "$env:USERPROFILE\dev" -ItemType Directory
    cd "$env:USERPROFILE\dev"
    [System.Environment]::SetEnvironmentVariable('PUB_HOSTED_URL', 'https://pub.flutter-io.cn', 'User')
    [System.Environment]::SetEnvironmentVariable('FLUTTER_STORAGE_BASE_URL', 'https://storage.flutter-io.cn', 'User')
    Invoke-WebRequest -Uri "https://storage.flutter-io.cn/flutter_infra_release/releases/stable/windows/flutter_windows_3.24.5-stable.zip" -OutFile flutter-latest.zip
    Expand-Archive .\flutter-latest.zip
    $newPath = "$pwd\flutter-latest\flutter\bin;$env:PATH"
    [System.Environment]::SetEnvironmentVariable('Path', $newPath, 'User')
    $env:PATH = $pwd.PATH + "flutter-latest\flutter\bin",$env:PATH -join ";"
    ~\dev\flutter-latest\flutter\bin\flutter doctor
    ~\dev\flutter-latest\flutter\bin\flutter config --no-analytics
}

# 主入口
Install-Cpp
Install-Rust
Install-Node
Install-Python
Install-Go
Install-JDK17
Install-Flutter 