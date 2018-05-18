'''
Created on Nov 10, 2016

@author: aliu

http://pandas.pydata.org/pandas-docs/stable/groupby.html
'''

import pandas as pd
import numpy as np

df = pd.DataFrame({'A' : ['foo', 'bar', 'foo', 'bar','foo', 'bar', 'foo', 'foo'],
                   'B' : ['one', 'one', 'two', 'three','two', 'two', 'one', 'three'],
                   'C' : np.random.randn(8),
                   'D' : np.random.randn(8)})

df = pd.DataFrame({'A' : ['foo', 'bar', 'foo', 'bar','foo', 'bar', 'foo', 'foo','foo'],
                   'B' : ['one', 'one', 'two', 'three','two', 'two', 'one', 'three','one'],
                   'C' : [1,2,3,4,5,6,7,8,0.99],
                   'D' : [10,20,30,40,50,60,70,80,0.99]})

# select sum(c), sum(d)
# from df
# grouped by A
grouped = df.groupby('A')
grouped.sum()

grouped.sum()['C']


#select sum(d)
# from df
# grouped by A, B
grouped = df.groupby(['A',"B"])
grouped.sum()['D']

#show the unique group and the index of the row in the group in a dictionary
a = grouped.groups

#number of groups and the group label
len(a)
list(a.keys())
list(a.keys())[0]
# of row in the df in the group
for grouping in a:
    print (grouping, ' ', (a[grouping]))
    print (grouping, ' ', len(a[grouping]))
    
# number of entry
grouped.count()


