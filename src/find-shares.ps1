
$hostname = "localhost";
$user = $(Get-WMIObject -class Win32_ComputerSystem | select username).username
$outfile = "console";
$result = @();

for ($i = 0; $i -lt $args.Length; $i++) {
    
    if ($args[$i] -eq "--hostname") {
        $hostname = $args[$i + 1];
        $i++;
    }

    if ($args[$i] -eq "--user") {
        $user = $args[$i + 1];
        $i++;
    }

    if ($args[$i] -eq "--out") {
        $outfile = $args[$i + 1];
        $i++;
    }
}

$shares = Get-WmiObject -class Win32_Share -computer $hostname

foreach ($share in $shares) {
    $obj = New-Object psobject;
    Add-Member -InputObject $obj -MemberType NoteProperty -Name User -Value $user;
    Add-Member -InputObject $obj -MemberType NoteProperty -Name Path -Value $share.Path;

    $result += $obj;
}

if ($outfile -eq "console") {
    Write-Output $result;
} else {
    foreach($r in $result) {
        $( $r.User + "; " + $r.Path + "; ") | Out-File -FilePath 'out.csv' -Append
    }
}

