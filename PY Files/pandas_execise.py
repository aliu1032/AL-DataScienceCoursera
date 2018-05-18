'''
Created on Oct 13, 2016

@author: aliu
'''

import numpy as np
import pandas as pd
from pandas import DataFrame, Series
from test.test_pyexpat import PositionTest

'''SERIES'''

p_series = pd.Series(['A','B','C'])
print (p_series)
print (p_series[1])


p_series_2 = pd.Series(['AAA','BBB','CCC','DDD'], index=['8','9','10','11'])
print (p_series_2[1])    ##access by position
print (p_series_2['8'])  ##access by index
p_series_2[0:2]          ## slice by position
p_series_2[[0,3]]        ## slice by position
p_series_2[['8','11']]   ## slice by index value

p_series_2.index         ## get the index values


p_series.index=(['AA','BB','CC'])  # assign/update index
print(p_series)


''' DATA FRAME '''
# delete variable
# del pd_df

# create data by column in Series([x,x,x])
column_1 = ([1,2,3,4,5])
column_2 = ([100,200,300,400,500])
column_3 = (['A','B','','D','E'])

#create a dataframe using series. the series is the values of the column
pd_df = pd.DataFrame({'Column_1_Name': column_1,
                   'Column_2_Name': column_2})
pd_df

## access a column
pd_df['Column_1_Name']
pd_df.Column_1_Name
pd_df[['Column_1_Name','Column_2_Name']]

pd_df['New_Col'] = column_3  #adding column to a dataframe
pd_df
pd_df[['Column_1_Name','New_Col']]
pd_df['Column_2_Name'] - pd_df.Column_1_Name

## access a row
pd_df.iloc[1]
pd_df.loc[1]

## access a cell
pd_df.loc[1]['Column_1_Name']

pd_df.index = ['v','w','x','y','z']  #assign index
pd_df
pd_df.loc['x']  #access row by index using .loc
pd_df.iloc[3]   #access row by position
pd_df.iloc[[4,3,1]].Column_1_Name  #access the values in multiple rows and column

#select Statement
pd_df[pd_df['Column_2_Name'] >=250]
pd_df[pd_df.New_Col == '']
pd_df[pd_df.New_Col == '']['Column_2_Name']
pd_df[pd_df.New_Col == ''].Column_1_Name


#insert a Row
a_pd_Series = pd.Series([7, 700, 'G'])
a_pd_Series
a_pd_Series.index.values
pd_df = pd_df.append(a_pd_Series,ignore_index=True)
pd_df
# a is a pd Series, with Index value = 0,1,2
# when append to a dataframe, it uses the index value as column names and add the Series with the column names = series.index.Values

a_dict = {'Column_1_Name':8,'Column_2_Name':800,'New_Col':'I'}
a_dict
a_dict.keys()
pd_df = pd_df.append(a_dict, ignore_index=True)
pd_df

a_list = [1,2,3]
a_list
pd_df = pd_df.append(a_list)   # this append the list as column name = 0, there may be a implict index value = 0
pd_df



'''---------------------------------
active_PTP = input_data[:]
id(input_data), id(active_PTP) #show the memory register of the variable, but the variables are the same object in memory

print ('Before Value : ', active_PTP['Status'][2])
print ('Before Value : ', input_data['Status'][2])

active_PTP['Status'][2] = 'Apple'

print ('After Value : ', active_PTP['Status'][2])
print ('After Value : ', input_data['Status'][2])

input_data['Status'] = 'Hello'

print ('After Value : ', active_PTP['Status'][2])
print ('After Value : ', input_data['Status'][2])


test = [input_data['Status'] == 'Approved']  # square bracket outside to make a list of True/False
active_PTP = input_data[input_data['Status'] == 'Approved']  # slice the rows that matches the select criteria, i.e. True

input_data.loc[15][['Payor Test Price Id','Status']]
input_data.loc[25][['Payor Test Price Id','Status']]

# active_PTP.loc[15][['Payor Test Price Id','Status']] #flow error because the row is not selected
active_PTP.loc[25][['Payor Test Price Id','Status']]
active_PTP.iloc[15][['Payor Test Price Id','Status']]

input_data.index.values[15]
input_data.index.values[25]
active_PTP.index.values[15] #the 15th row in sliced df is the 25th row in input_data



len(active_PTP)
len(active_PTP.columns)
active_PTP.size
''''''''''''''''''''''''''''''''''''''''''''''''