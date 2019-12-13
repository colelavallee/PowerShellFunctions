function touch {
    param (
        [Parameter(Mandatory = $true)][string]$Filename
    )
    echo $null >> $Filename

}