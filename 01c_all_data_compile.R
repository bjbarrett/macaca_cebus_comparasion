 cebbzz <- c(d_kobo_coiba_tool$genus_index , d_pre_kobo$genus_index , mtc$genus_index , msh_ner$genus_index)
 cebbzz <-  cebbzz-1
d_list <- list(
  weight_g = c(d_kobo_coiba_tool$weight_g , d_pre_kobo$weight, mtc$weight , msh_ner$Weight ) ,
  length_mm = c(d_kobo_coiba_tool$length_mm_max , d_pre_kobo$length , mtc$length , msh_ner$Length ) ,
  width_mm = c(d_kobo_coiba_tool$width_mm_max , d_pre_kobo$width , mtc$width , msh_ner$Width_50) ,
  thickness_mm = c(d_kobo_coiba_tool$thickness, d_pre_kobo$thickness , mtc$thickness , msh_ner$Thickness_50 ) ,
  genus_index = c(d_kobo_coiba_tool$genus_index , d_pre_kobo$genus_index , mtc$genus_index , msh_ner$genus_index) ,
  terminalia = c(d_kobo_coiba_tool$debris_at_site_almendra , d_pre_kobo$almendras_yes , mtc$terminalia , msh_ner$terminalia) , 
  nerite =  c(d_kobo_coiba_tool$debris_at_site_marine_snail , d_pre_kobo$caracol_yes , mtc$nerite , msh_ner$nerite) , 
  macaca =  cebbzz
)

#merge nerites, labio and monodonta in next
str(d_list)

cebbzz2 <- c(d_kobo_coiba_tool$genus_index[d_kobo_coiba_tool$debris_at_site_almendra==1] , d_pre_kobo$genus_index[d_pre_kobo$almendras_yes==1] , mtc$genus_index )
cebbzz2 <- cebbzz2 - 1

d_list_tc <- list(
  weight_g = c(d_kobo_coiba_tool$weight_g[d_kobo_coiba_tool$debris_at_site_almendra==1] , d_pre_kobo$weight[d_pre_kobo$almendras_yes==1], mtc$weight  ) ,
  length_mm = c(d_kobo_coiba_tool$length_mm_max[d_kobo_coiba_tool$debris_at_site_almendra==1] , d_pre_kobo$length[d_pre_kobo$almendras_yes==1] , mtc$length  ) ,
  width_mm = c(d_kobo_coiba_tool$width_mm_max[d_kobo_coiba_tool$debris_at_site_almendra==1] , d_pre_kobo$width[d_pre_kobo$almendras_yes==1] , mtc$width ) ,
  thickness_mm = c(d_kobo_coiba_tool$thickness[d_kobo_coiba_tool$debris_at_site_almendra==1], d_pre_kobo$thickness[d_pre_kobo$almendras_yes==1] , mtc$thickness ) ,
  genus_index = c(d_kobo_coiba_tool$genus_index[d_kobo_coiba_tool$debris_at_site_almendra==1] , d_pre_kobo$genus_index[d_pre_kobo$almendras_yes==1] , mtc$genus_index ) ,
  macaca =  cebbzz2
)

str(d_list_tc)
