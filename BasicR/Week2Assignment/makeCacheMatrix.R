makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    
    # function 1 in the list: set the value of the matrix. 
    # use <<- to set it to the object in an environment different from the local environment
    set <- function(y) {
        x <<- y 
        m <<- NULL
    }
    
    # function 2 in the list: the get function: return matrix given to the parameter
    get <- function() x 
    
    # function 3 in the list: assign the given inverse of matrix to variable result
    setinverse <- function(inverse) m <<- inverse
    
    # function 4 in the list: return the inverse of matrix from cache
    getinverse <- function() m
    
    #return a list of 4 differnt functions
    list(set = set,
         get = get, 
         setinverse = setinverse,
         getinverse = getinverse)
}
