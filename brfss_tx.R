library(tidyverse)

# load data 
state_15_working_pudf <- read_dta("Library/CloudStorage/GoogleDrive-lamhine@stanford.edu/My Drive/My papers, presentations, and abstracts/BRFSS MRACASC1/Texas/PUDF15/state_15_working_pudf.dta")

# detailed race variable needs to be constructed from vars starting with c07q04
# select all vars starting with c07q04
tx_2015 <- state_15_working_pudf %>% 
  dplyr::select(SEQNO, starts_with("c07q04"))

# get counts of non-NAs by each column 
# last race selected for each individual is followed by 88
colSums(!is.na(tx_2015))

# one person selected five races; look closer at this one individual
tx_2015 %>% filter(!is.na(c07q04f))
