libaray( matlib)

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
