'''
Created on Oct 13, 2016

@author: aliu
'''
from pip._vendor.distlib.database import DIST_FILES
import math
class Point:
    'Represent a point in a 2-dimension geometric coordinates'
    # the above lines is a doc string, use triple quotes ''' for multiple lines comment
    # the docstring is that returned to help(Point) at the Python prompt
    # class Point as a method: reset
    # it resets the x & y coordinates to zero
    # self argument, the method to apply on the object itself
    
    #def __init__(selfself, x=0, y=0):
    #    self.move(x,y)
    
    def reset(self):
        ''' reset the Point object coordinate to (0,0)'''
        self.x = 0
        self.y = 0
    
    # method set new coordinate of the object
    def move(self, x, y):
        ''' move the Point to a new 
        coordinate (x,y)'''
        self.x = x
        self.y = y
        
    def calculate_dist(self, other_point):
        dist = math.sqrt((self.x - other_point.x)**2 + (self.y - other_point.y)**2)
        return dist

# define p1 and p1 as an object of class Point
p1 = Point()
p2 = Point()

# assign value to the Point attribute
# <object>.<attribute> = <value>
p1.x = 5
p1.y = 4

p2.x = 3
p2.y=6

print (p1.x, p1.y)
print (p2.x, p2.y)

#use the reset method to reset p1
p1.reset()
print ('\nreset p1')
print (p1.x, p1.y)
print (p2.x, p2.y)

print ('\ndistance between p1 and p2')
print (p1.calculate_dist(p2))


