best <- function(state, outcome) {
source("extracthospital.R")
## Return hospital name in that state with lowest 30-day death rate
	
        myRate.df <- get('Rate.df',envir=.GlobalEnv)

        if (is.null(myRate.df))
                myRate.df <- extracthospital(state, outcome)
	
	MyMin <- min(myRate.df[,1],na.rm=TRUE)
	myRate.df[match(MyMin,myRate.df[,1]),2]
}
