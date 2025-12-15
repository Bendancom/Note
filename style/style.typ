#import "@preview/numbly:0.1.0": numbly
#import "@preview/pointless-size:0.1.2": zh
#import "@preview/xyznote:0.4.0": *

#let en-font = "Times New Roman"
#let zh-font = "LXGW WenKai Mono"
#let author = "Bendancom"

#let style(doc,title,abstract) = {
  set text(
    lang: "zh",
    font: (en-font,zh-font),
    size: zh(5)
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
    )
  )
  outline()

  // body
  set page(
    margin: (
      top: 2cm,
      bottom: 2cm,
      right: 2cm,
      left: 2cm,
    ),
  )
  doc
}
