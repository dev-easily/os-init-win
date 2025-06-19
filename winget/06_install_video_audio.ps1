# 注意：winget 的 --location 参数仅对部分支持的包生效，大多数 EXE 包不支持自定义安装目录。
# 本脚本已为所有安装命令指定 --location "D:\winget_apps\<软件名>"，如遇报错可去掉该参数。

function Install-VideoAudio {
    winget install -e --id VideoLAN.VLC --location "D:\winget_apps\VideoLAN.VLC"
    winget install -e --id HandBrake.HandBrake --location "D:\winget_apps\HandBrake.HandBrake"
    winget install -e --id NickeManarin.ScreenToGif --location "D:\winget_apps\NickeManarin.ScreenToGif"
    winget install -e --id FlorianHeidenreich.Mp3tag --location "D:\winget_apps\FlorianHeidenreich.Mp3tag"
    winget install -e --id Daum.PotPlayer --location "D:\winget_apps\Daum.PotPlayer"
}

# 主入口
Install-VideoAudio 