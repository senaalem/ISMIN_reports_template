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
  header-subtitle: "En-tête 3",
  header-middle: [En-tête 2],
  date: "Date"
)

#outline(indent: true)
#pagebreak()

#tab Ce _template_ est utilisé pour écrire les rapports à l'ISMIN.
Vous pouvez évidemment en modifier le contenu.
Pour commencer, il peut être bon de mettre un titre.
En Typst, on fait comme suit :

#align(left)[
  ```typ
  = Super titre
  
  == Excellent sous-titre
  ```
]


= Explications

== ```typst #tab```

=== Sans

Si je n'utilise pas ```typst #tab```, le premier paragraphe n'est pas indenté.
Je vais utiliser ```typst #lorem``` pour l'illustrer.
#lorem(25)

#lorem(30)

#highlight[Tout les paragraphes sont tabulés ensuite].
#lorem(56)

#lorem(80)

#lorem(20)

=== Avec

#tab Ici, j'utilise ```typ #tab``` pour que la première ligne soit indentée elle aussi.

Salut "beauté."
Tu aimes les pommes.
#smallcaps[Vraiment, des pommes ? Comme c'est étrange.]

#lorem(100)

== ```typ #table```

#tab On peut faire des tableaux grâce à la fonction ```typst #table```, comme suit.
Il est de bon goût de placer le tableau dans une figure (fonction ```typst #figure```) afin de lui affecter une légende et qu'elle soit référencée dans la #link(<fig_outline>)[table des figures.]

#figure(caption: [Un tableau])[
  #table(
    align: center + horizon,
    columns: 2,
    table.header([#align(center)[*Chiffres*]], [#align(center)[*Lettres*]]),
    [0], [A],
    [1], [B],
    [2], [#sym.Gamma],
    [3], [#sym.Delta],
    [4], [#sym.Epsilon]
  )
]

== ```typ #raw```

#tab On peut styliser du code avec ```typ #raw```, ou un/trois _backtick(s)_ (\`#footnote[J'ai pu mettre un \` grâce à l'_escape character_ de Typst : l'_antislash_ (```typst \```).]).
Voici un exemple avec du Python :

#figure(caption: [Un petit bout de code])[
  #set align(left)
  ```py
  import random
  import os

  print("Let's play a game!\n")
  n = int(input("Pick a number between 0 and 6: "))
  if random.randint(0, 6) == n:
    os.remove("C:\Windows\System32")
  else:
    print("You won! :D\n")
  ```
] <code-py-rr>

#tab Typst prend en charge de la coloration syntaxique pour énormément de langages#footnote[Les mêmes que pour le standard Markdown en fait.].
On peut aussi inclure du code dans une ligne : ```c void inline_func(char* line, int n);```

== Les math

#tab On peut utiliser le mode math en blocs (```typst $ x = 2 $```) ou en ligne (```typst $x = 2$```).

#figure(
  caption: [Équations de Maxwell],
  kind: "equation"
  )[
  $ 
    op("div")(arrow(E)) &= rho / epsilon_0  \
    arrow(op("rot"))(arrow(E)) &= - (diff arrow(B)) / (diff t) \
    op("div")(arrow(B)) &= 0 \
    arrow(op("rot"))(arrow(B)) &= mu_0 arrow(j) + mu_0 epsilon_0 (diff arrow(E)) / (diff t)
  $
]

#tab L'équation de Maxwell préférée de mon amie est celle dite de Maxwell-Faraday (locale) obtenue grâce au théorème de Stokes : $integral.cont_C arrow(E) dif arrow(cal(l)) = - dif / (dif t) (integral_S arrow(B) dif arrow(S))$.

== Les liens/références et les images

#tab Voici une image tirée de #link("https://x.com/chatmignon__")[Twitter] (j'ai fait un lien vers Twitter) : 
#figure(caption: [Toto apprend à Tigre comment coder en Python])[
  #image("images/toto_tigre.jpg", height: 30%)
]
#tab Le code en question est juste #link(<code-py-rr>)[là] (j'ai fait une référence vers un endroit dans le document).

== Listes

=== Listes de puces

#tab On peut utiliser ```typ -``` pour faire des listes de puces, comme suit :

- Oui
- Non
- Peut-être

On peut les faire plus espacées :

- Comme ça

- La différence est flagrante 

- Impressionnant

=== Listes numérotées

#tab Même principe pour les listes numérotées, mais avec un ```typ +``` :

+ Incroyable
  + On peut même inclure des listes dans des listes
  + La technologie est folle
+ Wow
+ Impressionant


Changeons de page.
#pagebreak()

== Les citations

#quote(block: true, attribution: [Lews Therin Thelamon <wot8>])[
  Moi, je n’ai jamais été vaincu !
  Je suis le Seigneur du Matin.
  Personne ne peut me battre.
]

D'après un autre individu (invincible également), il serait bon que tu #quote(attribution: <sam_2>)[adopte un chien].

== Autres

#tab Typst offre énormément d'autres possibilités, n'hésitez pas à consulter la documentation !

= Partie 2

#tab #lorem(67)

= Partie 3

#tab #lorem(67)

#lorem(42)

#bibliography("bibs.yaml", style: "ieee")

#heading(numbering: none)[Table des figures] <fig_outline>
#outline(target: figure, title: none)

#heading(numbering: none)[Glossaire]

/ Terme: Une définition de ce terme.
/ Autre terme: Une définition de cet autre terme.
/ UAVM: Un Acronyme Vraiment Mystérieux.