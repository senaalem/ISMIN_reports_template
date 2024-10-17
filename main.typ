#import "template.typ": *

#show: rectangle.with(
  title: "Titre",
  subtitle: "Sous-titre",
  authors: (
    (
      surname: "1",
      name: "Auteur",
      affiliation: "Filière 1",
      year: "Année 1",
      class: "Classe 1"
    ), 
    (
      surname: "2",
      name: "Auteur",
      affiliation: "Filière 2",
      year: "Année 2",
      class: "Classe 2"
    )
  ),
  header-title: "En-tête 1",
  header-subtitle: "En-tête 2",
  date: "Date"
)

= Partie 1

#lorem(30)

== Sous-partie 1

#lorem(70)

= Partie 2

#lorem(45)

#lorem(100)
