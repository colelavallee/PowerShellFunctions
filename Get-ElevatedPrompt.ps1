param([switch]$Elevated)
function Get-AdminStatus {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Get-AdminStatus) -eq $false) {
    if ($elevated) {
        # could not elevate, quit
    }
 
    else {
 
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}