# powershell-find-fileshares

The script returns by default a Array with { User: string, Path: string }


Simply call wothout parameters to find all shares in current computer with current user.

    .\find-shares.ps1

To find shares on a remote machine, use parameter "--hostname".

    .\find-shares.ps1 --hostname my-remote-server

To check for a different user, use parameter "--user".

    .\find-shares.ps1 --user username

To pipe output to a custom csv file use "--out".

    .\find-shares.ps1 --out output.csv