
# run creating_iGraph_objects.R, general_network_features.R, triad_occurrences_hippocampus_subgraphs.R, clinical_data_processing.R, subject_data_analysis.R, feature_selection.py


rfe162 <- read.csv("selectedfeatures162.csv", header = TRUE, row.names = 2)

rfe162 <- rfe162[, -1]

rfe162 <- transform(rfe162, class = subjectdata$class)


rfe101 <- read.csv("selectedfeatures101.csv", header = TRUE, row.names = 2)

rfe101 <- rfe101[, -1]

rfe101 <- transform(rfe101, class = subjectdata$class)


rfe60 <- read.csv("selectedfeatures60.csv", header = TRUE, row.names = 2)

rfe60 <- rfe60[, -1]

rfe60 <- transform(rfe60, class = subjectdata$class)