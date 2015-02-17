rankall <- function(outcome, num="best") {
	#hospital.env <- new.env()
	assign("Ratio", data.frame() , envir = .GlobalEnv)
	#Ratio <- data.frame()
	source("best.R")
	source("extracthospital.R")
	#Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

	#Ratio <- extracthospital(state="all", outcome)

	allratio <- extracthospital(state="all", outcome)
	SetGlobalRatio <- function (x){
		myratio <- allratio[allratio$State==x,]		
		assign("Ratio", myratio, envir = .GlobalEnv)
		best(x,outcome)
	}
	# assign global "Ratio" to be used by best funtcion)
	#assign("Ratio", myratio, envir = hospital.env)
	state.l <- unique(unlist(allratio$State))
	ll <- lapply(state.l, function(x) SetGlobalRatio(x))
	do.call(rbind,ll)
	# convert the char to matrix
	#result <- cbind(sapply(state.l, function(x) best(x,outcome)))
	
	#	MinRatio <- best(
	#MinRatio <- extracthospital(state, outcome)
	#MinRatio$Hospital.Name[num]

}
