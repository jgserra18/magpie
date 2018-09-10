*** |  (C) 2008-2018 Potsdam Institute for Climate Impact Research (PIK),
*** |  authors, and contributors see AUTHORS file
*** |  This file is part of MAgPIE and licensed under GNU AGPL Version 3
*** |  or later. See LICENSE file or go to http://www.gnu.org/licenses/
*** |  Contact: magpie@pik-potsdam.de

*' @description The foragebased_aug18 realization constrains the cellular ruminant livestock production by 
*' the feed availability for grazed pasture and fodder crops. This accounts for the fact that pasture and fodder 
*' (summarized with forage) feed stuff is usually not transported over long distances and by the the same time 
*' are were essential in livestock diets. The monogastric livestock is distributed following the very simply idea 
*' that these animals are held close to densely populated areas. 


*' @limitations Distribution of monogastrics do not account for feed availability within a cell.


*####################### R SECTION START (PHASES) ##############################
$Ifi "%phase%" == "sets" $include "./modules/71_disagg_lvst/foragebased_aug18/sets.gms"
$Ifi "%phase%" == "declarations" $include "./modules/71_disagg_lvst/foragebased_aug18/declarations.gms"
$Ifi "%phase%" == "equations" $include "./modules/71_disagg_lvst/foragebased_aug18/equations.gms"
$Ifi "%phase%" == "preloop" $include "./modules/71_disagg_lvst/foragebased_aug18/preloop.gms"
$Ifi "%phase%" == "postsolve" $include "./modules/71_disagg_lvst/foragebased_aug18/postsolve.gms"
$Ifi "%phase%" == "nl_fix" $include "./modules/71_disagg_lvst/foragebased_aug18/nl_fix.gms"
$Ifi "%phase%" == "nl_release" $include "./modules/71_disagg_lvst/foragebased_aug18/nl_release.gms"
*######################## R SECTION END (PHASES) ###############################
