# _Template_ rapport ISMIN
 
Ce _template_ est celui que j'utilise pour écrire mes rapports à l'EMSE.
Il utilise le langage Typst et est grandement inspiré de [celui de Timothé Dupuch](https://github.com/thimotedupuch/Template_Rapport_ISMIN_Typst)
ainsi que du [_template_ Bubble](https://github.com/hzkonor/bubble-template).  

Le fichier `template_report_ISMIN.pdf` est un apercu en PDF du résultat de la compilation.
J'ai essayé de montrer toutes les possibilités qu'offrait Typst, le contenu étant évidemment à ajuster à votre guise.  

Pour en savoir plus sur les fonctions l'utilisation de Typst, vous pouvez utiliser [la documentation](https://typst.app/docs), elle est très complète.
Le Ctrl+Clic (ou Cmd+Clic) marche aussi sur les fonctions (dans l'éditeur de l'application web).

## Utilisation

Je conseille d'utiliser [l'application Web Typst](https://typst.app/), mais il est possible de l'installer le compilateur en CLI sur sa machine.  
- Le fichier `template.typ` contient toutes les règles et fonctions d'affichage
- Le fichier `main.typ` lui contient le contenu que vous souhaitez inclure dans le rapport
- Le fichier `bibs.yaml` contient les références bibliographiques (au format Hayagriva, mais Typst prend aussi en charge le format BibLaTeX)
- Le dossier `assets` contient les ressources graphiques pour le thème du _template_
- Le dossier `fonts` contient des polices de caractères
- Le dossier `images` contient les images inclues dans le document

