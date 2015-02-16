rankall <- function(outcome, num="best") {
	source("best.R")
	source("extracthospital.R")
	#Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	#state.l <- unique(unlist(Hospital$State))

	Ratio <- extracthospital(state="all", outcome)

	# convert the char to matrix
	#result <- cbind(sapply(state.l, function(x) best(x,outcome)))
	
	browser()
	#	MinRatio <- best(
	#MinRatio <- extracthospital(state, outcome)
	#MinRatio$Hospital.Name[num]

}
