best <- function(state, outcome) {
## Read outcome datai
##How come need to use colClasses??
	Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	colnames(Hospital)[11] <- "HeartAttack"
	colnames(Hospital)[17] <- "HeartFailure"
	colnames(Hospital)[23] <- "Pneumonia"

	OutcomeMap <- list("heart attack"="HeartAttack","heart failure"="MHeartFailure","pneumonia"="Pneumonia")
	MyOutcome <- OutcomeMap[[ outcome ]]
	if (missing(outcome)  | is.null(MyOutcome[1]))
		stop("invalid outcome")
	
	MinRatio <- subset(Hospital, State==state, select=(c(MyOutcome,"Hospital.Name")))

## Check that state and outcome are valid
	if (missing(state) | nrow(MinRatio)==0)
		stop("invalid state")
## Return hospital name in that state with lowest 30-day death
## rate
	
	MinRatio[MinRatio=="Not Available"] <- NA

	#MinRatio <- transform(MinRatio,MyOutcome = as.numeric(MyOutcome))
	#transform not able to accept variable"MyOutcome"
	MinRatio[,MyOutcome] <- sapply(MinRatio[,MyOutcome], as.numeric)
	
	MyMin <- min(MinRatio[,MyOutcome],na.rm=TRUE)
	MinRatio[match(MyMin,MinRatio[,MyOutcome]),2]
}
