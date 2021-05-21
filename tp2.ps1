$StockProcess ="c:\StockProcess" # Variable repertoire pour stocker la liste des processus
$DossierPartage = "c:\Partage\" #  variable repertoire de partage pour y copier les fichiers du repertoire $StockProcess ="c:\StockProcess"
New-SmbShare -Name Partage -Path $DossierPartage -FullAccess "administrateur" # On crée un partage avec des droits administrateur
New-Item $StockProcess -ItemType directory # Repertoire local pour stocker nos processus
Get-Process | Add-Content "$($StockProcess)\process.txt"
Copy-Item $StockProcess -recurse -Destination $DossierPartage 
