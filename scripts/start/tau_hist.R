# |  (C) 2008-2020 Potsdam Institute for Climate Impact Research (PIK)
# |  authors, and contributors see CITATION.cff file. This file is part
# |  of MAgPIE and licensed under AGPL-3.0-or-later. Under Section 7 of
# |  AGPL-3.0, you are granted additional permissions described in the
# |  MAgPIE License Exception, version 1.0 (see LICENSE file).
# |  Contact: magpie@pik-potsdam.de


######################################
#### Script to start a MAgPIE run ####
######################################

library(lucode)
library(magclass)
library(gdx)

# Load start_run(cfg) function which is needed to start MAgPIE runs
source("scripts/start_functions.R")

getInput <- function(gdx,ghg_price=TRUE,biodem=TRUE) {
  if(ghg_price) {
    a <- readGDX(gdx,"f56_pollutant_prices_coupling")
    write.magpie(a,"modules/56_ghg_policy/input/f56_pollutant_prices_coupling.cs3")
  }
  if(biodem) {
    a <- readGDX(gdx,"f60_bioenergy_dem_coupling")
    write.magpie(a,"modules/60_bioenergy/input/reg.2ndgen_bioenergy_demand.csv")
  }
}

#start MAgPIE run
source("config/default.cfg")

#cfg$force_download <- FALSE

cfg$results_folder <- "output/:title:"

#06 bug pasture production
#07 bugfix pasture production
#08 Update from Edna
#09 bugfix aff
#10 recalc npi
#13 final test

cfg$input <- c("isimip_rcp-IPSL_CM5A_LR-rcp2p6-co2_rev42_c200_690d3718e151be1b450b394c1064b1c5.tgz",
               "rev4.37_690d3718e151be1b450b394c1064b1c5_magpie.tgz",
               "rev4.37_690d3718e151be1b450b394c1064b1c5_validation.tgz",
#               "calibration_H12_c200_12Sep18.tgz",
               "additional_data_rev3.77.tgz")

prefix <- "TAU04"

for (ssp in c("SSP2")) {
  for (acc in c(0.01,0.02,0.03,0.04,0.05)) {
    for (damp in c(0.98,0.95)) {
      cfg <- setScenario(cfg,c(ssp,"NPI"))
      cfg$gms$c56_pollutant_prices <- "coupling"
      cfg$gms$c60_2ndgen_biodem <- "coupling"
      getInput(paste0("/p/projects/piam/runs/coupled-magpie/output/C_",ssp,"-NPi-mag-4/fulldata.gdx"))
      #cfg$gms$tc <- "exo"
      cfg$recalibrate <- TRUE
      cfg$calib_accuracy <- acc
      cfg$calib_maxiter <- 30
      cfg$damping_factor <- damp
      cfg$force_download <- TRUE
      cfg$title <- paste0(prefix,"_",ssp,"_","NPI","_","acc",acc*100,"_damp",damp*100)
      start_run(cfg,codeCheck=FALSE)
    }
  }
}

