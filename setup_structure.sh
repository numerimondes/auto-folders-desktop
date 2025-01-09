#!/bin/bash

# Vérification si le répertoire principal existe déjà
if [ -d "Projets_Creatifs" ]; then
  echo "Le dossier 'Projets_Creatifs' existe déjà."
else
  # Création du dossier principal
  mkdir Projets_Creatifs
  echo "Dossier 'Projets_Creatifs' créé."
fi

# Création des sous-dossiers dans 'Projets_Creatifs'
cd Projets_Creatifs

# 1. Graphismes / Design
mkdir -p "Graphismes / Design/Logos" "Graphismes / Design/Affiches" "Graphismes / Design/Brochures" "Graphismes / Design/Ressources"
echo "Sous-dossiers Graphismes / Design créés."

# 2. Vidéo
mkdir -p "Vidéo/Projets_en_cours" "Vidéo/Rushes" "Vidéo/Montages_finals" "Vidéo/Animation_et_Motion_Design" "Vidéo/Audio_Musique"
echo "Sous-dossiers Vidéo créés."

# 3. Média Social / Digital
mkdir -p "Média Social / Digital/Posts_et_Publications" "Média Social / Digital/Vidéos_Réseaux_Sociaux" "Média Social / Digital/Templates"
echo "Sous-dossiers Média Social / Digital créés."

# 4. Campagnes / Projets Spécifiques
mkdir -p "Campagnes / Projets Spécifiques/Campagne_LancementProduit"
echo "Sous-dossier Campagnes / Projets Spécifiques créé."

# 5. Archives
mkdir -p "Archives/Projets_terminés"
echo "Sous-dossier Archives créé."

# 6. Ressources Générales
mkdir -p "Ressources Générales/Polices" "Ressources Générales/Icônes" "Ressources Générales/Templates"
echo "Sous-dossiers Ressources Générales créés."

# 7. Reporting & Suivi
mkdir -p "Reporting & Suivi/Analyses" "Reporting & Suivi/Suivi_des_KPIs"
echo "Sous-dossiers Reporting & Suivi créés."

# 8. Gestion Administrative
mkdir -p "Gestion Administrative/Factures" "Gestion Administrative/Rapports" "Gestion Administrative/Études_et_Recherche" "Gestion Administrative/Documents_de_Travail" "Gestion Administrative/Logiciels" "Gestion Administrative/Contrats_et_Licences"
echo "Sous-dossiers Gestion Administrative créés."

echo "Structure des dossiers créée avec succès dans 'Projets_Creatifs'."
