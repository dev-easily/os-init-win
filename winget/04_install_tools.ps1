# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-Tools {
    winget install -e --id Microsoft.PowerToys --location "D:\winget_apps\Microsoft.PowerToys"
    winget install -e --id JanDeDobbeleer.OhMyPosh --location "D:\winget_apps\JanDeDobbeleer.OhMyPosh"
    winget install -e --id Microsoft.CascadiaCode --location "D:\winget_apps\Microsoft.CascadiaCode"
    winget install -e --id PaddyXu.QuickLook --location "D:\winget_apps\PaddyXu.QuickLook"
    winget install -e --id openark.openark --location "D:\winget_apps\openark.openark"
    winget install -e --id Code52.Carnac --location "D:\winget_apps\Code52.Carnac"
    winget install -e --id oldj.SwitchHosts --location "D:\winget_apps\oldj.SwitchHosts"
    winget install -e --id Rufus.Rufus --location "D:\winget_apps\Rufus.Rufus"
    winget install -e --id Sylveon.TranslucentTB --location "D:\winget_apps\Sylveon.TranslucentTB"
    winget install -e --id Notepad++.Notepad++ --location "D:\winget_apps\Notepad++.Notepad++"
    winget install -e --id NirSoft.ShellMenuView --location "D:\winget_apps\NirSoft.ShellMenuView"
}

# 主入口
Install-Tools 