notbest <- function(state, outcome) {
source("extracthospital.R")
## Return hospital name in that state with lowest 30-day death rate
	

	Ratio.df <- extracthospital(state, outcome)
	MyOutcome ="HeartAttack"
	
	MyIndex <- max(Ratio.df[,MyOutcome],na.rm=TRUE)
	Ratio.df[match(MyIndex,Ratio.df[,MyOutcome]),2]
}
