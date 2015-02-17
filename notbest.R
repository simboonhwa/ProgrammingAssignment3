notbest <- function(state, outcome) {
source("extracthospital.R")
## Return hospital name in that state with lowest 30-day death rate
	myRatio <- extracthospital(state, outcome)
        MyMin <- max(myRatio[,1],na.rm=TRUE)
        myRatio[match(MyMin,myRatio[,1]),2:3]
}	
