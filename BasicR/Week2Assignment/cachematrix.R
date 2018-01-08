## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatris: This function creates a special 'matrix"
## object that can cache its inverse.

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


## Write a short comment describing this function

library(matlib)
cacheSolve <- function(x, ...) {

    m <- x$getinverse()  #retrive the inverse matrix of x
    
    if (!is.null(m)) {
        message('Getting the cached data')
        return(m)
    }
    
    #if inverse matrix is not in cache, m, then calculate the inverse matrix
    message('No cache')
    input <- x$get()
    #m <- solve(input)
    m <- inv(a)
    x$setinverse(m)  #store the calculated inverse matrix to cache, m

    return (m)
}
