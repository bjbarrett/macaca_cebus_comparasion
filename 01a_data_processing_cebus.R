library(janitor)
library(stringr)
library(gtools)

#functions
numbers_only <- function(x) !grepl("\\D", x)

#load kobo coiba data

####load new data from kobo
dk_raw <- read.csv("~/Documents/macaca_cebus_hammer_comparison/data/Capuchin_Tool_Surveying_-_all_versions_-_False_-_2022-07-23-17-33-09.csv", header=TRUE, sep=";")
dk <-dk_raw

##coiba subset
xx <- as.vector(sapply(dk_raw, function(x)all(any(is.na(x))))) #makes a vector of T/F if all NA
dk <- dk_raw[,xx==FALSE] #creat dk which removes all columns with all NAs
colnames(dk)
dk <- clean_names(dk)
dk_temp <- dk
dk <- dk[numbers_only(dk$site_id)==FALSE,]

##to do, check all names in kobo
#dk <- dk[-(which(dk$site_id=="Cliff1"):which(dk$site_id=="Wtu3")),] #remove claudio to inspect

criteria <- str_detect(dk$site_id, "T")  # Extract matching rows with str_detect
dk$used_tool <- ifelse(criteria==TRUE , 1 , 0)

criteria <- str_detect(dk$site_id, "Clff")  # Extract matching rows with str_detect
for( i in 1:nrow(dk)){
  dk$used_tool[i] <- ifelse(criteria[i]==TRUE , 1 , dk$used_tool[i])
}
sum(dk$used_tool)

criteria <- str_detect(dk$site_id, "Fridge")  # Extract matching rows with str_detect
for( i in 1:nrow(dk)){
  dk$used_tool[i] <- ifelse(criteria[i]==TRUE , 1 , dk$used_tool[i])
}

criteria <- str_detect(dk$site_id, "Wtu")  # Extract matching rows with str_detect
for( i in 1:nrow(dk)){
  dk$used_tool[i] <- ifelse(criteria[i]==TRUE , 1 , dk$used_tool[i])
}

criteria <- str_detect(dk$site_id, "ex")  # Extract matching rows with str_detect
for( i in 1:nrow(dk)){
  dk$used_tool[i] <- ifelse(criteria[i]==TRUE , 1 , dk$used_tool[i])
}

criteria <- str_detect(dk$site_id, "Cebus")  # Extract matching rows with str_detect
for( i in 1:nrow(dk)){
  dk$used_tool[i] <- ifelse(criteria[i]==TRUE , 1 , dk$used_tool[i])
}

dk$weight_g
dk <- dk[which(dk$weight_g!=0 & dk$length_mm_max!=0 &  dk$width_mm_max!=0 & dk$thickness!=0),]

dk$used_tool

dk_tools <- dk[dk$used_tool==1,]
str(dk)
d_kobo_coiba_tool <- dk[dk$debris_at_site_almendra==1 | dk$debris_at_site_marine_snail==1,]
#refits?
d_kobo_coiba_tool <- d_kobo_coiba_tool[d_kobo_coiba_tool$anvil_type_stone==1,]
#
d_kobo_coiba_tool[,c("today" , "site_id" ,"fragmentation" , "weight_g" , "length_mm_max" , "width_mm_max" , "thickness")]


##load pre coiba stuff

mar2018 <- read.csv("data/jicaron_mar_2018.csv")
jul2018 <- read.csv("data/jicaron_july_2018.csv")
jul2017jan2018 <- read.csv("data/jicaron_july_2017_jan_2018.csv")
janmar2019 <- read.csv("data/Jan March 2019.csv")
raw_avail <- read.csv("data/raw_material_survey/TransectsJicaron.csv", sep=";")
##add nut to this from datasets where it is missing
mar2018$NUT <- 0
janmar2019$NUT <- 0


d <- smartbind(mar2018,jul2018,janmar2019)
d <- clean_names(d) #make names tidy

d <- d[is.na(d$length)==FALSE,] #drop nas length from smartbind
d <- d[d$hammer!="Wooden",] #get rid of Wooden Hammer
d$weight <- as.numeric(d$weight) #force to numeric
#below steps coorect errors where length and width are messed up. width is widest dimension by default
dl <- d$length
dw <- d$width
which(d$length > d$width)
which(d$length < d$width)
which(d$width  <  d$thickness)
which(d$length  <  d$thickness) #only one where length is greater than thickness
d$length[which(dl < dw)] <- dw[which(dl < dw)] #swap l and w
d$width[which(dl < dw)] <- dl[which(dl < dw)] #swap l and w
which(d$length < d$width) #check for zero if correct
d$almendras_yes <- ifelse(d$almendras=="Yes" , 1 , 0)
d$shells_yes <- ifelse(d$shells=="Yes" , 1 , 0)
d$hcrabs_yes <- ifelse(d$hcrabs=="Yes" , 1 , 0)
d$caracol_yes <- 0
d$caracol_yes[grep("caracol" , d$comments)] <- 1
d$caracol_yes[grep("snail" , d$comments)] <- 1

##anvil issues
d$stone_anvil <- 1
d$stone_anvil[grep("Wood" , d$anvil)] <- 0
d_pre_kobo <- d
d_pre_kobo <- d_pre_kobo[d_pre_kobo$almendras_yes==1 & d_pre_kobo$stone_anvil==1 | d_pre_kobo$caracol_yes==1 & d_pre_kobo$fragmentation=="Whole",] #subset to almendras

d_pre_kobo$genus <- "Cebus"
d_kobo_coiba_tool$genus <- "Cebus"
d_pre_kobo$genus_index <- 1
d_kobo_coiba_tool$genus_index <- 1

