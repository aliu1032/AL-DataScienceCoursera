'''
Created on Jan 24, 2017
@author: aliu
'''

import pandas as pd
import openpyxl as py

''' Find the unique payor and plan who has Test Delivered '''
''' Download the source from Tableau Revenue Status or the '''
file_path = "C:\\Users\\aliu\Box Sync\\aliu Cloud Drive\\Tableau Analytics\\"
file_name = "FinanceAnalytics_PayorAnalysis.xlsx"
data_file = file_path + file_name
print (data_file)

input_wb =  py.load_workbook(data_file)
input_wb.get_sheet_names()

input_data = pd.read_excel(data_file, sheetname='Snapshot_data', header=0)
input_data.columns = [cell.replace(' ','') for cell in input_data.columns]

temp = input_data[~pd.isnull(input_data['Tier2PayorID'])]  # add the ~ to flip true to false
sum(~pd.isnull(input_data['Tier2PayorID']))  #use sum to count the number of rows matching the condition

#extract the Payor, Plan, Test, TicketNumber
Payor_Plan = temp[['Tier2PayorID','Tier2PayorName','Tier4PayorID','Tier4PayorName','Test','Tier3PayorType','TicketNumber']].copy()

file_path = "C:\\Users\\aliu\Box Sync\\aliu Cloud Drive\\SFDC_Data\\"
file_name = "SFDC_Payor_with_PTP_Join.xlsx"
data_file = file_path + file_name
print (data_file)


input_wb = py.load_workbook(data_file)
input_wb.get_sheet_names()

input_data = pd.read_excel(data_file,sheetname='Sheet1', header=0)
input_data.head(10)
input_data.columns

# 1. remove the spaces in the column names
input_data.columns = [cell.replace(' ','') for cell in input_data.columns]

'''leaning opportunity'''
def replace_fun(in_str):
    return in_str.replace(' ','')
    # replace is a method in class string
    # define a function such to work in apply
''' look into how to use apply'''
 
# 2. select the active & approved Row
input_data['Status'].unique()
len(input_data['Status'].unique())  #len is a method/function, class implements function
input_data['Status'].unique().size  #size is the number of elements

active_PTPPTC = [input_data['Status' == 'Approved']].copy()






# 3. read the Plan PTP
# 4. select the active and approved Row

# 5. append the FILES
# vlookup the payor and plan which have test delivered