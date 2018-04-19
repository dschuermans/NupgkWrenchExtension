[CmdletBinding()]
param()
begin{
    
}
process
{
    tfx extension create --manifests vss-extension.json
}
end{

}