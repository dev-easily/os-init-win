# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-Office {
    winget install -e --id ONLYOFFICE.DesktopEditors --location "D:\winget_apps\ONLYOFFICE.DesktopEditors"
    winget install -e --id GoldenDict.GoldenDict --location "D:\winget_apps\GoldenDict.GoldenDict"
}

# 主入口
Install-Office 