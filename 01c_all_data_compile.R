d_list <- list(
  weight_g <- c(d_kobo_coiba_tool$weight_g , d_pre_kobo$weight, mtc$weight , msh_ner$Weight ) ,
  length_mm <- c(d_kobo_coiba_tool$length_mm_max , d_pre_kobo$length , mtc$length , msh_ner$Length ) ,
  width_mm <- c(d_kobo_coiba_tool$width_mm_max , d_pre_kobo$width , mtc$width , msh_ner$Width_50) ,
  thickness_mm <- c(d_kobo_coiba_tool$thickness, d_pre_kobo$thickness , mtc$thickness , msh_ner$Thickness_50 ) ,
  genus <- c(d_kobo_coiba_tool$genus_index , d_pre_kobo$genus_index , mtc$genus_index , msh_ner$genus_index) ,
  terminalia <- c(d_kobo_coiba_tool$debris_at_site_almendra , d_pre_kobo$almendras_yes , mtc$terminalia , msh_ner$terminalia) , 
  nerite <-  c(d_kobo_coiba_tool$debris_at_site_marine_snail , d_pre_kobo$caracol_yes , mtc$nerite , msh_ner$nerite)
)

#merge nerites, labio and monodonta in next
str(d_list)
