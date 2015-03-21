## The assignment is to write a pair of functions that cache the inverse of a matrix.
## Matrix inversion is usually a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than computing it repeatedly

## This function creates a special "matrix" object that is able to cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  
  ## the cache inverse variable is defined as NULL as no inverse is calculated yet
  inverse <- NULL
  
  ## As the following functions are enclosed in the environment of makeCacheMatrix function 
  ## they can access the matix variable x and the inverse variable inverse
  
  ## The operators <<- and ->> are normally only used in functions, 
  ## and cause a search to made through parent environments for an existing definition 
  ## of the variable being assigned. If such a variable is found (and its binding is not locked)
  ## then its value is redefined, otherwise assignment takes place in the global environment.
  
  ## defining the setter function to set a new matrix
  set <- function(y) {
    
    ## Setting x to the new matrix
    x <<- y
    
    ## As the matrix has changed, we need to clear any previous cache
    inverse <<- NULL
  }
  
  ## defining the get function to get the value of the matrix. Simply return variable x
  get <- function() x
  
  ## Defining the setter function to set the inverse of the matrix so we can do caching
  setinverse <- function(inv) inverse <<- inv
  
  ## Defining the function that will return the cached inverse which can be NULL if not cached.
  getinverse <- function() inverse
  
  ## The following list will be returned as the output of this function
  ## It contains the 4 functions we have defined above for getting or setting 
  ## the matix or the inverse. The users can then interact with this environment
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. 
## If the inverse has already been calculated (and the matrix has not changed), then
## `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## We use the getinverse function we defined earlier in the makeCacheMatrix to get the cache inverse
  inv <- x$getinverse()
  
  ## We check if the inverse has actually been computer before (i.e. it is not NULL)
  if(!is.null(inv)) {
    
    ## Since the inverse was cached previously we can simply return and exit cacheSolve function
    # message("getting cached inverse matrix") # For debugging
    return(inv)
  }
  
  # It turns out that the inverse of the matrix was not cached previously
  # So first we get the matrix using get function we defiend
  matrix <- x$get()
  # now we calculate the inverse of the above matrix using the solve function
  inv <- solve(matrix)
  # We update the cache using setinverse function define previously so we don't have to solve it again
  x$setinverse(inv)
  # Now we can return the calculated inverse to the user
  inv
}
