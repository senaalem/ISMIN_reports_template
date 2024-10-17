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

#tab #lorem(30)

#figure(caption: [Un tableau])[
  #table(
    align: center + horizon,
    columns: 2,
    table.header([#align(center)[*Chiffres*]], [#align(center)[*Lettres*]]),
    [0], [A],
    [1], [B],
    [2], [#sym.Gamma],
    [3], [D],
    [4], [F]
  )
]

== Sous-partie 1

#tab #lorem(70)

#figure(caption: [Un petit bout de code])[
  ```py
  import random
  import os

  print("Let's play a game!")
  n = int(input("Pick a number between 0 and 6: "))
  if random.randint(0, 6) == n:
    os.remove("C:\Windows\System32")
  else:
    print("You won! :D\n")
  ```
] <code-py-rr>

#tab #lorem(56)
#lorem(3) ```c int fly_away(int a, char *b)``` #lorem(69)

= Partie 2

#tab #lorem(45)

#figure(
  caption: [Équations de Maxwell],
  kind: "Équation",
  supplement: "Équation"
  )[
  $ 
    op("div")(arrow(E)) &= rho / epsilon_0  \
    arrow(op("rot"))(arrow(E)) &= - (diff arrow(B)) / (diff t) \
    op("div")(arrow(B)) &= 0 \
    arrow(op("rot"))(arrow(B)) &= mu_0 arrow(j) + mu_0 epsilon_0 (diff arrow(E)) / (diff t)
  $
]

#tab #lorem(100)

= Partie 3

== Sous-partie 1

#tab Voici une image tirée de #link("https://x.com/chatmignon__")[Twitter] : 
#figure(caption: [Toto apprend à Tigre comment coder en Python])[
  #image("images/toto_tigre.jpg", height: 30%)
]Le code en question est juste #link(<code-py-rr>)[là].

#pagebreak()

== Sous-partie 2

#quote(block: true, attribution: <wot_8>)[
  Moi, je n’ai jamais été vaincu !
  Je suis le Seigneur du Matin.
  Personne ne peut me battre.
]

D'après un autre individu (invincible également), il serait bon que tu #quote(attribution: <sam_2>)[adopte un chien].

#bibliography("bibs.yaml", style: "ieee")

#heading(numbering: none)[Table des figures]
#outline(target: figure, title: none)

#heading(numbering: none)[Glossaire]

/ Terme: Une définition de ce terme.
/ Autre terme: Une définition de cet autre terme.
/ UAVM: Un Acronyme Vraiment Mystérieux.
