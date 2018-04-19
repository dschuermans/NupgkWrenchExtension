[CmdletBinding()]
param(
    [string]$NupkgWrench,
    [string]$Command,
    [string]$CommandArguments,
    [string]$CommandOptions,
    [string]$SubCommand
)

begin
{
    if(-Not $NupkgWrench){
        $NupkgWrench = ".\exe\NupkgWrench.exe"
    }
    
    Write-Host "# Settings:"
    Write-Host "    NupkgWrench: $NupkgWrench"
    Write-Host "    Command: $Command"
    
    if($SubCommand){
        Write-Host "    Sub-Command: $SubCommand"
    }

    Write-Host "    Arguments: $CommandArguments"
    Write-Host "    Options: $CommandOptions"
}

process
{
    $combined = $CommandArguments.Split(' ') + $CommandOptions.Split(' ')

    if($SubCommand) {
        Write-Verbose "Executing command: $Command $SubCommand $CommandArguments $CommandOptions"    
        & $NupkgWrench $Command $SubCommand $combined
    } else {
        Write-Verbose "Executing command: $Command $CommandArguments $CommandOptions"
        & $NupkgWrench $Command $combined
    }
}

end
{

}