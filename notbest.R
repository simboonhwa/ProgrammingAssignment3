notbest <- function(state, outcome) {
source("extracthospital.R")

        myRate.df <- get('Rate.df',envir=.GlobalEnv)

        if (is.null(myRate.df))
                myRate.df <- extracthospital(state, outcome)

        MyMin <- max(myRate.df[,1],na.rm=TRUE)
        myRate.df[match(MyMin,myRate.df[,1]),2]
}	
