# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-Games {
    winget install -e --id Valve.Steam --location "D:\winget_apps\Valve.Steam"
    winget install -e --id EpicGames.EpicGamesLauncher --location "D:\winget_apps\EpicGames.EpicGamesLauncher"
}

# 主入口
Install-Games 