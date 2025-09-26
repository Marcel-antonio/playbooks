#!/bin/bash
# === Fichier de sortie ===
OUTFILE="/srv/nfs/docker-data/semaphore/playbooks/semaphore.txt"

rm -f "$OUTFILE"   # Supprime le fichier s'il existe

> "$OUTFILE"       # Crée un fichier vide


# === Dossiers à explorer ===
DIRS=(
  "/srv/nfs/docker-data/semaphore/playbooks/roles/list-vm-esx01/"
)

# === Fichiers à inclure manuellement ===
FILES=(
  "/srv/nfs/docker-data/semaphore/playbooks/list-vm-esx01.yml"
  "/srv/nfs/docker-data/semaphore/playbooks/list-vm-esx01-inventory.yml"
  "/srv/nfs/docker-data/semaphore/playbooks/requirements.yml"
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

