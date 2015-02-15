rankall <- function(outcome, num="best") {
	Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

        MinRatio <- extracthospital(state, outcome)
#browser()
	MinRatio$Hospital.Name[num]
	
}
