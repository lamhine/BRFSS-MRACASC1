library(tidyverse)

# load data 
state_15_working_pudf <- read_dta("Library/CloudStorage/GoogleDrive-lamhine@stanford.edu/My Drive/My papers, presentations, and abstracts/BRFSS MRACASC1/Texas/PUDF15/state_15_working_pudf.dta")

## select variables ##
# detailed race variable needs to be constructed from vars starting with c07q04
# ACEs questions start with TX10Q
tx_2015 <- state_15_working_pudf %>% 
  dplyr::select(
    SEQNO,
    starts_with("c07q04"),
    starts_with("TX10Q")
    )

# get counts of non-NA race responses by each of the c07q04 columns 
# last race selected for each individual is followed by 88
tx_2015 %>% 
  dplyr::select(
    starts_with("c07q04")
    ) %>% 
  is.na(.) %>% 
  `!` %>% 
  colSums()

# one person selected five races; look closer at this one individual
tx_2015 %>% filter(!is.na(c07q04f))
