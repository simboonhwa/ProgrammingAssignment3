best <- function(state, outcome) {
source("extracthospital.R")
## Return hospital name in that state with lowest 30-day death rate
	
	#myRatio <- extracthospital(state, outcome)
	myRatio <- get('Ratio.df',envir=.GlobalEnv)
	#MyOutcome ="HeartAttack"
	#MyMin <- min(myRatio[,MyOutcome],na.rm=TRUE)
	MyMin <- min(myRatio[,1],na.rm=TRUE)
	myRatio[match(MyMin,myRatio[,1]),2:3]
	#Ratio[match(MyMin,myRatio[,MyOutcome]),2]
}
