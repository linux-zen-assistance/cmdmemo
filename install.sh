#!/usr/bin/env bash

set -e

echo "=== Installation de cmdmemo ==="

# Répertoires d'installation
BIN_DIR="$HOME/.local/bin"
DATA_DIR="$HOME/.local/share/cmdmemo"

echo "Création des répertoires..."
mkdir -p "$BIN_DIR"
mkdir -p "$DATA_DIR"

echo "Installation du script principal..."
cp cmdmemo.sh "$BIN_DIR"/cmdmemo
chmod +x "$BIN_DIR"/cmdmemo

echo "Installation des fichiers de données..."
cp cmdmemo.tsv "$DATA_DIR"/
cp cmdmemo.categ "$DATA_DIR"/

echo "Installation terminée."

# Suggestion d'alias pour le confort
if ! grep -q "alias cm=" "$HOME/.bashrc"; then
  echo 'alias cm="~/.local/bin/cmdmemo"' >> "$HOME/.bashrc"
  echo 'Alias ajouté à ~/.bashrc'
else
  echo "Alias déjà présent dans ~/.bashrc"
fi

echo
echo "⚠️  IMPORTANT : rechargez votre shell avec :"
echo "    source ~/.bashrc"
echo
echo "Vous pouvez maintenant lancer :"
echo "    cm -c"
echo "    cm -a"

