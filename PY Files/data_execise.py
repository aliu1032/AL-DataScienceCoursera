'''
Created on Oct 14, 2016
@author: aliu
'''
import csv    #import the csv module

file_path = "C:\\Users\\aliu\Box Sync\\aliu Cloud Drive\\workspace\\LearnPython\\Data\\"
file_name = "20linesRRM execise.csv"
data_file = file_path + file_name
print (data_file)


''' open the data file, read the data into a Python lists '''       
Internal_Id = []
Product = []
Currency = []
Payor_Id = []
Payor_name = []
Plan_Id = []
Plan_name = []
Contract_status = []

csvfile = open(data_file, newline='')    
reader = csv.reader(csvfile, delimiter=',')
next(reader)  # to advance a line to skip the header   
for row in reader:   # loop through until end of file
        #print (row)
        Internal_Id.append(row[0])
        Product.append(row[1])
        Currency.append(row[2])
        Payor_Id.append(row[3])
        Payor_name.append(row[4])
        Plan_Id.append(row[5])
        Plan_name.append(row[6])
        Contract_status.append(row[7])

print(Product)
print(Payor_name[1:3])
csvfile.close()

# using with, when the block is done, file is closed when the block of code is done.
with open(data_file, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=',')
    next(reader)
    for row in reader:
        #print (row)
        Internal_Id.append(row[0])
        Product.append(row[1])

print(Product)

''' use Pandas read_csv to read a csv data file input pandas data frame'''
import pandas as pd

with open(data_file, newline='') as csvfile:
    input_data = pd.read_csv(csvfile, sep=',', header=1) 
    # the header value is in row number 1
    
with open(data_file, newline='') as csvfile:
    input_data = pd.read_csv(csvfile, sep=',') 
    #default read the 1st row (row number 0) as the header

''' basic pd data frame function'''    
input_data.size
input_data.shape
input_data.head(3)

# number of rows
input_data.shape[0]

''' work on the columns '''
input_data.columns
input_data.columns = ['InternalId','Product','Currency','Tier2_Ext_Id','Tier2_Payor','Tier4_Ext_Id','Tier4_Payor','ContractStatus',
                      'BillingRate','RevenueStatus','RevStatus_EffDate','RRM_Entry_EffDate','RRM_Entry_TermDate',
                      'ApprovalDate','List_Price_EffDate','List_Price','Contract_Price','Discount_Amt','Accrual_Amt','Cash_Amt',
                      'LastModified']
input_data['InternalID']
input_data['Product']
max(input_data.List_Price)
min(input_data['Contract Price'])
input_data['Product'].unique()
input_data['List_Price'].sum()/input_data.shape[0]
# use double [[ ]] to subset columns
prices = input_data[['List_Price', 'Contract_Price', 'BillingRate']]
prices
prices.List_Price.describe()

''' clear the comma. use the series.str to access every string value in the series
http://pandas.pydata.org/pandas-docs/stable/text.html
then use pd.to_numeric to convert the series into numbers'''

prices.List_Price_Int = prices.List_Price.str.replace(',','')  #update every string values inside a series: s.str.replace
prices.List_Price_Int = pd.to_numeric(prices.List_Price_Int)
''' slice and select rows '''
input_data[1:3]
breast_data = input_data[input_data['Product']=='IBC']
# remember to have ( ) to wrap around each condition
breast_data = input_data[(input_data['Product']=='IBC') | (input_data['Product']=='DCIS')]
breast_data.head(5)





