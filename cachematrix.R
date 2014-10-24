### makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) { ## x should be an invertible square matrix
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m ##prints NULL until cacheSolve is called
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


cacheSolve <- function(x, ...) { ##input the special stored matrix
  m <- x$getinverse()
  if(!is.null(m)) { ##if cached, will return m
    message("getting cached data")
    return(m)
  }
  data <- x$get()  ##else the inverse is solved and stored
  m <- solve(data)
  x$setinverse(m)
  m
}

##sample output
c<-matrix(c(10,20,30,40),2,2) ##create invertible square matrix
a <- makeCacheMatrix(c) ##create special matrix
a$get()  ##print matrix
a$getinverse()  ##retrieve NULL, as cacheSolve hasn't been called on "a"
cacheSolve(a)  ##call for the first time, solve is run and inverse is cached
a$getinverse() ##retrieve the cached inverse