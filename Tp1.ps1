
Import-Module ActiveDirectory
$path="OU=Comptable,DC=formation,DC=local" # Unite Organisation AD
New-ADGroup "TP" -Path -GroupCategory distribution -GroupScope universel  # groupe pour nos utilisateurs


$UserCVS = New-Item -ItemType file -Path C:\Users.cvs #Fichier de type CVS pour sauvegarder le comptes AD
$NbUser = Read-Host "Tapez le nombre d'utilisateur à créer "
$count=1..$Nbuser 

foreach ($i in $count){   # On boucle jusqu'a ce qu'au dernier utilisateur
    $FirstName = Read-Host "Prenom "
    $Login = read-host "Login  "
    $Mail = read-host "Mail "
    $PassWord = read-host "Mot de Passe "
    # Commande New-ADuser pour creer un utilisateur ad
    #Enable-ADAccount -Identity $Login inutile on active avec la commande new-aduser parametre enable
    New-ADUser -GivenName $FirstName -SamAccountName $Login -UserPrincipalName $Mail -AccountPassword $PassWord ConvertTo-SecureString -AsPlainText -Force -Enabled $true
    Add-ADGroupMember -Identity TP -Members $Login
    $User = "$($FirstName),$($Login),$($Mail),$($PassWord)" 
    # On creer une variable $User pou l'enregistrer dans notre fichier CVS 
    Add-Content $UserCVS -Value ($User)
}
