## makeVector: creates a special 'vector', which is a list containing
## a function to
## 1. set the value of the vector
## 2. get the value of vector
## 3. set the value of the mean
## 4. get the value of the mean

makeVector <- function (x=numeric()) {
    
    m <- NULL
    
    # item 1 is the set function: set the value of the vector
    set <- function(y) {
        x <<- y  # assign value to an object in an differnt environment from the current
        m <<- NULL
    }
    
    # item 2 is the get function: get the value of the vector
    get <- function() x   # get function return x
    
    # item 3 is the setmean function: set the value of the mean
    setmean <- function(mean) m <<- mean
    
    # item 4 is the getmean function: get the value of the mean
    getmean <- function() m
    
    #return a list of 4 differnt functions
    list(set = set, get = get, 
         setmean = setmean,
         getmean = getmean)
}


## calcuates the mean of the special 'vector' created above.
## first it check if the mean m, has been already calculated.
## if so, it get the mean from the cach and skips the computation
## Else, it calculates the mean of the data and set the values to
## the cache m.

cachemen <- function (x,...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message('getting cached data')
        return (m)
    }
    data <- x$get()
    m <- mean(data,...)
    x$setmean(m)
    m
}