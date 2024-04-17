@echo off
set dn=Info
set rp=HKEY_CURRENT_USER\Software\Classes\CLSID
:: reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration14XCS /f  %针对navicat15%
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Registration16XCS /f
reg delete HKEY_CURRENT_USER\Software\PremiumSoft\NavicatPremium\Update /f
echo 查找中.....
for /f "tokens=*" %%a in ('reg query "%rp%"') do (
 echo %%a
for /f "tokens=*" %%l in ('reg query "%%a" /f "%dn%" /s /e ^|findstr /i "%dn%"') do (
  echo 正在删除：%%a
  reg delete %%a /f
)
)
echo 完成重置！
 
pause
exit