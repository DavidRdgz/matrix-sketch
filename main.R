#!/usr/bin/Rscript
source("MSketch.R")



main <- function(){
    
    # -----------
    #
    # Declare matrix sketch
    # args: n = number of columns,
    #       l = number of rows for matrix sketch

    m <- mSketch(n = 5, l = 10)

    # ----------
    #
    # Add rows to matrix sketch 
    # args: object = ongoing matri sketch
    #       row = streaming row to insert

    m <- addrow(object = m, row = 1:5)
    m <- addrow(object = m, row = 2:6)
    m <- addrow(object = m, row = 3:7)
    m <- addrow(object = m, row = 4:8)
    m <- addrow(object = m, row = 5:9)
    m <- addrow(object = m, row = 6:10)
    m <- addrow(object = m, row = 7:11)
    m <- addrow(object = m, row = 8:12)
    m <- addrow(object = m, row = 9:13)
    m <- addrow(object = m, row = 10:14)

    # ------------
    # 
    # At this point the matrix is full

    print(m)

    # -----------
    #
    # Add row and  matrix sketch halfs in number of rows
    
    m <- addrow(object = m, row = 11:15)
    print(m)
}
