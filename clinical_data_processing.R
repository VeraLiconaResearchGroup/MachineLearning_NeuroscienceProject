
# choose directory that contains the clinical data
setwd("~/Desktop")

library(readxl)

clinicaldata <- read_excel("ER_BehavioralData_HC_MDDRemitted.xlsx")

newlist <- setdiff(unlist(clinicaldata[, 2], use.names = FALSE), lapply(rownames(graphstats), substr, start = 1, stop = 8))

clinicaldata <- clinicaldata[!(clinicaldata$X__2 %in% newlist), ]

clinicaldata <- as.data.frame(clinicaldata)

clinicaldata <- clinicaldata[, -1]

clinicaldatarownames <- clinicaldata$X__2

clinicaldata <- clinicaldata[, -1]

clinicaldata <- as.data.frame(apply(clinicaldata, 2, as.numeric))

transform(clinicaldata, class = graphstats$class) -> clinicaldata

rownames(clinicaldata) <- clinicaldatarownames

for (i in 1:129){
  for (j in 1:531){
    if (is.nan(clinicaldata[i, j]) == TRUE){
      clinicaldata[i, j] <- NA
    }
  }
}

# find percentages of missing data for rows and columns

sort(apply(clinicaldata, 1, function(x){sum(is.na(x))})/ncol(clinicaldata), decreasing = TRUE)

sort(apply(clinicaldata, 2, function(x){sum(is.na(x))})/nrow(clinicaldata), decreasing = TRUE)

# remove four subjects with most missing data

highna4subjects <- sort(apply(clinicaldata, 1, function(x){sum(is.na(x))})/ncol(clinicaldata), decreasing = TRUE)[1:4]

highna4subjects <- names(highna4subjects)

clinicaldatasans4subjects <- clinicaldata[!(rownames(clinicaldata) %in% highna4subjects), ]

clinicaldatasans4subjects <- clinicaldatasans4subjects[, colSums(is.na(clinicaldata)) == 0]
# only 13 features

# remove five subjects

highna5subjects <- sort(apply(clinicaldata, 1, function(x){sum(is.na(x))})/ncol(clinicaldata), decreasing = TRUE)[1:5]

highna5subjects <- names(highna5subjects)

clinicaldatasans5subjects <- clinicaldata[!(rownames(clinicaldata) %in% highna5subjects), ]

clinicaldatasans5subjects <- clinicaldatasans5subjects[, colSums(is.na(clinicaldata)) == 0]
# still only 13 features

# since removing even 5 subjects fails to recover any of the features that are lost by simply removing all columns with missing values, keep all of the subjects and proceed with just the 13 features without missing values

subjectdata <- cbind(graphstats[, -191], clinicaldata[, colSums(is.na(clinicaldata)) == 0])
