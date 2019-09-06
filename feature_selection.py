# -*- coding: utf-8 -*-
# run creating_iGraph_objects.R, general_network_features.R, triad_occurrences_hippocampus_subgraphs.R, clinical_data_processing.R, subject_data_analysis.R

import pandas as pd

from sklearn.feature_selection import RFE

from sklearn.linear_model import LogisticRegression





subjectdata = pd.read_csv("subjectdata.csv")

features = subjectdata.values[:, 1:204]

labels = subjectdata.values[:, 204]

model = LogisticRegression()





rfe162 = RFE(model, 162)

fit162 = rfe162.fit(features, labels)

selections162 = fit162.support_

selectedfeatures162 = subjectdata['Unnamed: 0']

for n in range(0, len(fit162.support_)):
    if fit162.support_.tolist()[n] == True:
        selectedfeatures162 = pd.concat([selectedfeatures162, subjectdata.iloc[:, n + 1]], axis = 1)

selectedfeatures162.to_csv('selectedfeatures162.csv')





rfe101 = RFE(model, 101)

fit101 = rfe101.fit(features, labels)

selections101 = fit101.support_

selectedfeatures101 = subjectdata['Unnamed: 0']

for n in range(0, len(fit101.support_)):
    if fit101.support_.tolist()[n] == True:
        selectedfeatures101 = pd.concat([selectedfeatures101, subjectdata.iloc[:, n + 1]], axis = 1)

selectedfeatures101.to_csv('selectedfeatures101.csv')





rfe60 = RFE(model, 60)

fit60 = rfe60.fit(features, labels)

selections60 = fit60.support_

selectedfeatures60 = subjectdata['Unnamed: 0']

for n in range(0, len(fit60.support_)):
    if fit60.support_.tolist()[n] == True:
        selectedfeatures60 = pd.concat([selectedfeatures60, subjectdata.iloc[:, n + 1]], axis = 1)

selectedfeatures60.to_csv('selectedfeatures60.csv')


