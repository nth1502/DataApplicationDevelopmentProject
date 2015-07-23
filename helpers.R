gettable <- function(state, gender){
    tb <- get(paste('state',state,sep=""))
    if (gender == 'Male') {
        tb <- tb[,1:5]
    } else {
        tb <- tb[,c(1,6:9)]
    }
    colnames(tb) <-  c('Age','lx','qx','Lx','ex')
    return(tb)
}

extractdata <- function(state, gender, age, info){
    tb <- gettable(state, gender)
    index <- age + 1
    return(tb[index, c('Age',info)])
}

plotqx <- function(state, gender){
    tb <- gettable(state, gender)
    r1 <- rPlot(qx ~ Age , data = tb, type = "point")
    r1$addParams(title = "Mortality graph")
    return(r1)
}

