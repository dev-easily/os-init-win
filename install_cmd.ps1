param(
    $name=""
)


$root_path=scoop config root_path
$reg_file=$root_path + "\apps\$name\install-context.reg"

scoop uninstall $name
scoop install $name
if (Test-Path -Path $reg_file) {
    Write-Host "importing $reg_file"
    reg import $reg_file
}