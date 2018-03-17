#copy-VMFile DockerForWinVM -SourcePath "C:\Users\P&G\Documents\BP-SH\DockerForWindows\sol10MvcInDepth\*" -DestinationPath "C:\users\vagrant\app\sol10MvcInDepth" -CreateFullPath -FileSource Host

$SRCFolder = "C:\Users\P&G\Documents\BP-SH\DockerForWindows\sol10MvcInDepth"
$DSTFolder = "C:\Users\vagrant\app\sol10MvcInDepth\"

foreach ($File in (Get-ChildItem $SRCFolder -recurse | ? Mode -ne 'd-----'))
{

 $newfile = $($File.FullName).replace($SRCFolder,$DSTFolder)


 Copy-VMFile DockerForWinVM -SourcePath $file.fullname -DestinationPath $newfile -FileSource Host -CreateFullPath -Force
 
 }
