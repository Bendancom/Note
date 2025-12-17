#import "@preview/numbly:0.1.0": numbly
#import "@preview/pointless-size:0.1.2": zh
#import "@preview/xyznote:0.4.0": *

#let en-font = "Times New Roman"
#let zh-font = "LXGW WenKai Mono"
#let font-size = zh(5)
#let author = "Bendancom"

#let style(doc,title,abstract) = {
  set text(
    lang: "zh",
    font: (en-font,zh-font),
    size: font-size
  )
  set document(author: author,date: auto,title: title)


  // header
  set heading(
    numbering: numbly(
      "",
      "{2}",
      "{2}.{3}",
      "{2}.{3}.{4}"
    ),
    hanging-indent: 1em,
  )
  show heading.where(level: 1): set align(center) 
  show heading: it => {
    it
    v(-1em)
    par()[#text(size: 0.0em)[#h(0.0em)]]

    if it.level <= 2 {
      counter(figure.where(kind: image)).update(0)
      counter(figure.where(kind: table)).update(0)
    }
  }

  // par
  set par(
    first-line-indent: (amount: 2em,all: false),
    spacing: 1.2em,
    leading: 0.8em,
    hanging-indent: 0em,
  )

  // enum
  set enum(
    numbering: numbly(
      "{1}",
      "{2:a}",
      "{3:i}",
    ),
    indent: 1em
  )

  // list
  set list(
    indent: 1em
  )
  
  // figure
  show figure.where(kind: image): it => {
    block[
      #it.body
      #text(weight: "bold")[
        图
        #counter(heading.where(level: 2)).display()
        \-
        #it.counter.display() #h(1em) #it.caption.body
      ]
    ]
  }
  show figure.where(kind: table): it => {
    block[
      #text(weight: "bold")[
        表
        #counter(heading.where(level: 2)).display()
        \-
        #it.counter.display() #h(1em) #it.caption.body
      ]
      #it.body
    ]
  }
  show figure: set block(breakable: false)

  //table
  set table(align: center + horizon)
  show table: set align(center)
  
  //grid
  set grid(gutter: 1em)
  show grid: set align(center)

  //raw
  show raw: set text(font: (en-font,zh-font),size: font-size)
  show raw.where(lang:"eg"): it => {
    block[
      #emoji.lightbulb
      #v(-1em)
      #it
    ]
  }
  show raw: set block(
      fill: rgb("#89CFF0"),
      radius: 1em,
      stroke: none,
      inset: 0%+1em,
      outset: 0%,
      height: auto,
      width: 100%,
  )

  // front cover
  set page(
    paper: "a4",
    margin: (
      top: 7cm,
      bottom: 4cm,
      left: 2cm,
    ),
  )

  polygon(
    fill: rgb("#bb4e4d"),
    (0cm, -7cm),
    (1.8cm, -7cm),
    (1.8cm, -4cm),
    (0.9cm, -4.9cm),
    (0cm, -4cm),
  )

  align(right)[
    #set text(font: ("Times New Roman", "SimSun"))
    #block(text(weight: 700, 30pt, title))
    #line(length: 100%, stroke: 3pt) //封面横线
    #v(1em, weak: true)
  ]

  align(right)[
    #set text(font: ("Libertinus Serif", "SimSun"), size: 12pt)
    #abstract
  ]

  align(bottom + center)[
    #set text(size: 15pt)
    *#author*
  ]

  // outline
  show outline: set heading(numbering: none)
  show outline.entry.where(level: 1): set block(above: 1.2em)
  show outline: set par(first-line-indent: 0em,leading: 9pt)
  show outline.entry.where(level: 1): it => {
    text(font: ("libertinus serif", "SimSun"))[#strong[#it]]
  }
  show outline.entry: it => {
    text(font: ("libertinus serif", "SimSun"))[#it]
  }

  set page(
    paper: "a4",
    margin: (
      top: 2cm,
      bottom: 2cm,
      right: 2cm,
      left: 2cm,
    ),
    numbering: "I",
  )
  counter(page).update(1)
  outline()

  // body
  set page(
    margin: (
      top: 2cm,
      bottom: 2cm,
      right: 2cm,
      left: 2cm,
    ),
    numbering: "1",
  )
  counter(page).update(1)
  doc
}
