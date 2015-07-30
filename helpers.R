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
    result <- tb[index, c('Age',info)]
    return(result)
}

plotqx <- function(state, gender){
    tb <- gettable(state, gender)
    r1 <- rPlot(qx ~ Age , data = tb, type = "point")
    r1$addParams(title = "Mortality graph")
    return(r1)
}

mapplot <- function(age, gender){
    #Forming data frame of qx
    qxset <- c()
    for (s in 2:9) {
        qxdata <- extractdata(s, gender, age, 'qx')
        qxset <- c(qxset, qxdata[1,2])
    }
    states <- c('New South Wales', 
                'Victoria',
                'Queenland',
                'South Australia',
                'Western Australia',
                'Tasmania',
                'Northern Territory',
                'Australian Capital Territory'
    )
    df <- data.frame(States=states,qx=qxset)
    #Mapping
    GeoStates <- gvisGeoChart(df, 
                              locationvar = 'States', 
                              colorvar = 'qx',
                              options=list(region ="AU", 
                                           displayMode="regions", 
                                           resolution="provinces",
                                            width=600, height=400))
    return(GeoStates)
}