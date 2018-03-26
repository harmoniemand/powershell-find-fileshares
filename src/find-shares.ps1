$machinename = "machinename"

$users = @("user1")

$users | ForEach-Object {
    $user = $_
    $shares = Get-WmiObject -class Win32_Share -computer $machinename

    $shares | ForEach-Object {
        $share = $_

        $( $user + "; " + $share.Path + "; ") | Out-File -FilePath 'out.csv' -Append
    }
}