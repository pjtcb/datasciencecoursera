########################################################################################################################
#
# Testing Programming assignment 2: 
#
# Uses makeCacheMatrix and cacheSolve to multiply an ivertible matrix with its inverse to return
# the identy matrix.  First instance should return the result 'quiet;y', the second instance should
# give a notification that the cahed result is used
#
########################################################################################################################

source('datasciencecoursera/cachematrix.R')

invertablemat <- rbind(c(1,0,5),c(2,0,6),c(3,4,0))
identitymat <- rbind(c(1,0,0),c(0,1,0),c(0,0,1))
cache <- makeCacheMatrix(invertablemat)
inversemat <- cacheSolve(cache)

if (identical(identitymat, inversemat %*% invertablemat)) {
	message('Check 1: identity matrix calculated correctly')
	}
mat4 <- cacheSolve(cache)
# The following should return TRUE
if (identical(identitymat, inversemat %*% invertablemat)) {
	message('Check 1: identity matrix calculated correctly')
	}

