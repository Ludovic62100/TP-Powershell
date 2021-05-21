$Trigger= New-ScheduledTaskTrigger -At 10:00am –Daily # On execute le script de sauvegarde tous les jours à 10h00
$User= "NT AUTHORITY\SYSTEM" # On autorise le compte SYSTEM à exeuter le script de sauvegarde
$Action= New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "C:\PS\TP2.ps1" # On execute le script de sauvegarde TP2.txt
Register-ScheduledTask -TaskName "BackupProcess" -Trigger $Trigger -User $User -Action $Action -RunLevel Highest –Force # On execute la commande powershell pour automatiser une tache avec les parametres preelablement renseignes dans les variables ci-dessus
