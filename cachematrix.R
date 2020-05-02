## makeCacheMatrix:
## This function creates a special "matrix" object that can cache 
## its inverse with its own set and get methods.

makeCacheMatrix <- function(x = matrix()) {
  matriz<-NULL  # assigns NULL to a variable within the current environment 
  y<-NULL 
  
  setmatrix<-function(y){  # Set matrix value
    x<<-y  # cache the matrix - assigns value y from parent environment
    matriz<<-NULL # search through parent environments for an existing definition of the variable and set to NULL
  }
  # Get the matrix value cached with setmatrix
  getmatrix<-function() x 
  # Solve the inverse of the actual matrix and set in the current environment
  setinverse<-function(inverse) matriz<<- inverse
  # Get the value of inverse matrix
  getinverse<-function() matriz
  
  # List the four methods in a list 
  list(setmatrix=setmatrix, 
        getmatrix = getmatrix,  
        setinverse = setinverse,
        getinverse = getinverse) 
  
}


## cacheSolve: 
## This function computes the inverse of the special "matrix" 
## returned by makeCacheMatrix above. If the inverse has already been 
## calculated (and the matrix has not changed), then the cachesolve should 
## retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    inverse <- x$getinverse() # Obtain the inverse if it's already cached
    if(!is.null(inverse)){ # Is it already calculated?
        message("Getting data cached...")
        return(inverse) # Return the previously calculated inverse.
    }
    # In case it haven't been calculated, proceed using the methods from
    # previous object.
    y <- x$getmatrix() 
    x$setmatrix(y)
    # Function which returns the inverse in case it exist. (like this exercise)
    inverse <- solve(y, ...) 
    # Set the inverse
    x$setinverse(m)
    # Return the inverse calculated
    inverse 
}
