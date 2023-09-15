mtc <- read.csv("data/macaca_sea_almond_.csv")
mtc$weight <- mtc$Weight_g
mtc$width <- mtc$Width_mm
mtc$length <- mtc$Length_mm
mtc$thickness <- mtc$Tickness_mm
mtc$terminalia <- 1
mtc$genus <- "Macaca"
mtc$genus_index <- 2
mtc$nerite <- 0
str(mtc)

msh <- read.csv("data/macaca_shellfish.csv")
str(msh)
unique(msh$Prey_type)
unique(msh$Prey_spec)
msh_ner <- msh[msh$Prey_spec=="NERITE" | msh$Prey_spec=="M_LABIO" | msh$Prey_spec=="MORULA",]
msh_ner$nerite <- 1
msh_ner$terminalia <- 0
msh_ner$genus <- "Macaca"
msh_ner$genus_index <- 2
