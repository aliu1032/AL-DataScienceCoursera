'''
Created on Oct 17, 2016

@author: aliu
'''

'''LIST'''

p_list = []
p_list = ['1','A', '2', 'B']

# access list element
p_list[0]
p_list[-2]
p_list[:3]  #slicing is an operator for sequence types
p_list[4:]
p_list[0:len(p_list):2] #extract the value in the even positions
p_list[1:len(p_list):2] #extract the value in the odd positions

# update list
p_list = [1,2,3,4,5]

# help(list) lists the attributes and methods defined with the list class
p_list.insert(3,10)
p_list

p_list.pop(2)
p_list

p_list.__len__()

p_list.sort()
p_list

# Build in Python functions applicable to the list class
len(p_list)
max(p_list)
p_list.index(min(p_list))  #find the attribute of the min(p_list)
sum(p_list) / len(p_list)  #find the average of the values in the list

del p_list

# common sequence operators. check in documentation: sequence types
'A' in p_list
2 in p_list

''' Python String '''
p_string = 'apple'
print (len(p_string))
print (p_string[0:2], "   ",p_string[:4], "   ", p_string[3:], "   ", p_string[:-2])

del p_string  #to delete the variable

''' TUPLE '''
p_tuple = 'abc'
p_tuple
type(p_tuple)

p_tuple = ('123')
p_tuple
type(p_tuple)

p_tuple = ([1,2,3])
p_tuple
type(p_tuple)

## the above are strings and list, the following are tuples
p_tuple= ('a','b','c')
p_tuple
type(p_tuple)

p_tuple = (1,2,3)
p_tuple
type(p_tuple)

#tuple class attributes and methods
p_tuple.__add__(p_tuple) # this does not change the value of p_tuple
p_tuple = p_tuple.__add__(p_tuple) # this one create a new memory space and assign the new value to it
p_tuple.__contains__(4)
p_tuple.__contains__(1)
p_tuple.count(2)

#common sequence operators
max(p_tuple)
p_tuple.count(3)

''' 2 dimension list of tuple '''
square = [ (1,1), (1,3), (3,3), (3,1) ]
type(square)  #square is a list
type(square[1]) # the element in square is a tuple
type(square[1][1])

#access the element
square[0]    # point 1
square[0][1] # Y-coordinate of point 1
square [0:2]

#extract the x and y coordinates
x = []
y = []
for point in square: # loop through the elements in the sequence type. the point is a tuple
    x.append(point[0])
    y.append(point[1])
x
y

#alternate way
a = [point[0] for point in square]
b = [point[1] for point in square]
a
b

''' mutable: can change value vs immutable cannot change value '''
a_list = [1,5,6,10,20,4]
a_tuple = (1,5,6,10,20,4)
a_list[0] = 4
a_tuple[0] = 4    #this will return error
a_list.append(1000)
a_list.pop(-1)
a_list
a_tuple = a_tuple(1,5,6,10,20,4,1000)
a_tuple
a_tuple = a_tuple[:-1]
a_tuple

a_list = a_list + ['a']
a_list
a_list.pop(-1)

a_tuple = a_tuple + (2)  #return error

square[0][0] = (2)   # this will return error since trying to update a tuple
square[0] = (2,2)    # this is ok since it is updating a list
square
square[0] = (1,1)

square.append((2,2))
square.pop(-1)
square

# p_tuple.append(1)  this gives error as append is common operator for mutable sequence

del a,b,square,p_tuple,a_list, a_tuple


'''Python dictionary - Mapping Types '''
p_dict = {}
print (p_dict)

#declare values
p_dict = { 'USD': 1,
           'CAD': 1.31279,
           'EUR': 0.90933,
           'GBP': 0.82018,
           'CHF': 0.98864,
           'JPY': 103.823,
           'CNY': 6.73690,
           'INR': 66.7939,
           'AUD': 1.31120
        }

# list all items
p_dict.items()

#Get all dictionary keys
p_dict.keys()

#Get all values
p_dict.values()

#find the value of a given key
p_dict['CAD']

p_dict.pop('INR')
p_dict

p_dict.update(USD=1.0001, CAD = 6.002) # if the key exists, python overwrite the value
p_dict

p_dict.update(INR = 66.7939)  #if the key does not exist, python adds to the dictionary
p_dict

#looping through the dictionary, the loop return the key value
for entry in p_dict:
    print (entry)  #entry is the key of the dictionary
    print (p_dict[entry])

keys = p_dict.keys()
type(keys)
list(keys)
list(keys)[0]

values = p_dict.values()
list(values)[0]
type(values)
total = 0
for value in values:
    total += value
print (total)



