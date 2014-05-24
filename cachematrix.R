########################################################################################################################
#
# Programming assignment 2: 
#
#
# makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
# cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve 
# the inverse from the cached value.
#
# This function is an adaption of the "Caching the Mean of a Vector" example given in the assignment notes.
#
########################################################################################################################


## This function (makeCacheMatrix) creates a special matrix, which is a list containing four functions as follows
##    $set: Sets the value of the matrix
##    $get: gets the value of the matrix
##    $setinverse: the value of the inverse of the matrix
##    $getinverse the value of the inverse of the matrix
##
## Usage: call the function specifying the matrix to be inverted and store the special matrix as shown in the following example: 
##
##    cachevar <- makeCacheMatrix(natrixvar)

makeCacheMatrix <- function(x = matrix()) {
    cachedmat <- NULL
    set <- function(data) {
        x <<- data
        cachedmat <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) cachedmat <<- solve
    getinverse <- function() cachedmat
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)    
}


## The following function calculates the inverse of the special "matrix" created with makeCacheMatrix. 
## It first checks to see if the mean has already been calculated. If so, it gets the inverse from the cache 
## and skips the computation. Otherwise, it calculates the inverse of the data and sets the value of the inverse 
## in the cache via the setinverse function.
##
## Usage: call the function specifying the stored matrix created by makeCachematrix as a parameter as
## shown in the following example: 
##
##    inversematrix <- cacheSolve(cachevar)

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    imat <- x$getinverse()
    if(!is.null(imat)) {
        message("getting cached data")
        return(imat)
    }
    data <- x$get()
    imat <- solve(data, ...)
    x$setinverse(imat)
    imat
    
}
