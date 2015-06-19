## Put comments here that give an overall description of what your
## functions do

## makeCache 
## stores a lisft of functions (set, get, setmatrix, getmatrix)

makeCacheMatrix <- function(x = matrix()) {
    ## initialize
    m<-NULL
    y <- NULL
    ## set function
    setmatrix<-function(y){
      x<<-y
      m<<-NULL
    }
    ## get function
    getmatrix<-function() x
    ## set matrix
    setinverse<-function(solve) m <<- solve
    ## get matrix
    getinverse<-function() m
    ## store functions to main function makeCacheMatrix
    list(setmatrix=setmatrix, getmatrix=getmatrix,
         setinverse=setinverse,getinverse=getinverse)
}

##  computes the inverse of the special "matrix" returned by makeCacheMatrix

cacheSolve <- function(x, ...) {
  ## get inverse matrix
  m<-x$getinverse()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }

  matrix<-x$getmatrix()
  m<-solve(matrix)
  x$setinverse(m)
  m

}
