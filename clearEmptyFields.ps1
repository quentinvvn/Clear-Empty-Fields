# Chemin du répertoire que vous souhaitez nettoyer
$cheminRepertoire = "C:\Users\Parent_FIle"


# Récupérer la liste des dossiers du répertoire spécifié
$dossiers = Get-ChildItem $cheminRepertoire -Directory

# Parcourir chaque dossier et supprimer les dossiers vides
foreach ($dossier in $dossiers) {
    $contenuDossier = Get-ChildItem $dossier.FullName -File -Force
    if ($contenuDossier.Count -eq 0) {
        Write-Host "Suppression du dossier vide : $($dossier.FullName)"
        Remove-Item $dossier.FullName -Force -Recurse
    }
}

Write-Host "Nettoyage des dossiers vides terminé."
