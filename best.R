best <- function(state, outcome, top=TRUE) {
source("extracthospital.R")
## Return hospital name in that state with lowest 30-day death rate
	

	MinRatio <- extracthospital(state, outcome)
	MyOutcome ="HeartAttack"
	
	MyMin <- min(MinRatio[,MyOutcome],na.rm=TRUE)
	MinRatio[match(MyMin,MinRatio[,MyOutcome]),2]
}
