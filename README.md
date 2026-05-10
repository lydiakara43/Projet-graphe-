# Projet graphe - Coloration de graphes

Projet C++ d'analyse et de coloration de graphes. Le programme lit plusieurs
formats de graphes, applique des heuristiques de coloration, puis compare le
nombre de couleurs produites et le temps d'execution.

## Objectif

La coloration de graphe consiste a attribuer une couleur a chaque sommet de
maniere a ce que deux sommets adjacents n'aient jamais la meme couleur. Le but
est d'obtenir une coloration valide avec le moins de couleurs possible.

Ce projet compare trois approches :

- glouton naturel : coloration des sommets dans l'ordre de lecture;
- glouton par degres decroissants : coloration des sommets les plus connectes
  en premier;
- DSATUR : choix iteratif du sommet ayant le plus fort degre de saturation.

## Structure

```text
.
|-- src/
|   `-- main.cpp                 # Code source principal
|-- data/
|   |-- exemple_aretes.txt        # Petit graphe au format liste d'aretes
|   |-- exemple_dimacs.col        # Petit graphe au format DIMACS
|   |-- Wiki-Vote.txt             # Jeu de donnees reel
|   |-- soc-Epinions1.txt         # Jeu de donnees reel
|   `-- README.md                 # Note sur les donnees
|-- build.bat                     # Script de compilation Windows
|-- compte rendu.pdf              # Rapport du projet
|-- sujet projet.pdf              # Sujet du projet
`-- README.md
```

## Formats acceptes

Le lecteur de graphe accepte :

- DIMACS : lignes `p edge n m` puis aretes `e u v`;
- liste d'aretes simple : une arete par ligne sous la forme `u v`;
- format wiki-RfA : blocs contenant `SRC:nom` puis `TGT:nom`;
- commentaires commencant par `#`, `%` ou `;`.

## Compilation

Prerequis :

- un compilateur C++ compatible C++17;
- sous Windows, MSYS2 / MinGW-w64 convient.

Avec le script fourni :

```bat
build.bat
```

Ou directement :

```bat
g++ -std=c++17 -O2 -Wall -Wextra src\main.cpp -o graphe_coloration.exe
```

## Utilisation

Syntaxe generale :

```bat
graphe_coloration.exe fichier_graphe [--algo all|dsatur|glouton|degre] [--show-colors]
```

Exemples :

```bat
graphe_coloration.exe data\exemple_aretes.txt --algo all --show-colors
graphe_coloration.exe data\exemple_dimacs.col --algo all --show-colors
graphe_coloration.exe data\Wiki-Vote.txt --algo all
graphe_coloration.exe data\soc-Epinions1.txt --algo degre
```

## Resultat affiche

Pour chaque algorithme, le programme affiche :

- le nombre de couleurs utilisees;
- `n_k`, c'est-a-dire la position du premier sommet ayant recu la derniere
  couleur creee;
- le ratio `n_k / n`;
- le temps d'execution en millisecondes.

Exemple sur `data\exemple_aretes.txt` :

```text
Graphe charge : 6 sommets, 8 aretes
Glouton naturel    couleurs=3     n_k=3        ratio=0.5000
Glouton degres     couleurs=3     n_k=5        ratio=0.8333
DSATUR             couleurs=3     n_k=3        ratio=0.5000
```

Validation sur `data\Wiki-Vote.txt` :

```text
Graphe charge : 7115 sommets, 100762 aretes
Glouton naturel    couleurs=37
Glouton degres     couleurs=28
DSATUR             couleurs=24
```

## Donnees volumineuses

Le fichier local `data/wiki-RfA.txt` est tres volumineux. Il est conserve dans
le dossier de travail local, mais il est ignore dans la version preparee pour
GitHub afin d'eviter les limites de l'interface web. Les autres jeux de donnees
restent inclus.

## Fichiers non versionnes

Le binaire compile `graphe_coloration.exe` est genere par la compilation et ne
doit pas etre versionne. Il suffit de recompiler le projet avec `build.bat` ou
avec la commande `g++` ci-dessus.
