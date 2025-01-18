// fonctions
#let violet-emse = rgb("#5f259f")
#let gray-emse = rgb("#5c6670")
#let tab = h(1.8em)
#let mono(it) = text(font: "New Computer Modern Mono", number-type: "lining", it)
#let lining(it) = text(number-type: "lining", it)

#let rectangle(
  title: "",
  subtitle: "",
  authors: (),
  date: "",
  logo: none,
  main-color: rgb(87,42,134),
  header-title: "",
  header-middle: "",
  header-subtitle: "",
  body
) = {
  set document(title: title)
  set text(lang: "fr")
  
  // le séparateur dans la légende des figures
  set figure.caption(separator: [ : ])

  show figure.caption: it => [
    #smallcaps[
      #it.supplement #context it.counter.display(it.numbering)
    ]
    #it.separator
    #it.body
  ]
  
  // l'affichage des listes
  set enum(
    indent: 1em,
    numbering: n => [#text(fill: rgb(main-color), numbering("1.", n))]
  )

  set list(
    indent: 1em,
    marker: ([#text[--]], [#text(fill: violet-emse)[•]], [#text(fill: violet-emse)[‣]])
  )

  set par(
    leading: 0.55em,
    spacing: 1em,
    first-line-indent: 1.8em,
    justify: true
  )

  set page(margin: 1.75in)

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
    text(
      font: "Cascadia Mono",
      features: ("zero",),
      it
    ) // police pour les blocs de texte brut
  }
 
  // on règle l'affichage des blocs de code
  show raw.where(block: true): block.with(
    fill: luma(240),
    radius: 3pt,
    inset: 10pt,
    stroke: 0.1pt,
    width: 100%
  )
  show raw.where(block: true): text.with(
    size: 8pt,
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
  show link: it => {
    if type(it.dest) == str {
      text[
        #it#super(
          typographic: false,
          size: 0.75em,
          text(fill: maroon, sym.circle.small)
        )
      ]
    } else {
      text[
        #it#super(
          typographic: false,
          size: 0.75em,
          text(fill: maroon, sym.square)
        )
      ]
    }
  }

  // permet de casser l'affichage des figures
  show figure: set block(breakable: true)

  show heading: set text(fill: primary-color)
  show heading: set block(above: 1.4em, below: 1em)

  show quote.where(block: true): rect.with(
    stroke: (left: 1.5pt + primary-color),
    inset: (left: 1em)
  )
  
  // police de texte
  set text(font: body-font, number-type: "old-style")

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
    #box(width: 70%)[
      #line(length: 100%)
      #v(15pt)
      #text(size: 25pt)[*#title*]
      
      #text(size: 25pt)[#subtitle]
      #v(15pt)
      #line(length: 100%)
      #v(20pt)
      #text(size: 18pt)[
        #table(
          align: center,
          stroke: none,
          column-gutter: 15pt,
          columns: (1fr,) * ncols,
          ..authors.map(author => [
            #strong(author.name + " " + author.surname) \ #author.affiliation #lining[#author.year] \ #emph(author.class)
          ])
        )
      ]
    ]
  ]
  pagebreak()
  
  // table des matières
  set page(
    margin: auto,
    numbering: (n, ..) => [#text(number-type: "lining")[#n]],
    number-align: center
  )

  // Footer
  set page(footer: context {
    let i = counter(page).at(here()).first()
  
    let is-odd = calc.odd(i)
    let aln = if is-odd {
      right
    } else {
      left
    }
  
    let target = heading.where(level: 1)
    if query(target).any(it => it.location().page() == i) {
      return align(aln)[#text(number-type: "lining")[#i]]
    }
  
    let before = query(target.before(here()))
    if before.len() > 0 {
      let current = before.last()
      let gap = 1.75em
      let chapter = smallcaps(text(
        size: 0.68em,
        tracking: 0.5pt,
        current.body
      ))
      if is-odd {
        align(aln)[#chapter #h(gap) #text(number-type: "lining")[#i]]
      } else {
        align(aln)[#text(number-type: "lining")[#i] #h(gap) #chapter]
      }
      }
  })

  // contenu
  set page(header: [
    #text(size: 9pt)[
      #header-title
      #h(1fr)
      #strong[#header-middle]
      #h(1fr)
      #emph[#header-subtitle]
      #line(length: 100%, stroke: 0.5pt)
    ]
  ])
  
  outline(indent: true)

  pagebreak()

  set heading(numbering: (..n) => 
    text(number-type: "lining", numbering("1.1  ", ..n))
  )

  show table: set text(number-type: "lining")

  show figure: set block(inset: (top: 0.5em, bottom: 0.7em))

  set figure.caption(position: top)
  show figure.where(kind: image): set figure.caption(position: bottom)
  
  body
}

