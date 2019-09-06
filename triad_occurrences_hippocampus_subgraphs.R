
# run creating_iGraph_objects.R

# create lists of triad states

statenames <- c("003", "012", "102", "021D", "021U", "021C", "111D", "111U", "030T", "030C", "201", "120D", "120U", "120C", "210", "300")

statenamesLeft <- paste(statenames, "Left", sep = "_")

statenamesRight <- paste(statenames, "Right", sep = "_")

# create data frames of triad occurrences

INCLRtriadsLeft <- list()

for (i in 1:length(INCLRgraphs)){
  sub_graph <- graph.neighborhood(INCLRgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_LEFT')[[1]]
  INCLRtriadsLeft[[i]] <- triad.census(sub_graph)
}

names(INCLRtriadsLeft) <- rownames(graphstats)

INCLRtriadsLeft <- t(as.data.frame(INCLRtriadsLeft))

colnames(INCLRtriadsLeft) <- paste("INCLR", statenamesLeft, sep = "_")

INCRLtriadsLeft <- list()

for (i in 1:length(INCRLgraphs)){
  sub_graph <- graph.neighborhood(INCRLgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_LEFT')[[1]]
  INCRLtriadsLeft[[i]] <- triad.census(sub_graph)
}

names(INCRLtriadsLeft) <- rownames(graphstats)

INCRLtriadsLeft <- t(as.data.frame(INCRLtriadsLeft))

colnames(INCRLtriadsLeft) <- paste("INCRL", statenamesLeft, sep = "_")

DECLRtriadsLeft <- list()

for (i in 1:length(DECLRgraphs)){
  sub_graph <- graph.neighborhood(DECLRgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_LEFT')[[1]]
  DECLRtriadsLeft[[i]] <- triad.census(sub_graph)
}

names(DECLRtriadsLeft) <- rownames(graphstats)

DECLRtriadsLeft <- t(as.data.frame(DECLRtriadsLeft))

colnames(DECLRtriadsLeft) <- paste("DECLR", statenamesLeft, sep = "_")

DECRLtriadsLeft <- list()

for (i in 1:length(DECRLgraphs)){
  sub_graph <- graph.neighborhood(DECRLgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_LEFT')[[1]]
  DECRLtriadsLeft[[i]] <- triad.census(sub_graph)
}

names(DECRLtriadsLeft) <- rownames(graphstats)

DECRLtriadsLeft <- t(as.data.frame(DECRLtriadsLeft))

colnames(DECRLtriadsLeft) <- paste("DECRL", statenamesLeft, sep = "_")

INCLRtriadsRight <- list()

for (i in 1:length(INCLRgraphs)){
  sub_graph <- graph.neighborhood(INCLRgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_RIGHT')[[1]]
  INCLRtriadsRight[[i]] <- triad.census(sub_graph)
}

names(INCLRtriadsRight) <- rownames(graphstats)

INCLRtriadsRight <- t(as.data.frame(INCLRtriadsRight))

colnames(INCLRtriadsRight) <- paste("INCLR", statenamesRight, sep = "_")

INCRLtriadsRight <- list()

for (i in 1:length(INCRLgraphs)){
  sub_graph <- graph.neighborhood(INCRLgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_RIGHT')[[1]]
  INCRLtriadsRight[[i]] <- triad.census(sub_graph)
}

names(INCRLtriadsRight) <- rownames(graphstats)

INCRLtriadsRight <- t(as.data.frame(INCRLtriadsRight))

colnames(INCRLtriadsRight) <- paste("INCRL", statenamesRight, sep = "_")

DECLRtriadsRight <- list()

for (i in 1:length(DECLRgraphs)){
  sub_graph <- graph.neighborhood(DECLRgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_RIGHT')[[1]]
  DECLRtriadsRight[[i]] <- triad.census(sub_graph)
}

names(DECLRtriadsRight) <- rownames(graphstats)

DECLRtriadsRight <- t(as.data.frame(DECLRtriadsRight))

colnames(DECLRtriadsRight) <- paste("DECLR", statenamesRight, sep = "_")

DECRLtriadsRight <- list()

for (i in 1:length(DECRLgraphs)){
  sub_graph <- graph.neighborhood(DECRLgraphs[[i]], order = 2, nodes = 'HIPPOCAMPUS_RIGHT')[[1]]
  DECRLtriadsRight[[i]] <- triad.census(sub_graph)
}

names(DECRLtriadsRight) <- rownames(graphstats)

DECRLtriadsRight <- t(as.data.frame(DECRLtriadsRight))

colnames(DECRLtriadsRight) <- paste("DECRL", statenamesRight, sep = "_")

triads <- as.data.frame(cbind(INCLRtriadsLeft, INCLRtriadsRight, INCRLtriadsLeft, INCRLtriadsRight, DECLRtriadsLeft, DECLRtriadsRight, DECRLtriadsLeft, DECRLtriadsRight))

triads <- triads[, -which(colSums(triads) == 0)]
