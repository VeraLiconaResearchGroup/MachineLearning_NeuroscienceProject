
# intersection_threshold_merge() is a function with:
# inputs: list of dataframes which are adjacency matrices, threshold percentage
# output: a dataframe which contains the intersection of the input networks constructed using the given threshold percentage
intersection_threshold_merge <- function(list_of_networks, threshold){
  result <- list_of_networks[[1]]
  for (i in rownames(list_of_networks[[1]])){
    for (j in colnames(list_of_networks[[1]])){
      count <- 0
      for (network in list_of_networks){
        entry <- network[i, j]
        if (entry != 0){
          count <- count + 1
        }
      }
      if (count >= (threshold * length(list_of_networks))){
        result[i, j] <- 1
      } else {
        result[i, j] <- 0
      }
    }
  }
  return(result)
}

# choose directory which contains the dynamic signatures
setwd("~/Dropbox/Summer2019_Emily/HealthyAndRemitted/Dynamic_Signatures")

filenames <- as.list(dir(getwd(), pattern = "completecorr"))

# list of all dynamic signatures
dynamicsignatures <- lapply(filenames, read.csv, header = TRUE, row.names = 1)

intersection <- intersection_threshold_merge(dynamicsignatures, .8)

# the remainder of the code is used to get the lists of and find some intersections for the healthy and remitted dynamic signatures separately

setwd("~/Dropbox/Summer2019_Emily/HealthyAndRemitted/Remitted_Data")

remittedfilenames <- as.list(dir(getwd(), pattern = "completecorr_DynSig", recursive = TRUE, include.dirs = TRUE))

rdynamicsignatures <- lapply(remittedfilenames, read.csv, header = TRUE, row.names = 1)

rintersection <- intersection_threshold_merge(rdynamicsignatures, .7)

hdynamicsignatures <- as.list(setdiff(as.vector(dynamicsignatures), as.vector(rdynamicsignatures)))

hintersection <- intersection_threshold_merge(hdynamicsignatures, .7)

