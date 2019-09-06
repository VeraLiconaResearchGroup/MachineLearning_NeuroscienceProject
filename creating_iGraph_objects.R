
# create lists of file names

# choose working directory containing the dynamic signatures
setwd("~/Dropbox/Summer2019_Emily/HealthyAndRemitted/Dynamic_Signatures")

allfilenames <- as.list(dir(getwd(), pattern = "completecorr"))

allINCRLfilenames <- as.list(dir(getwd(), pattern = "INCRLcompletecorr"))

allINCLRfilenames <- as.list(dir(getwd(), pattern = "INCLRcompletecorr"))

allDECRLfilenames <- as.list(dir(getwd(), pattern = "DECRLcompletecorr"))

allDECLRfilenames <- as.list(dir(getwd(), pattern = "DECLRcompletecorr"))

setwd("~/Dropbox/Summer2019_Emily/HealthyAndRemitted/Remitted_Data")

remittedfilenames <- as.list(dir(getwd(), pattern = "completecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

remittedINCRLfilenames <- as.list(dir(getwd(), pattern = "INCRLcompletecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

remittedINCLRfilenames <- as.list(dir(getwd(), pattern = "INCLRcompletecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

remittedDECRLfilenames <- as.list(dir(getwd(), pattern = "DECRLcompletecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

remittedDECLRfilenames <- as.list(dir(getwd(), pattern = "DECLRcompletecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

healthyfilenames <- setdiff(allfilenames, lapply(remittedfilenames, gsub, pattern = ".*/", replacement = ""))

healthyINCRLfilenames <- setdiff(allINCRLfilenames, lapply(remittedINCRLfilenames, gsub, pattern = ".*/", replacement = ""))

healthyINCLRfilenames <- setdiff(allINCLRfilenames, lapply(remittedINCLRfilenames, gsub, pattern = ".*/", replacement = ""))

healthyDECRLfilenames <- setdiff(allDECRLfilenames, lapply(remittedDECRLfilenames, gsub, pattern = ".*/", replacement = ""))

healthyDECLRfilenames <- setdiff(allDECLRfilenames, lapply(remittedDECLRfilenames, gsub, pattern = ".*/", replacement = ""))


# create lists of dynamic signatures named as file names

setwd("~/Dropbox/Summer2019_Emily/HealthyAndRemitted/Dynamic_Signatures")

healthyINCLRdynsigs <- lapply(healthyINCLRfilenames, read.csv, header = TRUE, row.names = 1)

names(healthyINCLRdynsigs) <- healthyINCLRfilenames

healthyINCRLdynsigs <- lapply(healthyINCRLfilenames, read.csv, header = TRUE, row.names = 1)

names(healthyINCRLdynsigs) <- healthyINCRLfilenames

healthyDECLRdynsigs <- lapply(healthyDECLRfilenames, read.csv, header = TRUE, row.names = 1)

names(healthyDECLRdynsigs) <- healthyDECLRfilenames

healthyDECRLdynsigs <- lapply(healthyDECRLfilenames, read.csv, header = TRUE, row.names = 1)

names(healthyDECRLdynsigs) <- healthyDECRLfilenames

remittedINCLRdynsigs <- lapply(lapply(remittedINCLRfilenames, gsub, pattern = ".*/", replacement = ""), read.csv, header = TRUE, row.names = 1)

names(remittedINCLRdynsigs) <- lapply(remittedINCLRfilenames, gsub, pattern = ".*/", replacement = "")

remittedINCRLdynsigs <- lapply(lapply(remittedINCRLfilenames, gsub, pattern = ".*/", replacement = ""), read.csv, header = TRUE, row.names = 1)

names(remittedINCRLdynsigs) <- lapply(remittedINCRLfilenames, gsub, pattern = ".*/", replacement = "")

remittedDECLRdynsigs <- lapply(lapply(remittedDECLRfilenames, gsub, pattern = ".*/", replacement = ""), read.csv, header = TRUE, row.names = 1)

names(remittedDECLRdynsigs) <- lapply(remittedDECLRfilenames, gsub, pattern = ".*/", replacement = "")

remittedDECRLdynsigs <- lapply(lapply(remittedDECRLfilenames, gsub, pattern = ".*/", replacement = ""), read.csv, header = TRUE, row.names = 1)

names(remittedDECRLdynsigs) <- lapply(remittedDECRLfilenames, gsub, pattern = ".*/", replacement = "")


# create lists of iGraph objects

library(igraph)

healthyINCLRgraphs <- lapply(lapply(healthyINCLRdynsigs, as.matrix), graph.adjacency)

healthyINCRLgraphs <- lapply(lapply(healthyINCRLdynsigs, as.matrix), graph.adjacency)

healthyDECLRgraphs <- lapply(lapply(healthyDECLRdynsigs, as.matrix), graph.adjacency)

healthyDECRLgraphs <- lapply(lapply(healthyDECRLdynsigs, as.matrix), graph.adjacency)

remittedINCLRgraphs <- lapply(lapply(remittedINCLRdynsigs, as.matrix), graph.adjacency)

remittedINCRLgraphs <- lapply(lapply(remittedINCRLdynsigs, as.matrix), graph.adjacency)

remittedDECLRgraphs <- lapply(lapply(remittedDECLRdynsigs, as.matrix), graph.adjacency)

remittedDECRLgraphs <- lapply(lapply(remittedDECRLdynsigs, as.matrix), graph.adjacency)

# combine graph lists by trial type

INCLRgraphs <- c(healthyINCLRgraphs, remittedINCLRgraphs)

INCRLgraphs <- c(healthyINCRLgraphs, remittedINCRLgraphs)

DECLRgraphs <- c(healthyDECLRgraphs, remittedDECLRgraphs)

DECRLgraphs <- c(healthyDECRLgraphs, remittedDECRLgraphs)

# if desired, clear global environment of everything except for graph lists:
# rm(list = setdiff(ls(), c("DECLRgraphs", "DECRLgraphs", "INCLRgraphs", "INCRLgraphs")))
