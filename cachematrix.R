## Pair of functions that can be used to cache the inverse of a matrix.

##  makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
      
      m <- NULL
      
      set <- function(y) {
            x <<- y
            m1 <<- NULL
      }
      
      get <- function() x
      
      setinverse <- function(inverse) m <<- inverse
      getinverse <- function() m
      
      list(set = set, get = get,
           setinverse = setinverse,
           getinverse = getinverse)
}


## cacheSolve computes the inverse of the special "matrix" returned by above 
## function. If the inverse has already been calculated (& the matrix has not
## changed), then this function retrieves the inverse from the cache.

cacheSolve <- function(x, ...) {
      m <- x$getinverse()
      if(!is.null(m)) {
            message("getting cached data")
            return(m)
      }
      
      data <- x$get()
      m1 <- solve(data, ...)
      x$setinverse(m)
      m
}
