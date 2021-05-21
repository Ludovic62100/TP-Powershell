# On auto-eleve les droits en administrateur # source -> https://www.ipgirl.com/7583/powershell-executer-une-commande-en-tant-quadministrateur.html

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
 { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit } 
  

$StockProcess ="c:\StockProcess" # Variable repertoire pour stocker la liste des processus
New-Item $StockProcess -ItemType directory # Repertoire local pour stocker nos processus
$DossierPartage = "c:\Partage\" #  variable repertoire de partage pour y copier les fichiers du repertoire $StockProcess ="c:\StockProcess"
New-Item $DossierPartage -ItemType directory # Repertoire local pour stocker nos processus
New-SmbShare -Name Partage -Path $DossierPartage -FullAccess "administrateur" # On crée un partage avec des droits administrateur
Get-Process | Add-Content "$($StockProcess)\process.txt"
Copy-Item $StockProcess -recurse -Destination $DossierPartage 

