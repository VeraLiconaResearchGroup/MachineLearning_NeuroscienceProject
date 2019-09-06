
# run creating_iGraph_objects.R, general_network_features.R, triad_occurrences_hippocampus_subgraphs.R, clinical_data_processing.R, subject_data_analysis.R, feature_selection.py, import_selected_features.R, knn_binary_loop.R


subjectdatarecallvalues <- vector()
subjectdataprecisionvalues <- vector()

# calculate precision and recall using various k
for (i in 1:15){
  subjectdatarecallvalues[i] <- knn_binary_loop(subjectdata, i, 204, "remitted")$recall
  subjectdataprecisionvalues[i] <- knn_binary_loop(subjectdata, i, 204, "remitted")$precision
}

# plot precision-recall curve with points and diagonal
ggplot(data.frame(subjectdatarecallvalues, subjectdataprecisionvalues), aes(x = subjectdatarecallvalues, y = subjectdataprecisionvalues)) + geom_point() + geom_abline()

# plot precision-recall curve with connected points and diagonal
ggplot(data.frame(subjectdatarecallvalues, subjectdataprecisionvalues), aes(x = subjectdatarecallvalues, y = subjectdataprecisionvalues)) + geom_line() + geom_abline()

# plot precision-recall curve with connected points
ggplot(data.frame(subjectdatarecallvalues, subjectdataprecisionvalues), aes(x = subjectdatarecallvalues, y = subjectdataprecisionvalues)) + geom_line()

# plot precision-recall curve with connected points and labeled axes
ggplot(data.frame(subjectdatarecallvalues, subjectdataprecisionvalues), aes(x = subjectdatarecallvalues, y = subjectdataprecisionvalues)) + geom_line() + labs(x = "recall", y = "precision")





rfe101recallvalues <- vector()
rfe101precisionvalues <- vector()

for (i in 1:15){
  rfe101recallvalues[i] <- knn_binary_loop(rfe101, i, 102, "remitted")$recall
  rfe101precisionvalues[i] <- knn_binary_loop(rfe101, i, 102, "remitted")$precision
}

ggplot(data.frame(rfe101recallvalues, rfe101precisionvalues), aes(x = rfe101recallvalues, y = rfe101precisionvalues)) + geom_line() + labs(x = "recall", y = "precision")





DECrecallvalues <- vector()
DECprecisionvalues <- vector()

for (i in 1:15){
  DECrecallvalues[i] <- knn_binary_loop(DECgraphstats, i, 33, "remitted")$recall
  DECprecisionvalues[i] <- knn_binary_loop(DECgraphstats, i, 33, "remitted")$precision
}

ggplot(data.frame(DECrecallvalues, DECprecisionvalues), aes(x = DECrecallvalues, y = DECprecisionvalues)) + geom_line() + geom_abline()





INCrecallvalues <- vector()
INCprecisionvalues <- vector()

for (i in 1:15){
  INCrecallvalues[i] <- knn_binary_loop(INCgraphstats, i, 33, "remitted")$recall
  INCprecisionvalues[i] <- knn_binary_loop(INCgraphstats, i, 33, "remitted")$precision
}

ggplot(data.frame(INCrecallvalues, INCprecisionvalues), aes(x = INCrecallvalues, y = INCprecisionvalues)) + geom_line() + geom_abline()





