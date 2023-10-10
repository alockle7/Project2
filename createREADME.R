#author: Autumn Locklear
#purpose: Render censusVingette.Rmd as a .md file called README.md for my repo.

rmarkdown::render(
  input = "censusVignette.Rmd",
  output_format = "github_document",
  output_file = "README.md"
)

