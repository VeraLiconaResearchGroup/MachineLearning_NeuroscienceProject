
knn_binary_loop <- function(dataset, knumber, classificationscolumn, positivelevel){
  result = data.frame(true_positives = NA, true_negatives = NA, false_positives = NA, false_negatives = NA, precision = NA, recall = NA, true_positive_rate = NA, false_positive_rate = NA)
  level1 <- levels(dataset[, classificationscolumn])[1]
  level2 <- levels(dataset[, classificationscolumn])[2]
  truepositives <- 0
  truenegatives <- 0
  falsepositives <- 0
  falsenegatives <- 0
  datascaled <- scale(dataset[, -classificationscolumn])
  for (i in 1:nrow(dataset)){
    testsubject <- datascaled[i, ]
    trainingset <- datascaled[-i, ]
    knnclassification <- class::knn(train = trainingset, test = testsubject, k = knumber, cl = dataset[-i, classificationscolumn])
    boolean <- (knnclassification == dataset[i, classificationscolumn])
    if ((boolean == TRUE) & (dataset[i, classificationscolumn] == positivelevel)){
      truepositives <- truepositives + 1
    } else if ((boolean == TRUE) & (dataset[i, classificationscolumn] != positivelevel)){
      truenegatives <- truenegatives + 1
    } else if ((boolean == FALSE) & (dataset[i, classificationscolumn] != positivelevel)){
      falsepositives <- falsepositives + 1
    } else {
      falsenegatives <- falsenegatives + 1
    }
      }
  precision <- truepositives/(truepositives + falsepositives)
  recall <- truepositives/(truepositives + falsenegatives)
  truepositiverate <- recall
  falsepositiverate <- falsepositives/(falsepositives + truenegatives)
  result[1,] <- list(truepositives, truenegatives, falsepositives, falsenegatives, precision, recall, truepositiverate, falsepositiverate)
  return(result)
}
