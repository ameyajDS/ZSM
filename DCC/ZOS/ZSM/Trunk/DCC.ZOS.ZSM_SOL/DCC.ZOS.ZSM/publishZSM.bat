"C:\Windows\Microsoft.NET\Framework\v3.5\msbuild.exe" /t:publish "DCC.ZOS.ZSM.csproj"

md "d:\Bombay\CruiseControlBase\WorkingBase\DERA_APPS\DCC\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Web.Launcher\apps\zsm"

xcopy ".\bin\Debug\app.publish" "d:\Bombay\CruiseControlBase\WorkingBase\DERA_APPS\DCC\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDF.Web.Launcher\apps\zsm" /Y /S

xcopy ".\bin\debug\rpt\*.rpt" "D:\Bombay\CruiseControlBase\WorkingBase\DERA_APPS\DCC\UMB\CDF\Trunk\DCC.UMB.CDF_SOL\DCC.UMB.CDFWS\Reports\ZSM\" /Y /S
pause
