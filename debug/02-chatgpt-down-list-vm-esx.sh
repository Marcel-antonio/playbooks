#!/bin/bash
# === Fichier de sortie ===
OUTFILE="/srv/nfs/docker-data/semaphore/playbooks/debug/semaphore.txt"

rm -f "$OUTFILE"   # Supprime le fichier s'il existe

> "$OUTFILE"       # Crée un fichier vide


# === Dossiers à explorer ===
DIRS=(
  "/srv/nfs/docker-data/semaphore/playbooks/roles/02-down-list-vm-esx/"
)

# === Fichiers à inclure manuellement ===
FILES=(
  "/srv/nfs/docker-data/semaphore/playbooks/02-down-list-vm-esx.yml"
  "/srv/nfs/docker-data/semaphore/playbooks/02-down-list-vm-esx-inventory.yml"
  "/srv/nfs/docker-data/semaphore/playbooks/requirements.yml"
  "/srv/nfs/docker-data/semaphore/playbooks/ansible.cfg"
  "/srv/nfs/docker-data/semaphore/playbooks/group_vars/all.yml"
)


# === Fonction pour traiter un fichier ===
process_file() {
  local filepath="$1"
  echo "---- $filepath ----" >> "$OUTFILE"
  if [[ "$filepath" =~ \.(crt|key|pem)$ ]]; then
    echo "[Fichier binaire ignoré]" >> "$OUTFILE"
  else
    cat "$filepath" >> "$OUTFILE"
  fi
  echo -e "\n" >> "$OUTFILE"
}

# === Parcours des dossiers ===
for dir in "${DIRS[@]}"; do
  echo "=== Dossier : $dir ===" >> "$OUTFILE"
  find "$dir" -type f | sort | while read -r file; do
    process_file "$file"
  done
done

# === Ajout des fichiers spécifiques ===
for file in "${FILES[@]}"; do
  echo "=== Fichier spécifique : $file ===" >> "$OUTFILE"
  process_file "$file"
done

echo "Fichier généré : $OUTFILE"

