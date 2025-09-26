# playbooks
##################################################################################################
list-vm-esx01.yml
## Role Variables

- `esxi_hostname`: Adresse IP ou FQDN de l’hôte ESXi ou vCenter (par défaut `CHANGEMOI`)
- `esxi_username`: Utilisateur ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esxi_password`: Mot de passe ESXi/vCenter (**à redéfinir via Vault ou Semaphore Secrets**)
- `esxi_validate_certs`: Booléen (false par défaut), permet de désactiver la validation SSL

## Exemple d’utilisation avec Semaphore
Dans Semaphore, créez un Variable Group `VMware` :
- Secrets :
  - `ESXI_USER` = root
  - `ESXI_PASS` = ********
- Variables :
  - `esxi_username = ESXI_USER`
  - `esxi_password = ESXI_PASS`



#################################################################################################