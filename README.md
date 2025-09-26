# playbooks
##################################################################################################
list-vm-esx.yml
## Role Variables

- `esx1_hostname`: Adresse IP ou FQDN de l’hôte ESXi ou vCenter (par défaut `CHANGEMOI`)
- `esx1_username`: Utilisateur ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esx1_password`: Mot de passe ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esx1_validate_certs`: Booléen (false par défaut), permet de désactiver la validation SSL

- `esx2_hostname`: Adresse IP ou FQDN de l’hôte ESXi ou vCenter (par défaut `CHANGEMOI`)
- `esx2_username`: Utilisateur ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esx2_password`: Mot de passe ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esx2_validate_certs`: Booléen (false par défaut), permet de désactiver la validation SSL

## Exemple d’utilisation avec Semaphore
Dans Semaphore, créez un Variable Group `VMware` :
- Secrets :
  - `ESX1_USER` = root
  - `ESX1_PASS` = ********
  - `ESX2_USER` = root
  - `ESX2_PASS` = ********

- Variables :
  - `esx1_username = ESX1_USER`
  - `esx1_password = ESX1_PASS`
  - `esx2_username = ESX2_USER`
  - `esx2_password = ESX2_PASS`



#################################################################################################
 