#!/usr/bin/Rscript

MSketch <- function(n = 0,l = 0)
{
        msketch <- list(
            n= n,
            l= l,
            delta = 0,
            sigma.hat = 0,
            svd = list(),
            B = c()
       )

        ## Set the name for the class
        class(msketch) <- append(class(msketch),"MSketch")
        return(msketch)
}

negs.to.zero <- function(...){
    args <- list(...)
    m <- args[["matrix"]]
    m[m < 0] <- 0
    return(m)
}

frequentdirections <- function(...) UseMethod("frequentdirections")
frequentdirections.MSketch <- function(...){ 
    args <- list(...)
    object<- args[["object"]]
    
    m.svd <- svd(object$B)
    u <- m.svd$u
    v <- m.svd$v
    d <- m.svd$d
    d2 <- d^2
    delta <- d2[floor(object$l/2)] 
    sigma.tmp <- diag(d2) - diag(rep(1,length(d)))*delta
    sigma <- sqrt(negs.to.zero(matrix = sigma.tmp))

    object$B <- (sigma%*%t(v))[1:(object$l/2 -1),]
    object$delta <- delta
    object$sigma.hat <- sigma
    object$svd <- m.svd
    return(object)
}

addrow <- function(...) UseMethod("addrow")
addrow.MSketch <- function(...){
    args <- list(...)
    object <- args[["object"]]
    row <- args[["row"]]

    if (is.null(object$B)){
           object$B <- matrix(row, ncol = object$n)
    } else if (!(is.null(object$B))){
           if(nrow(object$B) < object$l){
               object$B <- rbind(object$B, row)
           } else {
               object <- frequentdirections(object = object)
           }
       }
    return(object)
}

