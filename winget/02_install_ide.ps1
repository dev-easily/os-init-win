# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-CommonTools {
    winget install -e --id GNU.Grep --location "D:\winget_apps\GNU.Grep"
}

function Install-IDE {
    winget install -e --id Microsoft.VisualStudioCode --location "D:\winget_apps\Microsoft.VisualStudioCode"
    winget install -e --id Figma.Figma --location "D:\winget_apps\Figma.Figma"
    winget install -e --id Mozilla.FirefoxDeveloperEdition --location "D:\winget_apps\Mozilla.FirefoxDeveloperEdition"
    winget install -e --id Apifox.Apifox --location "D:\winget_apps\Apifox.Apifox"
    winget install -e --id ArduinoSA.IDE --location "D:\winget_apps\ArduinoSA.IDE"
}

# 主入口
Install-CommonTools
Install-IDE 