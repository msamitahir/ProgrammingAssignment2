## The assignment is to write a pair of functions that cache the inverse of a matrix.
## Matrix inversion is usually a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than computing it repeatedly

## This function creates a special "matrix" object that is able to cache its inverse.

makeCacheMatrix <- function(x = matrix()) {

}


## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. 
## If the inverse has already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
