
# run creating_iGraph_objects.R

# calculate network characteristics for INCLR trials

hcliques <- lapply(healthyINCLRgraphs, clique.number)

rcliques <- lapply(remittedINCLRgraphs, clique.number)

hdensity <- lapply(healthyINCLRgraphs, edge_density)

rdensity <- lapply(remittedINCLRgraphs, edge_density)

hmeandistance <- lapply(healthyINCLRgraphs, mean_distance)

rmeandistance <- lapply(remittedINCLRgraphs, mean_distance)

harticulationpoints <- lapply(healthyINCLRgraphs, articulation_points)

harticulationpoints <- lapply(harticulationpoints, length)

rarticulationpoints <- lapply(remittedINCLRgraphs, articulation_points)

rarticulationpoints <- lapply(rarticulationpoints, length)

hassortativitydegree <- lapply(healthyINCLRgraphs, assortativity_degree)

rassortativitydegree <- lapply(remittedINCLRgraphs, assortativity_degree)

hbetweenness <- lapply(healthyINCLRgraphs, betweenness)

hbetweenness <- lapply(hbetweenness, mean)

rbetweenness <- lapply(remittedINCLRgraphs, betweenness)

rbetweenness <- lapply(rbetweenness, mean)

hedgebetweenness <- lapply(healthyINCLRgraphs, edge_betweenness)

hedgebetweenness <- lapply(hedgebetweenness, mean)

redgebetweenness <- lapply(remittedINCLRgraphs, edge_betweenness)

redgebetweenness <- lapply(redgebetweenness, mean)

hbiconnectedcomponents <- lapply(healthyINCLRgraphs, biconnected_components)

hbiconnectedcomponents <- lapply(hbiconnectedcomponents, `[[`, 1)

rbiconnectedcomponents <- lapply(remittedINCLRgraphs, biconnected_components)

rbiconnectedcomponents <- lapply(rbiconnectedcomponents, `[[`, 1)

hcloseness <- lapply(healthyINCLRgraphs, centr_clo)

hcloseness <- lapply(hcloseness, `[[`, 2)

rcloseness <- lapply(remittedINCLRgraphs, centr_clo)

rcloseness <- lapply(rcloseness, `[[`, 2)

hdegree <- lapply(healthyINCLRgraphs, centr_degree)

hdegree <- lapply(hdegree, `[[`, 2)

rdegree <- lapply(remittedINCLRgraphs, centr_degree)

rdegree <- lapply(rdegree, `[[`, 2)

heigenvector <- lapply(healthyINCLRgraphs, centr_eigen)

heigenvector <- lapply(heigenvector, `[[`, 4)

reigenvector <- lapply(remittedINCLRgraphs, centr_eigen)

reigenvector <- lapply(reigenvector, `[[`, 4)

hconnectedcomponents <- lapply(healthyINCLRgraphs, count_components)

rconnectedcomponents <- lapply(remittedINCLRgraphs, count_components)

hdiameter <- lapply(healthyINCLRgraphs, diameter)

rdiameter <- lapply(remittedINCLRgraphs, diameter)

hdyadcensus <- lapply(healthyINCLRgraphs, dyad_census)

hmutualdyads <- lapply(hdyadcensus, `[[`, 1)

hasymmetricdyads <- lapply(hdyadcensus, `[[`, 2)

rdyadcensus <- lapply(remittedINCLRgraphs, dyad_census)

rmutualdyads <- lapply(rdyadcensus, `[[`, 1)

rasymmetricdyads <- lapply(rdyadcensus, `[[`, 2)

htransitivity <- lapply(healthyINCLRgraphs, transitivity, type = "global")

rtransitivity <- lapply(remittedINCLRgraphs, transitivity, type = "global")




# create data frames for INCLR trials

healthyINCLRgraphstats <- data.frame(unlist(harticulationpoints), unlist(hassortativitydegree), unlist(hasymmetricdyads), unlist(hbetweenness), unlist(hbiconnectedcomponents), unlist(hcliques), unlist(hcloseness), unlist(hconnectedcomponents), unlist(hdegree), unlist(hdensity), unlist(hdiameter), unlist(hedgebetweenness), unlist(heigenvector), unlist(hmeandistance), unlist(hmutualdyads), unlist(htransitivity))

remittedINCLRgraphstats <- data.frame(unlist(rarticulationpoints), unlist(rassortativitydegree), unlist(rasymmetricdyads), unlist(rbetweenness), unlist(rbiconnectedcomponents), unlist(rcliques), unlist(rcloseness), unlist(rconnectedcomponents), unlist(rdegree), unlist(rdensity), unlist(rdiameter), unlist(redgebetweenness), unlist(reigenvector), unlist(rmeandistance), unlist(rmutualdyads), unlist(rtransitivity))

cnames <- c("articulation points", "assortativity degree", "asymmetric dyads", "betweenness", "biconnected components", "cliques", "closeness", "connected components", "degree", "density", "diameter", "edge betweenness", "eigenvector", "mean distance", "mutual dyads", "transitivity")

colnames(healthyINCLRgraphstats) <- cnames

colnames(remittedINCLRgraphstats) <- cnames

rownames(healthyINCLRgraphstats) <- healthyINCLRfilenames

rownames(remittedINCLRgraphstats) <- lapply(remittedINCLRfilenames, gsub, pattern = ".*/", replacement = "")

write.csv(healthyINCLRgraphstats, file = "healthy_INC_LR_graphstats.csv")

write.csv(remittedINCLRgraphstats, file = "remitted_INC_LR_graphstats.csv")




# recreate for INCRL trials

hcliques <- lapply(healthyINCRLgraphs, clique.number)

rcliques <- lapply(remittedINCRLgraphs, clique.number)

hdensity <- lapply(healthyINCRLgraphs, edge_density)

rdensity <- lapply(remittedINCRLgraphs, edge_density)

hmeandistance <- lapply(healthyINCRLgraphs, mean_distance)

rmeandistance <- lapply(remittedINCRLgraphs, mean_distance)

harticulationpoints <- lapply(healthyINCRLgraphs, articulation_points)

harticulationpoints <- lapply(harticulationpoints, length)

rarticulationpoints <- lapply(remittedINCRLgraphs, articulation_points)

rarticulationpoints <- lapply(rarticulationpoints, length)

hassortativitydegree <- lapply(healthyINCRLgraphs, assortativity_degree)

rassortativitydegree <- lapply(remittedINCRLgraphs, assortativity_degree)

hbetweenness <- lapply(healthyINCRLgraphs, betweenness)

hbetweenness <- lapply(hbetweenness, mean)

rbetweenness <- lapply(remittedINCRLgraphs, betweenness)

rbetweenness <- lapply(rbetweenness, mean)

hedgebetweenness <- lapply(healthyINCRLgraphs, edge_betweenness)

hedgebetweenness <- lapply(hedgebetweenness, mean)

redgebetweenness <- lapply(remittedINCRLgraphs, edge_betweenness)

redgebetweenness <- lapply(redgebetweenness, mean)

hbiconnectedcomponents <- lapply(healthyINCRLgraphs, biconnected_components)

hbiconnectedcomponents <- lapply(hbiconnectedcomponents, `[[`, 1)

rbiconnectedcomponents <- lapply(remittedINCRLgraphs, biconnected_components)

rbiconnectedcomponents <- lapply(rbiconnectedcomponents, `[[`, 1)

hcloseness <- lapply(healthyINCRLgraphs, centr_clo)

hcloseness <- lapply(hcloseness, `[[`, 2)

rcloseness <- lapply(remittedINCRLgraphs, centr_clo)

rcloseness <- lapply(rcloseness, `[[`, 2)

hdegree <- lapply(healthyINCRLgraphs, centr_degree)

hdegree <- lapply(hdegree, `[[`, 2)

rdegree <- lapply(remittedINCRLgraphs, centr_degree)

rdegree <- lapply(rdegree, `[[`, 2)

heigenvector <- lapply(healthyINCRLgraphs, centr_eigen)

heigenvector <- lapply(heigenvector, `[[`, 4)

reigenvector <- lapply(remittedINCRLgraphs, centr_eigen)

reigenvector <- lapply(reigenvector, `[[`, 4)

hconnectedcomponents <- lapply(healthyINCRLgraphs, count_components)

rconnectedcomponents <- lapply(remittedINCRLgraphs, count_components)

hdiameter <- lapply(healthyINCRLgraphs, diameter)

rdiameter <- lapply(remittedINCRLgraphs, diameter)

hdyadcensus <- lapply(healthyINCRLgraphs, dyad_census)

hmutualdyads <- lapply(hdyadcensus, `[[`, 1)

hasymmetricdyads <- lapply(hdyadcensus, `[[`, 2)

rdyadcensus <- lapply(remittedINCRLgraphs, dyad_census)

rmutualdyads <- lapply(rdyadcensus, `[[`, 1)

rasymmetricdyads <- lapply(rdyadcensus, `[[`, 2)

htransitivity <- lapply(healthyINCRLgraphs, transitivity, type = "global")

rtransitivity <- lapply(remittedINCRLgraphs, transitivity, type = "global")

healthyINCRLgraphstats <- data.frame(unlist(harticulationpoints), unlist(hassortativitydegree), unlist(hasymmetricdyads), unlist(hbetweenness), unlist(hbiconnectedcomponents), unlist(hcliques), unlist(hcloseness), unlist(hconnectedcomponents), unlist(hdegree), unlist(hdensity), unlist(hdiameter), unlist(hedgebetweenness), unlist(heigenvector), unlist(hmeandistance), unlist(hmutualdyads), unlist(htransitivity))

remittedINCRLgraphstats <- data.frame(unlist(rarticulationpoints), unlist(rassortativitydegree), unlist(rasymmetricdyads), unlist(rbetweenness), unlist(rbiconnectedcomponents), unlist(rcliques), unlist(rcloseness), unlist(rconnectedcomponents), unlist(rdegree), unlist(rdensity), unlist(rdiameter), unlist(redgebetweenness), unlist(reigenvector), unlist(rmeandistance), unlist(rmutualdyads), unlist(rtransitivity))

cnames <- c("articulation points", "assortativity degree", "asymmetric dyads", "betweenness", "biconnected components", "cliques", "closeness", "connected components", "degree", "density", "diameter", "edge betweenness", "eigenvector", "mean distance", "mutual dyads", "transitivity")

colnames(healthyINCRLgraphstats) <- cnames

colnames(remittedINCRLgraphstats) <- cnames

rownames(healthyINCRLgraphstats) <- healthyINCRLfilenames

rownames(remittedINCRLgraphstats) <- lapply(remittedINCRLfilenames, gsub, pattern = ".*/", replacement = "")

write.csv(healthyINCRLgraphstats, file = "healthy_INC_RL_graphstats.csv")

write.csv(remittedINCRLgraphstats, file = "remitted_INC_RL_graphstats.csv")




# recreate for DECLR trials

hcliques <- lapply(healthyDECLRgraphs, clique.number)

rcliques <- lapply(remittedDECLRgraphs, clique.number)

hdensity <- lapply(healthyDECLRgraphs, edge_density)

rdensity <- lapply(remittedDECLRgraphs, edge_density)

hmeandistance <- lapply(healthyDECLRgraphs, mean_distance)

rmeandistance <- lapply(remittedDECLRgraphs, mean_distance)

harticulationpoints <- lapply(healthyDECLRgraphs, articulation_points)

harticulationpoints <- lapply(harticulationpoints, length)

rarticulationpoints <- lapply(remittedDECLRgraphs, articulation_points)

rarticulationpoints <- lapply(rarticulationpoints, length)

hassortativitydegree <- lapply(healthyDECLRgraphs, assortativity_degree)

rassortativitydegree <- lapply(remittedDECLRgraphs, assortativity_degree)

hbetweenness <- lapply(healthyDECLRgraphs, betweenness)

hbetweenness <- lapply(hbetweenness, mean)

rbetweenness <- lapply(remittedDECLRgraphs, betweenness)

rbetweenness <- lapply(rbetweenness, mean)

hedgebetweenness <- lapply(healthyDECLRgraphs, edge_betweenness)

hedgebetweenness <- lapply(hedgebetweenness, mean)

redgebetweenness <- lapply(remittedDECLRgraphs, edge_betweenness)

redgebetweenness <- lapply(redgebetweenness, mean)

hbiconnectedcomponents <- lapply(healthyDECLRgraphs, biconnected_components)

hbiconnectedcomponents <- lapply(hbiconnectedcomponents, `[[`, 1)

rbiconnectedcomponents <- lapply(remittedDECLRgraphs, biconnected_components)

rbiconnectedcomponents <- lapply(rbiconnectedcomponents, `[[`, 1)

hcloseness <- lapply(healthyDECLRgraphs, centr_clo)

hcloseness <- lapply(hcloseness, `[[`, 2)

rcloseness <- lapply(remittedDECLRgraphs, centr_clo)

rcloseness <- lapply(rcloseness, `[[`, 2)

hdegree <- lapply(healthyDECLRgraphs, centr_degree)

hdegree <- lapply(hdegree, `[[`, 2)

rdegree <- lapply(remittedDECLRgraphs, centr_degree)

rdegree <- lapply(rdegree, `[[`, 2)

heigenvector <- lapply(healthyDECLRgraphs, centr_eigen)

heigenvector <- lapply(heigenvector, `[[`, 4)

reigenvector <- lapply(remittedDECLRgraphs, centr_eigen)

reigenvector <- lapply(reigenvector, `[[`, 4)

hconnectedcomponents <- lapply(healthyDECLRgraphs, count_components)

rconnectedcomponents <- lapply(remittedDECLRgraphs, count_components)

hdiameter <- lapply(healthyDECLRgraphs, diameter)

rdiameter <- lapply(remittedDECLRgraphs, diameter)

hdyadcensus <- lapply(healthyDECLRgraphs, dyad_census)

hmutualdyads <- lapply(hdyadcensus, `[[`, 1)

hasymmetricdyads <- lapply(hdyadcensus, `[[`, 2)

rdyadcensus <- lapply(remittedDECLRgraphs, dyad_census)

rmutualdyads <- lapply(rdyadcensus, `[[`, 1)

rasymmetricdyads <- lapply(rdyadcensus, `[[`, 2)

htransitivity <- lapply(healthyDECLRgraphs, transitivity, type = "global")

rtransitivity <- lapply(remittedDECLRgraphs, transitivity, type = "global")

healthyDECLRgraphstats <- data.frame(unlist(harticulationpoints), unlist(hassortativitydegree), unlist(hasymmetricdyads), unlist(hbetweenness), unlist(hbiconnectedcomponents), unlist(hcliques), unlist(hcloseness), unlist(hconnectedcomponents), unlist(hdegree), unlist(hdensity), unlist(hdiameter), unlist(hedgebetweenness), unlist(heigenvector), unlist(hmeandistance), unlist(hmutualdyads), unlist(htransitivity))

remittedDECLRgraphstats <- data.frame(unlist(rarticulationpoints), unlist(rassortativitydegree), unlist(rasymmetricdyads), unlist(rbetweenness), unlist(rbiconnectedcomponents), unlist(rcliques), unlist(rcloseness), unlist(rconnectedcomponents), unlist(rdegree), unlist(rdensity), unlist(rdiameter), unlist(redgebetweenness), unlist(reigenvector), unlist(rmeandistance), unlist(rmutualdyads), unlist(rtransitivity))

cnames <- c("articulation points", "assortativity degree", "asymmetric dyads", "betweenness", "biconnected components", "cliques", "closeness", "connected components", "degree", "density", "diameter", "edge betweenness", "eigenvector", "mean distance", "mutual dyads", "transitivity")

colnames(healthyDECLRgraphstats) <- cnames

colnames(remittedDECLRgraphstats) <- cnames

rownames(healthyDECLRgraphstats) <- healthyDECLRfilenames

rownames(remittedDECLRgraphstats) <- lapply(remittedDECLRfilenames, gsub, pattern = ".*/", replacement = "")

write.csv(healthyDECLRgraphstats, file = "healthy_DEC_LR_graphstats.csv")

write.csv(remittedDECLRgraphstats, file = "remitted_DEC_LR_graphstats.csv")




# recreate for DECRL trials

hcliques <- lapply(healthyDECRLgraphs, clique.number)

rcliques <- lapply(remittedDECRLgraphs, clique.number)

hdensity <- lapply(healthyDECRLgraphs, edge_density)

rdensity <- lapply(remittedDECRLgraphs, edge_density)

hmeandistance <- lapply(healthyDECRLgraphs, mean_distance)

rmeandistance <- lapply(remittedDECRLgraphs, mean_distance)

harticulationpoints <- lapply(healthyDECRLgraphs, articulation_points)

harticulationpoints <- lapply(harticulationpoints, length)

rarticulationpoints <- lapply(remittedDECRLgraphs, articulation_points)

rarticulationpoints <- lapply(rarticulationpoints, length)

hassortativitydegree <- lapply(healthyDECRLgraphs, assortativity_degree)

rassortativitydegree <- lapply(remittedDECRLgraphs, assortativity_degree)

hbetweenness <- lapply(healthyDECRLgraphs, betweenness)

hbetweenness <- lapply(hbetweenness, mean)

rbetweenness <- lapply(remittedDECRLgraphs, betweenness)

rbetweenness <- lapply(rbetweenness, mean)

hedgebetweenness <- lapply(healthyDECRLgraphs, edge_betweenness)

hedgebetweenness <- lapply(hedgebetweenness, mean)

redgebetweenness <- lapply(remittedDECRLgraphs, edge_betweenness)

redgebetweenness <- lapply(redgebetweenness, mean)

hbiconnectedcomponents <- lapply(healthyDECRLgraphs, biconnected_components)

hbiconnectedcomponents <- lapply(hbiconnectedcomponents, `[[`, 1)

rbiconnectedcomponents <- lapply(remittedDECRLgraphs, biconnected_components)

rbiconnectedcomponents <- lapply(rbiconnectedcomponents, `[[`, 1)

hcloseness <- lapply(healthyDECRLgraphs, centr_clo)

hcloseness <- lapply(hcloseness, `[[`, 2)

rcloseness <- lapply(remittedDECRLgraphs, centr_clo)

rcloseness <- lapply(rcloseness, `[[`, 2)

hdegree <- lapply(healthyDECRLgraphs, centr_degree)

hdegree <- lapply(hdegree, `[[`, 2)

rdegree <- lapply(remittedDECRLgraphs, centr_degree)

rdegree <- lapply(rdegree, `[[`, 2)

heigenvector <- lapply(healthyDECRLgraphs, centr_eigen)

heigenvector <- lapply(heigenvector, `[[`, 4)

reigenvector <- lapply(remittedDECRLgraphs, centr_eigen)

reigenvector <- lapply(reigenvector, `[[`, 4)

hconnectedcomponents <- lapply(healthyDECRLgraphs, count_components)

rconnectedcomponents <- lapply(remittedDECRLgraphs, count_components)

hdiameter <- lapply(healthyDECRLgraphs, diameter)

rdiameter <- lapply(remittedDECRLgraphs, diameter)

hdyadcensus <- lapply(healthyDECRLgraphs, dyad_census)

hmutualdyads <- lapply(hdyadcensus, `[[`, 1)

hasymmetricdyads <- lapply(hdyadcensus, `[[`, 2)

rdyadcensus <- lapply(remittedDECRLgraphs, dyad_census)

rmutualdyads <- lapply(rdyadcensus, `[[`, 1)

rasymmetricdyads <- lapply(rdyadcensus, `[[`, 2)

htransitivity <- lapply(healthyDECRLgraphs, transitivity, type = "global")

rtransitivity <- lapply(remittedDECRLgraphs, transitivity, type = "global")

healthyDECRLgraphstats <- data.frame(unlist(harticulationpoints), unlist(hassortativitydegree), unlist(hasymmetricdyads), unlist(hbetweenness), unlist(hbiconnectedcomponents), unlist(hcliques), unlist(hcloseness), unlist(hconnectedcomponents), unlist(hdegree), unlist(hdensity), unlist(hdiameter), unlist(hedgebetweenness), unlist(heigenvector), unlist(hmeandistance), unlist(hmutualdyads), unlist(htransitivity))

remittedDECRLgraphstats <- data.frame(unlist(rarticulationpoints), unlist(rassortativitydegree), unlist(rasymmetricdyads), unlist(rbetweenness), unlist(rbiconnectedcomponents), unlist(rcliques), unlist(rcloseness), unlist(rconnectedcomponents), unlist(rdegree), unlist(rdensity), unlist(rdiameter), unlist(redgebetweenness), unlist(reigenvector), unlist(rmeandistance), unlist(rmutualdyads), unlist(rtransitivity))

cnames <- c("articulation points", "assortativity degree", "asymmetric dyads", "betweenness", "biconnected components", "cliques", "closeness", "connected components", "degree", "density", "diameter", "edge betweenness", "eigenvector", "mean distance", "mutual dyads", "transitivity")

colnames(healthyDECRLgraphstats) <- cnames

colnames(remittedDECRLgraphstats) <- cnames

rownames(healthyDECRLgraphstats) <- healthyDECRLfilenames

rownames(remittedDECRLgraphstats) <- lapply(remittedDECRLfilenames, gsub, pattern = ".*/", replacement = "")

write.csv(healthyDECRLgraphstats, file = "healthy_DEC_RL_graphstats.csv")

write.csv(remittedDECRLgraphstats, file = "remitted_DEC_RL_graphstats.csv")




# rename columns before combination

colnames(healthyINCLRgraphstats) <- c("INCLR articulation points", "INCLR assortativity degree", "INCLR asymmetric dyads", "INCLR betweenness", "INCLR biconnected components", "INCLR cliques", "INCLR closeness", "INCLR connected components", "INCLR degree", "INCLR density", "INCLR diameter", "INCLR edge betweenness", "INCLR eigenvector", "INCLR mean distance", "INCLR mutual dyads", "INCLR transitivity")

colnames(healthyDECLRgraphstats) <- c("DECLR articulation points", "DECLR assortativity degree", "DECLR asymmetric dyads", "DECLR betweenness", "DECLR biconnected components", "DECLR cliques", "DECLR closeness", "DECLR connected components", "DECLR degree", "DECLR density", "DECLR diameter", "DECLR edge betweenness", "DECLR eigenvector", "DECLR mean distance", "DECLR mutual dyads", "DECLR transitivity")

colnames(healthyINCRLgraphstats) <- c("INCRL articulation points", "INCRL assortativity degree", "INCRL asymmetric dyads", "INCRL betweenness", "INCRL biconnected components", "INCRL cliques", "INCRL closeness", "INCRL connected components", "INCRL degree", "INCRL density", "INCRL diameter", "INCRL edge betweenness", "INCRL eigenvector", "INCRL mean distance", "INCRL mutual dyads", "INCRL transitivity")

colnames(healthyDECRLgraphstats) <- c("DECRL articulation points", "DECRL assortativity degree", "DECRL asymmetric dyads", "DECRL betweenness", "DECRL biconnected components", "DECRL cliques", "DECRL closeness", "DECRL connected components", "DECRL degree", "DECRL density", "DECRL diameter", "DECRL edge betweenness", "DECRL eigenvector", "DECRL mean distance", "DECRL mutual dyads", "DECRL transitivity")

colnames(remittedINCLRgraphstats) <- c("INCLR articulation points", "INCLR assortativity degree", "INCLR asymmetric dyads", "INCLR betweenness", "INCLR biconnected components", "INCLR cliques", "INCLR closeness", "INCLR connected components", "INCLR degree", "INCLR density", "INCLR diameter", "INCLR edge betweenness", "INCLR eigenvector", "INCLR mean distance", "INCLR mutual dyads", "INCLR transitivity")

colnames(remittedDECLRgraphstats) <- c("DECLR articulation points", "DECLR assortativity degree", "DECLR asymmetric dyads", "DECLR betweenness", "DECLR biconnected components", "DECLR cliques", "DECLR closeness", "DECLR connected components", "DECLR degree", "DECLR density", "DECLR diameter", "DECLR edge betweenness", "DECLR eigenvector", "DECLR mean distance", "DECLR mutual dyads", "DECLR transitivity")

colnames(remittedINCRLgraphstats) <- c("INCRL articulation points", "INCRL assortativity degree", "INCRL asymmetric dyads", "INCRL betweenness", "INCRL biconnected components", "INCRL cliques", "INCRL closeness", "INCRL connected components", "INCRL degree", "INCRL density", "INCRL diameter", "INCRL edge betweenness", "INCRL eigenvector", "INCRL mean distance", "INCRL mutual dyads", "INCRL transitivity")

colnames(remittedDECRLgraphstats) <- c("DECRL articulation points", "DECRL assortativity degree", "DECRL asymmetric dyads", "DECRL betweenness", "DECRL biconnected components", "DECRL cliques", "DECRL closeness", "DECRL connected components", "DECRL degree", "DECRL density", "DECRL diameter", "DECRL edge betweenness", "DECRL eigenvector", "DECRL mean distance", "DECRL mutual dyads", "DECRL transitivity")




# combine by emotional response and assign class

healthyINCgraphstats <- cbind(healthyINCLRgraphstats[, -17], healthyINCRLgraphstats[, -17])

healthyINCgraphstats <- transform(healthyINCgraphstats, class = "healthy")

remittedINCgraphstats <- cbind(remittedINCLRgraphstats[, -17], remittedINCRLgraphstats[, -17])

remittedINCgraphstats <- transform(remittedINCgraphstats, class = "remitted")

INCgraphstats <- rbind(healthyINCgraphstats, remittedINCgraphstats)

healthyDECgraphstats <- cbind(healthyDECLRgraphstats[, -17], healthyDECRLgraphstats[, -17])

healthyDECgraphstats <- transform(healthyDECgraphstats, class = "healthy")

remittedDECgraphstats <- cbind(remittedDECLRgraphstats[, -17], remittedDECRLgraphstats[, -17])

remittedDECgraphstats <- transform(remittedDECgraphstats, class = "remitted")

DECgraphstats <- rbind(healthyDECgraphstats, remittedDECgraphstats)




# combine all

graphstats <- cbind(INCgraphstats[, -33], DECgraphstats)

rownames(graphstats) <- gsub("INCLRcompletecorr_DynSig_k4.csv", "", rownames(graphstats))
