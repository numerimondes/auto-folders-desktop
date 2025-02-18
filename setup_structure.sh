#!/bin/bash

# Message d'accueil
echo "
#
#   █▀█▀█
#  █      █
#  NADIM DIR
#  BASH COMPANION
#  BY NUMERIMONDES
#  █      █
#   █▄█▄█
#      █▀█
#      █  █
#      █   █
#      █    █
#      █     █
#      █      █
#      █████████
#
# ░█▀▄░▀█▀░█▀▄
# ░█░█░░█░░█▀▄
# ░▀▀░░▀▀▀░▀░▀
# ░█▀▀░▀█▀░█▀▄░█░█░█▀▀░▀█▀░█░█░█▀▄░█▀▀
# ░▀▀█░░█░░█▀▄░█░█░█░░░░█░░█░█░█▀▄░█▀▀
# ░▀▀▀░░▀░░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀▀▀
Organiser des projets créatifs via bash sur Linux et MacOS de manière interactive, un à la fois.
Repo GitHub : https://github.com/numerimondes/auto-folders-desktop
https://github.com/numerimondes/auto-folders-desktop.git
_____
www.numerimondes.com
by elmoumenyassine
_____
Session Start
"

# Fonction pour créer un dossier s'il n'existe pas déjà
create_directory() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
    echo "Dossier '$1' créé."
  else
    echo "Le dossier '$1' existe déjà."
  fi
}

# Fonction pour poser une question à l'utilisateur
ask_user() {
  read -p "$1 (o/n) : " response
  case $response in
    [oO][uU][iI]|[oO])
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

# Fonction pour générer un fichier texte
generate_file() {
  local file_path="$1"
  local content="$2"
  echo "$content" > "$file_path"
  echo "Fichier '$file_path' créé."
}

# Demander le nom du projet ou utiliser un nom par défaut
read -p "Nom du projet (laissez vide pour utiliser 'DirStructure[EPOCH]') : " project_name
if [ -z "$project_name" ]; then
  project_name="DirStructure[$(date +%s)]"
fi

# Vérification si le répertoire principal existe déjà
if [ -d "$project_name" ]; then
  echo "Le dossier '$project_name' existe déjà."
else
  # Création du dossier principal
  mkdir "$project_name"
  echo "Dossier '$project_name' créé."
fi

# Entrer dans le répertoire principal
cd "$project_name" || { echo "Impossible d'accéder au dossier '$project_name'."; exit 1; }

# Configuration du README.md
read -p "Contient un README.md ? (Oui=1 Non=0) : " readme_choice
if [ "$readme_choice" == "1" ]; then
  generate_file "README.md" "# $project_name\n\nDescription du projet ici."
fi

# Choix entre personnalisation ou structure par défaut
read -p "Voulez-vous personnaliser la structure des dossiers ? (Oui=1 Non=0) : " customization_choice

if [ "$customization_choice" == "1" ]; then
  # Mode personnalisé
  while true; do
    read -p "Nom du dossier personnalisé (laissez vide pour terminer) : " custom_folder
    if [ -z "$custom_folder" ]; then
      break
    fi
    create_directory "$custom_folder"
  done
else
  # Mode par défaut
  standard_folders=("Graphismes / Design" "Vidéo" "Média Social / Digital" "Campagnes / Projets Spécifiques" "Archives" "Ressources Générales" "Reporting & Suivi" "Gestion Administrative")

  for folder in "${standard_folders[@]}"; do
    create_directory "$folder"

    # Sous-dossiers spécifiques par défaut
    case "$folder" in
      "Graphismes / Design")
        create_directory "$folder/Logos"
        create_directory "$folder/Affiches"
        create_directory "$folder/Brochures"
        create_directory "$folder/Ressources"
        ;;
      "Vidéo")
        create_directory "$folder/Projets_en_cours"
        create_directory "$folder/Rushes"
        create_directory "$folder/Montages_finals"
        create_directory "$folder/Animation_et_Motion_Design"
        create_directory "$folder/Audio_Musique"
        ;;
      "Média Social / Digital")
        create_directory "$folder/Posts_et_Publications"
        create_directory "$folder/Vidéos_Réseaux_Sociaux"
        create_directory "$folder/Templates"
        ;;
      "Campagnes / Projets Spécifiques")
        create_directory "$folder/Campagne_LancementProduit"
        ;;
      "Archives")
        create_directory "$folder/Projets_terminés"
        ;;
      "Ressources Générales")
        create_directory "$folder/Polices"
        create_directory "$folder/Icônes"
        create_directory "$folder/Templates"
        ;;
      "Reporting & Suivi")
        create_directory "$folder/Analyses"
        create_directory "$folder/Suivi_des_KPIs"
        ;;
      "Gestion Administrative")
        create_directory "$folder/Factures"
        create_directory "$folder/Rapports"
        create_directory "$folder/Études_et_Recherche"
        create_directory "$folder/Documents_de_Travail"
        create_directory "$folder/Logiciels"
        create_directory "$folder/Contrats_et_Licences"
        ;;
    esac
  done
fi

generate_file "LICENSE" "MIT License

Copyright (c) $(date +%Y) Numerimondes

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Créé par Numerimondes - Empowering High-Achievers
https://numerimondes.com/"


# Générer un fichier CREDITS.txt
generate_file "CREDITS.txt" "Ce projet a été créé avec Auto-Folders-Desktop développé par Numerimondes.
Auteur : El Moumen Yassine
Fondateur de Numerimondes

Pour en savoir plus :
- Site web : https://numerimondes.com/
- GitHub : https://github.com/numerimondes
"


# Intégration avec Git
if ask_user "Voulez-vous initialiser un dépôt Git pour ce projet ?"; then
  git init
  echo "Dépôt Git initialisé."
  if ask_user "Voulez-vous ajouter ce projet à GitHub ?"; then
    read -p "URL du dépôt GitHub (exemple : https://github.com/user/repo.git) : " github_url
    git remote add origin "$github_url"
    echo "Dépôt distant configuré vers $github_url."
  fi
fi

# Génération de fichiers supplémentaires
if ask_user "Voulez-vous créer un fichier .gitignore ?"; then
  generate_file ".gitignore" "*.log
*.tmp
__pycache__/
node_modules/"
fi

# Fin du script
echo "Structure des dossiers créée avec succès dans '$project_name'."
