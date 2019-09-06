
# run creating_iGraph_objects.R, general_network_features.R, triad_occurrences_hippocampus_subgraphs.R, clinical_data_processing.R

# create dataframe containing general network features, triad occurrences in hippocampus subgraphs, and complete clinical data
subjectdata <- cbind(graphstats[, -65], triads, clinicaldata[, colSums(is.na(clinicaldata)) == 0])



library(ordr)

# principal component analysis
subjectdatapca <- augment(as_tbl_ord(prcomp(subjectdata[, -204], center = TRUE, scale. = TRUE)))

# set up to color by class
subjectdatapca <- mutate_u(subjectdatapca, class = subjectdata$class)

# biplot (without vector labels, for cleaner visualization)
ggbiplot(subjectdatapca) + geom_u_point(aes(color = class)) + geom_v_vector(color = "BLACK")

# scree plot
subjectdatapcacoord <- augmentation_coord(subjectdatapca)

subjectdatainertia <- recover_inertia(subjectdatapca)

subjectdatainertia <- data.frame(subjectdatainertia = subjectdatainertia)

subjectdatapcacoord <- cbind(subjectdatapcacoord, subjectdatainertia)

ggplot(subjectdatapcacoord, aes(x = .name, y = subjectdatainertia/sum(subjectdatainertia))) + geom_bar(stat = "identity") + scale_y_continuous(labels = scales::percent) + labs(x = "Principal components in alphabetical order", y = "Variance")



library(cluster)

# k-means

# column 204 contains class; k = 2
subjectdatak2means <- kmeans(subjectdata[, -204], 2, nstart = 500000)

# display result in table where rows are clusters and columns are classes to see breakdown
table(subjectdatak2means$cluster, subjectdata$class)



# hierarchical clustering

subjectdatahclust <- hclust(dist(scale(subjectdata[, -204])))

# display result in table where rows are clusters and columns are classes to see breakdown

# 2 clusters
table(cutree(subjectdatahclust, 2), subjectdata$class)

# 3 clusters
table(cutree(subjectdatahclust, 3), subjectdata$class)



# identify subjects by cluster



# k-means

kmeanstest <- kmeans(subjectdata[, -204], 4, nstart = 500000)

kmeanstest$cluster

names(which(kmeanstest$cluster == 2))
# returns list of subjects in cluster 2



# hierarchical clustering

hclusteringtest <- hclust(dist(scale(subjectdata[, -204])))

names(which(cutree(hclusteringtest, 4) == 2))
# returns list of subjects in cluster 2
