'''
Created on Nov 15, 2016

@author: aliu
'''
import pandas as pd

df1 = pd.DataFrame({'A' :['A0', 'A1', 'A2', 'A3'],
                    'B' :['B0', 'B1', 'B2', 'B3'],
                    'C' :['C0', 'C1', 'C2', 'C3'],
                    'D' :['D0', 'D1', 'D2', 'D3']
                    },
                    index = [0,1,2,3]
                    )

df2 = pd.DataFrame({'A' :['A4', 'A5', 'A6', 'A7'],
                    'B' :['B4', 'B5', 'B6', 'B7'],
                    'C' :['C4', 'C5', 'C6', 'C7'],
                    'D' :['D4', 'D5', 'D6', 'D7']
                    },
                    index = [4,5,6,7]
                    )

df3 = pd.DataFrame({'A' :['A8', 'A9', 'A10', 'A11'],
                    'B' :['B8', 'B9', 'B10', 'B11'],
                    'C' :['C8', 'C9', 'C10', 'C11'],
                    'D' :['D8', 'D9', 'D10', 'D11']
                    },
                    index = [8,9,10,11]
                    )

'''Concatenate / Append dataframes '''

result = pd.concat([df1,df2,df3])
print (result)

result = pd.concat([df1,df2,df3], keys=['d1','d2','d3'])
print (result)
result.index
result.index.get_level_values(0)

df4 = pd.DataFrame({'B' :['B2', 'B3', 'B6', 'B7'],
                    'D' :['D2', 'D3', 'D6', 'D7'],
                    'F' :['F2', 'F3', 'F6', 'F7']
                    },
                    index = [2,3,6,7]
                    )

result = pd.concat([df1, df4], axis = 1)
print (result)

result = pd.concat([df1, df4], axis = 1, join='inner')
print (result)
result = pd.concat([df1, df4], axis = 1, join='outer')
print (result)

result = pd.concat([df1, df4], axis = 1, join_axes=[df1.index])
print (result)

result = pd.concat([df1, df4], axis = 1, join_axes=[df4.index])
print (result)

result = df1.append([df2,df3])
print(result)

result = df1.append(df4)
print(result)

s1 = pd.Series(['x0','x1','x2','x3'], name = 'X')

result = pd.concat([df1,s1])
print (result)

result = pd.concat([df1,s1], axis = 1)
print (result)

s2 = pd.Series(['y0','y1','y2','y3'], index = ['0','1','2','3'], name='Y')
result = df1.append(s2)
print(result)

result = pd.concat([df1,s2])
print (result)

#this behaves different from s1 as the index are different in the system, though it looks the same
result = pd.concat([df1,s2], axis = 1)
print (result)
df1.index
s2.index






