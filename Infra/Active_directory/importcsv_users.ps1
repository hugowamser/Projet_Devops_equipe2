Clear-Host
Import-Module ActiveDirectory

# Création des OUs, sous OUs
New-ADOrganizationalUnit -Name Production -Path "dc=lille,dc=local"
New-ADOrganizationalUnit -Name Développement -Path "dc=lille,dc=local"
New-ADOrganizationalUnit -Name Support -Path "dc=lille,dc=local"

# # Création de grps
# New-ADGroup -Name "Dev" -GroupCategory Security -GroupScope Global -Path "OU=Groups,OU=IT,DC=lille,DC=local"
# New-ADGroup -Name "Admin" -GroupCategory Security -GroupScope Global -Path "OU=Groups,OU=IT,DC=lille,DC=local"
# New-ADGroup -Name "Paie" -GroupCategory Security -GroupScope Global -Path "OU=Groups,OU=RH,DC=lille,DC=local"
# New-ADGroup -Name "Compta" -GroupCategory Security -GroupScope Global -Path "OU=Groups,OU=RH,DC=lille,DC=local"


# Importation des utilisateurs depuis le fichier CSV
$users = import-csv -delimiter ";" -Path "C:\users.csv"


# Création des utilisateurs dans les OUs
foreach ($user in $users)
{ 
    $name = $user.Prenom + " " + $user.Nom
    $fName = $user.Prenom
	$firstLetterName = $fName.substring(0, 1)
	$SAM = $firstLetterName + $user.Nom
	$password = "Paheboer1"
	
	$ou = $null
	$groupOU = $null

	function CheckIfUserExists {
		param (
			[Parameter(Mandatory=$true)]
			[string]$SamAccountName
		)
		$ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$SamAccountName'" -ErrorAction SilentlyContinue
		if ($ExistingUser) {
			return $true
		}
			else {
			return $false
		}
	}

	CheckIfUserExists 


    switch($user.OU){
        "Production" { $ou = "OU=Production,DC=lille,DC=local"; $groupOU = "OU=Production,DC=lille,DC=local" }
        "Developpement" { $ou = "OU=Developpement,OU=IT,DC=lille,DC=local"; $groupOU = "OU=Developpement,DC=lille,DC=local" }
        "Support" { $ou = "OU=Support,DC=lille,DC=local"; $groupOU = "OU=Support,DC=lille,DC=local" }
    }
	
	if($null -ne $ou){
		try{
			New-ADUser -Name $name -SamAccountName $SAM -UserPrincipalName $SAM -DisplayName $name -GivenName $fName -Surname $user.nom -AccountPassword (convertTo-SecureString $password -AsPlainText -Force) -Enabled $true -Path $ou
			Write-Host "Utilisateur ajouté : $name"

			# Ajout de l'utilisateur au groupe approprié
			Add-ADGroupMember -Identity $user.OU -Members $SAM -Server "lille.local"
			Add-ADGroupMember -Identity $groupOU -Members $SAM -Server "lille.local"
			Write-Host "Utilisateur ajouté au groupe : $user.OU"
		} catch {
			Write-Host "Utilisateur non ajouté : $name"
		}
	}
}


# ctrl + : : commenter un bloc ou un ligne
# ctrl + d : selectionner toutes les occurences
# maintiens alt pour placer plusieurs curseurs
# alt + fleches haut/bas : monter ou descendre un bloc ou ligne
# alt + shift + flechaus haut/bas : dupliquer des lignes
# ctrl + alt + shift : création curseurs multiples