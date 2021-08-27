# 1. Optionale features verwalten
# 2. features hinzufügen
# 3. RSAT: Tools für Active Directory Domain Services und Lightweight Directory Services

# Install-WindowsFeature
# Add-WindowsFeature AD-Domain-Services

# Setup singleforest and singledomain 
# z.B.: timo.intern
# [string] $domainname = read-host -prompt "Geben Sie den Domänennamen ein: "
# Install-ADDSForest -DomainName $domainname -InstallDNS
[string] $domainname = read-host -prompt "Geben Sie den Domainen-Namen an. Z.b.: DC=Example "
[string] $domainprefix = read-host -prompt "Geben Sie den Domainen-Prefix an. Z.b.: DC=COM "

# OU's erstellen für die bessere Übersicht
New-ADOrganizationalUnit -Name "Globale Gruppen" -Path "DC=${domainname},DC=${domainprefix}"
New-ADOrganizationalUnit -Name "Domain Local Gruppen" -Path "DC=${domainname},DC=${domainprefix}"
New-ADOrganizationalUnit -Name "Benutzer" -Path "DC=${domainname},DC=${domainprefix}"

# Definieren der Anzahl zu erstellender Gruppen
[int] $groupnumber = read-host -prompt "Geben Sie die Anzahl zu erstellenden Globale Gruppen an "
write-host "Erstelle gerade ${groupnumber} globale Gruppen..."

# für ${anzahl} gruppen, erstelle gruppe mit ${namen}
1..$groupnumber | % { 
  $globalgroupinput = read-host -prompt "Geben Sie den Gruppen-Namen an: "
  $globalgroupname = New-ADGroup "${globalgroupinput}" -path "OU=Globale Gruppen, DC=${domainname}, dc=${domainprefix}" -GroupScope Global -GroupCategory Security 

  # füge noch benutzer hinzu
  write-host "Geben Sie einen Gruppenmitglied an (username) "
  Add-ADGroupMember -Identity ${globalgroupname} -Member ${username}
}

# definieren der Anzahl zu erstellender Domain local groups
[int] $domainlocalnumber = read-host -prompt "Geben Sie die Anzahl zu erstellenden Domain Local Gruppen an "
write-host "Erstelle gerade ${domainlocalnumber} domain local Gruppen..."

1..$domainlocalnumber | % {
  $domainlocalgroupinput = read-host -prompt "Geben Sie den Gruppen-Namen an: "
  $domainlocalgroupname = New-ADGroup "${domainlocalgroupinput}" -path "OU=Domain Local Gruppen, DC=${domainname}, dc=${domainprefix}" -GroupScope Global -GroupCategory Security
}

# net localgroup <l_group> <g_group> /add
