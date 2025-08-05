
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Austin Coursey"
#let locale-catalog-page-numbering-style = context { "Austin Coursey - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Aug 2025"
#let locale-catalog-language = "en"
#let design-page-size = "us-letter"
#let design-section-titles-font-size = 1.4em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 79, 144)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 79, 144)
#let design-colors-connections = rgb(0, 79, 144)
#let design-colors-links = rgb(0, 79, 144)
#let design-section-titles-font-family = "Source Sans 3"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.4em
#let design-section-titles-type = "with-parial-line"
#let design-section-titles-vertical-space-above = 0.8cm
#let design-section-titles-vertical-space-below = 0.2cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = true
#let design-text-font-size = 11pt
#let design-text-leading = 0.6em
#let design-text-font-family = "Source Sans 3"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = true
#let design-header-name-font-family = "Source Sans 3"
#let design-header-name-font-size = 30pt
#let design-header-name-bold = true
#let design-header-connections-font-family = "Source Sans 3"
#let design-header-vertical-space-between-name-and-connections = 0.3cm
#let design-header-vertical-space-between-connections-and-first-section = 0.3cm
#let design-header-use-icons-for-connections = true
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = ""
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0.4cm
#let design-highlights-vertical-space-between-highlights = 0.20cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.5em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0.2cm
#let design-page-top-margin = 1cm
#let design-page-bottom-margin = 1cm
#let design-page-left-margin = 1.5cm
#let design-page-right-margin = 1.5cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = true
#let design-links-underline = false
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Austin Coursey

// Print connections:
#let connections-list = (
  [#box(original-link("mailto:austin.c.coursey@vanderbilt.edu")[#fa-icon("envelope", size: 0.9em) #h(0.05cm)austin.c.coursey\@vanderbilt.edu])],
  [#box(original-link("https://scholar.google.com/citations?user=vLlw5KcAAAAJ")[#fa-icon("link", size: 0.9em) #h(0.05cm)scholar.google.com\/citations?user=vLlw5KcAAAAJ])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Fourth year Computer Science Ph.D. student at Vanderbilt University aiming to graduate in Spring 2026. Interested in developing and applying machine learning solutions to solve problems in real-world complex systems. Research interests include reinforcement learning, prognostics, anomaly detection, and continual learning. Currently researching the intersection of safe and continual reinforcement learning as part of my NSF Graduate Research Fellowship.]
)


== Education


// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[PhD]],
  middle-content: [
    #strong[Vanderbilt University], Computer Science
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Member of the Modeling and Analysis of Complex Systems \(MACS\) lab under Professor Gautam Biswas at the Institute for Software Integrated Systems.],)
  ],
  right-content: [
    Nashville, TN

Aug 2022 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, YES DEGREE
#three-col-entry(
  left-column-width: 1cm,
  left-content: [#strong[BS]],
  middle-content: [
    #strong[Murray State University], Computer Science and Mathematics
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Undergraduate Thesis - Data-driven Models for Remaining Useful Life Estimation of Aircraft Engines and Hard Disk Drives],[4.0 GPA],[Honors Degree and Summa Cum Laude],[Outstanding Senior in Computer Science x2 and Mathematics],[Multiple leadership positions include President of Association for Computing Machinery and Vice President of Association of Information Technology Professionals],)
  ],
  right-content: [
    Murray, KY

Aug 2018 – May 2022
  ],
)



== Experience


#two-col-entry(
  left-content: [
    #strong[Siemens], Research Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Researching autonomous multi-agent cyber defense using RL and LLM coordination.],)
  ],
  right-content: [
    Princeton, NJ

June 2025 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vanderbilt University], NSF Graduate Research Fellow
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Researching the intersection of safe and continual reinforcement learning. Funded by National Science Foundation.],)
  ],
  right-content: [
    Nashville, TN

Aug 2024 – present
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vanderbilt University], Graduate Research Assistant
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Graduate RA in the Modeling and Analysis of Complex Systems lab in the Institute for Software Integrated Systems at Vanderbilt University. Worked at a NASA-funded unmanned aerial vehicle \(UAV\) system-wide safety project. Developed a reinforcement learning controller to counteract wind and fault disturbances to maintain safety.],)
  ],
  right-content: [
    Nashville, TN

Jan 2023 – Aug 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Vanderbilt University], Graduate Teaching Assistant
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Graduate TA for five sections of Vanderbilt University's CS 2212 \(Discrete Structures\) course. Held office hours for dozens of students, graded homework and exams, and assisted professors with various tasks such as running class for the day.],)
  ],
  right-content: [
    Nashville, TN

Aug 2022 – Dec 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Carnegie Mellon University], Undergraduate Researcher
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Summer researcher at Carnegie Mellon University’s Research Experience for Undergraduates in Software Engineering \(REUSE\) program. Evaluated the quality of machine learning model documentation in the form of model cards, a standard proposed by Google. Designed a study to determine the effectiveness of a novel tool that autogenerates model cards for Jupyter Notebooks. Presented findings at a poster session at the end of the summer. Paper published in CHI.],)
  ],
  right-content: [
    Pittsburgh, PA

June 2021 – Aug 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[United Systems and Software], Software Development Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Performed full-stack website development using Angular \(TypeScript, CSS, and HTML\), C\# .NET, and SQL. Developed a web portal for utility customers across Kentucky and some surrounding states to pay their bills and participated in Agile, team-based development.],)
  ],
  right-content: [
    Benton, KY

June 2020 – June 2021
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Land Between the Lakes National Recreation Area], Webmaster Intern
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Developed and maintained a website with over 129,000 monthly page visits. Created over 50 individual web pages using WordPress, HTML, and CSS.],)
  ],
  right-content: [
    Golden Pond, KY

Aug 2019 – Aug 2022
  ],
)



== Funding, Awards, and Honors


#two-col-entry(
  left-content: [
    #strong[Lacy-Fischer Interdisciplinary Research Grant \(\$7500\)]

    
  ],
  right-content: [
    2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[National Science Foundation Graduate Research Fellow]

    
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Best Reviewer Award - KDD 2024]

    
  ],
  right-content: [
    2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Murray State University Outstanding Senior Computer Science Senior \(x2\)]

    
  ],
  right-content: [
    2021-2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Murray State University Outstanding Mathematics Senior]

    
  ],
  right-content: [
    2022
  ],
)



== Publications


#two-col-entry(
  left-content: [
    #strong[\(23\) Data-Driven Fault Detection and Isolation Enhanced with System Structural Relationships]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Austin Coursey, Abel Diaz-Gonzalez, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)\(To appear\) International Conference on Principles of Diagnosis and Resilient Systems - DX 2025  ],
  right-content: [
    Sept 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(22\) A Data-driven Particle Filter Approach for System-Level Prediction of Remaining Useful Life]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Abel Diaz-Gonzalez, Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)\(To appear\) International Conference on Principles of Diagnosis and Resilient Systems - DX 2025  ],
  right-content: [
    Sept 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(21\) Safe to Fly? Real-Time Flight Mission Feasibility Assessment for Drone Package Delivery Operations]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Abenezer Taye, Austin Coursey, Marcos Quinones-Grueiro, Chao Hu, Gautam Biswas, Peng Wei

#v(design-highlights-top-margin - design-text-leading)\(To appear\) International Conference on Principles of Diagnosis and Resilient Systems - DX 2025  ],
  right-content: [
    Sept 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(20\) Analysis of the Efficiency of Traffic Control Algorithms on the Vanderbilt Campus]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Peter Long, Zhiyao Zhang, Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)Vanderbilt Young Scientist Journal  ],
  right-content: [
    June 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(19\) On the Design of Safe Continual RL Methods for Control of Nonlinear Systems]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)European Control Conference - ECC 2025

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.48550/arXiv.2502.15922")[10.48550/arXiv.2502.15922]  ],
  right-content: [
    June 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(18\) Real-Time Freeway Traffic Anomalous Event Detection System via Radar Detector Sensors]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Junyi Ji, Zhiyao Zhang, William Barbour, Marcos Quinones-Grueiro, Tyler Derr, Gautam Biswas, Daniel B Work

#v(design-highlights-top-margin - design-text-leading)ACM\/IEEE International Conference on Cyber-Physical Systems - ICCPS 2025

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1145/3716550.3725156")[10.1145/3716550.3725156]  ],
  right-content: [
    May 2025
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(17\) FT-AED: Benchmark Dataset for Early Freeway Traffic Anomalous Event Detection]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Junyi Ji, Marcos Quinones-Grueiro, William Barbour, Yuhang Zhang, Tyler Derr, Gautam Biswas, Daniel B Work

#v(design-highlights-top-margin - design-text-leading)Neural Information Processing Systems - NeurIPS 2024 Datasets and Benchmarks

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.48550/arXiv.2406.15283")[10.48550/arXiv.2406.15283]  ],
  right-content: [
    Dec 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(16\) Quantifying the Sim-To-Real Gap in UAV Disturbance Rejection]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)International Conference on Principles of Diagnosis and Resilient Systems - DX 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.4230/OASIcs.DX.2024.16")[10.4230/OASIcs.DX.2024.16]  ],
  right-content: [
    Oct 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(15\) Data-Driven RUL Prediction Using Performance Metrics]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Abel Diaz-Gonzalez, Austin Coursey, Marcos Quinones-Grueiro, Chetan S. Kulkarni, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)International Conference on Principles of Diagnosis and Resilient Systems - DX 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.4230/OASIcs.DX.2024.21")[10.4230/OASIcs.DX.2024.21]  ],
  right-content: [
    Oct 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(14\) An Experimental Framework for Evaluating the Safety and Robustness of UAV Controllers]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)AIAA Aviation Forum 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.2514/6.2024-4548")[10.2514/6.2024-4548]  ],
  right-content: [
    Aug 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(13\) Hybrid control framework of uavs under varying wind and payload conditions]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)American Control Conference - ACC 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.23919/ACC60939.2024.10645000")[10.23919/ACC60939.2024.10645000]  ],
  right-content: [
    July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(12\) Determining the temporal factors of survival associated with brain and nervous system cancer patients: A hybrid machine learning methodology]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Gopal Nath, Austin Coursey, Joseph Ekong, Elham Rastegari, Saptarshi Sengupta, Asli Z Dag, Dursun Delen

#v(design-highlights-top-margin - design-text-leading)International Journal of Healthcare Management

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1080/20479700.2023.2196101")[10.1080/20479700.2023.2196101]  ],
  right-content: [
    July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(11\) R Code Authorship Attribution using the ASAP Tool]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Matthew Tennyson, Vlad Krotov

#v(design-highlights-top-margin - design-text-leading)Journal of the Midwest Association for Information Systems

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.17705/3jmwa.000090")[10.17705/3jmwa.000090]  ],
  right-content: [
    July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(10\) Time-Series Few Shot Anomaly Detection for HVAC Systems]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Yuxin Huang, Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)IFAC Symposium on Fault Detection, Supervision and Safety for Technical Processes - Safe Process 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.ifacol.2024.07.255")[10.1016/j.ifacol.2024.07.255]  ],
  right-content: [
    June 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(9\) Comparison of Transfer Learning Techniques for Building Energy Forecasting]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Shansita Das Sharma, Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)IFAC Symposium on Fault Detection, Supervision and Safety for Technical Processes - Safe Process 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.ifacol.2024.07.214")[10.1016/j.ifacol.2024.07.214]  ],
  right-content: [
    June 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(8\) A Flexible Data-Driven Prognostics Model Using System Performance Metrics]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Abel Diaz-Gonzalez, Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)IFAC Symposium on Fault Detection, Supervision and Safety for Technical Processes - Safe Process 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.ifacol.2024.07.221")[10.1016/j.ifacol.2024.07.221]  ],
  right-content: [
    June 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(7\) An interactive web-based tool for predicting and exploring brain cancer survivability]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Gopal Nath, Austin Coursey, Yang Li, Srikanth Prabhu, Harish Garg, Shaymal C Halder, Saptarshi Sengupta

#v(design-highlights-top-margin - design-text-leading)Healthcare Analytics

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1016/j.health.2022.100132")[10.1016/j.health.2022.100132]  ],
  right-content: [
    Nov 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(6\) Enhancing Prognostics with Self-Supervised Imputation]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Austin Coursey, Abel Diaz-Gonzalez, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)International Workshop on Principles of Diagnosis - DX'23 - Workshop Paper  ],
  right-content: [
    Sept 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(5\) On Learning Data-Driven Models For In-Flight Drone Battery Discharge Estimation From Real Data]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Marcos Quinones-Grueiro, Gautam Biswas

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Smart Computing - SMARTCOMP 2023

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/SMARTCOMP58114.2023.00038")[10.1109/SMARTCOMP58114.2023.00038]  ],
  right-content: [
    June 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(4\) Large-scale End-of-Life Prediction of Hard Disks in Distributed Datacenters]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Rohan Mohapatra, Austin Coursey, Saptarshi Sengupta

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Smart Computing - SMARTCOMP 2023 - Workshop Paper

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/SMARTCOMP58114.2023.00069")[10.1109/SMARTCOMP58114.2023.00069]  ],
  right-content: [
    June 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(3\) Aspirations and practice of ml model documentation: Moving the needle with nudging and traceability]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Avinash Bhat, Austin Coursey \(joint primary\), Grace Hu, Sixian Li, Nadia Nahar, Shurui Zhou, Christian Kästner, Jin LC Guo

#v(design-highlights-top-margin - design-text-leading)CHI Conference on Human Factors in Computing Systems - CHI 2023

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1145/3544548.3581518")[10.1145/3544548.3581518]  ],
  right-content: [
    Apr 2023
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(2\) Incorporating a machine learning model into a Web-based administrative decision support tool for predicting workplace absenteeism]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Gopal Nath, Yawei Wang, Austin Coursey, Krishna K Saha, Srikanth Prabhu, Saptarshi Sengupta

#v(design-highlights-top-margin - design-text-leading)Information

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.3390/info13070320")[10.3390/info13070320]  ],
  right-content: [
    June 2022
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(1\) Remaining useful life estimation of hard disk drives using bidirectional lstm networks]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey, Gopal Nath, Srikanth Prabhu, Saptarshi Sengupta

#v(design-highlights-top-margin - design-text-leading)IEEE International Conference on Big Data - Big Data 2024

#v(design-highlights-top-margin - design-text-leading)#link("https://doi.org/10.1109/BigData52589.2021.9671605")[10.1109/BigData52589.2021.9671605]  ],
  right-content: [
    Dec 2021
  ],
)



== Under Submission



#one-col-entry(
  content: [
    #strong[\(8\) Detection of Compromised UAVs using Graph Machine Learning]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(7\) Distributed consensus for flight plans using hashgraph]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(6\) Networked Simulation for Cybersecurity Evaluation of Small Unmanned Aircraft Systems in Dense Urban Environments]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(5\) A Survey of Security Challenges and Solutions for UAS Traffic Management \(UTM\) and Small Unmanned Aerial Systems \(sUAS\)]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(4\) Remote ID Spoofing Attacks and Defenses]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(3\) Analyzing Embodied Learning in Classroom Settings: A Human-in-the-Loop AI Approach for Multimodal Learning Analytics]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(2\) A Large-Scale Benchmark Dataset for Freeway Anomalous Event Detection]

    
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[\(1\) Combining Reinforcement Learning and Cascade PID Control for UAV Disturbance Rejection]

    
  ],
)



== Theses


#two-col-entry(
  left-content: [
    #strong[\(2\) \(In progress\) Toward Detecting and Adapting to Non-Stationary Dynamics in Safety-Constrained Lifelong Reinforcement Learning]

  #v(-design-text-leading)
  #v(design-highlights-top-margin);Austin Coursey  ],
  right-content: [
    May 2026
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[\(1\) Data-driven models for remaining useful life estimation of aircraft engines and hard disk drives]

  #v(-design-text-leading)
#v(design-highlights-top-margin);Austin Coursey

#v(design-highlights-top-margin - design-text-leading)#link("https://digitalcommons.murraystate.edu/honorstheses/116/")[digitalcommons.murraystate.edu/honorstheses/116]  ],
  right-content: [
    May 2022
  ],
)



== Conferences and Refereeing


#two-col-entry(
  left-content: [
    #strong[AIAA Aviation Forum]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([System-Wide Safety session Co-Chair.],)
  ],
  right-content: [
    July 2024
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[IEEE Conference on Smart Computing]
    #v(-design-text-leading)

    #v(design-highlights-top-margin);#highlights([Student volunteer.],)
  ],
  right-content: [
    June 2023
  ],
)

#v(design-entries-vertical-space-between-entries)

#one-col-entry(
  content: [
    #strong[Refereeing]

    #v(-design-text-leading)
    #v(design-highlights-top-margin);#highlights([Neural Information Processing Systems \(NeurIPS 2025\)],[Latin American Control Conference \(CLCA 2025\)],[International Conference on Control and Fault-Tolerant Systems \(SysTol 2025\)],[Journal of Aerospace Engineering],[ACM Transactions on Cyber-Physical Systems],[International Workshop on Principles of Diagnosis \(DX 2024\)],[Journal of Aerospace Information Systems \(JAIS\)],[IEEE Transactions on Industrial Informatics],[ACM SIGKDD International Conference on Knowledge Discovery and Data Mining \(KDD 2024\) #strong[Best Reviewer Award]],[IFAC Symposium on Fault Detection, Supervision and Safety for Technical Processes \(Safe Process 2024\)],[American Control Conference \(ACC 2023, 2024\)],[Expert Systems with Applications],)
  ],
)



