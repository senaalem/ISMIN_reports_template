#let rectangle(
  title: "",
  subtitle: "",
  authors: (),
  date: "",
  logo: none,
  main-color: rgb(87,42,134),
  header-title: "",
  header-subtitle: "",
  body
) = {
  set document(title: title)
  set text(lang: "fr")

  let count = authors.len()
  let ncols = calc.min(count, 3)

  // on enregistre les polices du document dans des variables
  let title-font = "Klima"
  let body-font = "New Computer Modern"

  // on enregistre les couleurs du document dans des variables
  let primary-color = rgb(main-color)
  let secondary-color = rgb("#5c6670")

  // on règle l'affichage du code
  show raw: it => {
    text(font: "Consolas", it) // police pour les blocs de texte brut
  }
  // on règle l'affichage des blocs de code
  show raw.where(block: true): block.with(
    fill: luma(240),
    radius: 3pt,
    inset: 8pt
  )

  // on règle l'affichage du code en ligne
  show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 3pt,
  )
  
  // on règle l'affichage des équations en ligne
  show math.equation: set text(font: "New Computer Modern Math")

  // on règle l'affichage des blocs d'équation
  show math.equation: it => { 
    show regex("\d+\.\d+"): it => {
      show ".": {"," + h(0pt)}
        it
      }
    it
  } // permet d'utiliser les virgules comme séparateur décimal

  // on règle l'affichage des liens
  show link: it => {underline(text(it, fill: primary-color))}

  // permet de casser l'affichage des figures
  show figure: set block(breakable: true)

  // police de texte
  set text(font: body-font)

  // page de garde
  set page(margin: 0%)
  
  place(top + center,
    rect(width: 100%, fill: primary-color)[
      #v(2%)
      #align(center)[#image("assets/logo_emse_white.svg", width: 50%)]
      #v(2%)
    ]
  )
  
  place(bottom + center, rect(width: 200%, fill: primary-color, [#v(3%)]))

  place(bottom + center, dy: -150pt, text(size: 18pt)[#date])

  align(center + horizon)[
    #box(width: 80%)[
      #line(length: 100%)
      #text(size: 25pt)[*#title* \ #subtitle]
      #line(length: 100%)
      #v(10pt)
      #text(size: 18pt)[
        #table(
          align: center,
          stroke: none,
          column-gutter: 15pt,
          columns: (1fr,) * ncols,
          ..authors.map(author => [
            #strong(author.name + " " + author.surname) \ #author.affiliation #author.year \ #emph(author.class)
          ])
        )
      ]
    ]
  ]
  pagebreak()
  
  // table des matières
  set page(
    margin: auto,
    numbering: "1",
    number-align: center,
  )

  outline(indent: true)

  // contenu
  set page(header:[
    #smallcaps[#header-title]
    #h(1fr)
    #smallcaps[#header-subtitle]
    #align(horizon)[#line(length: 100%, stroke: 0.2pt)]
    ]
  )

  set par(first-line-indent: 1em, justify: true)
  set heading(numbering: "1.1. ")

  body
}

// fonctions
#let violet-emse = rgb("#5f259f")
#let gray-emse = rgb("#5c6670")
#let question(q) = heading(level: 2, numbering: none, outlined: false, q)
