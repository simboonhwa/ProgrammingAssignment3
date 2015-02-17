rankall <- function(outcome, num="best") {
	source("extracthospital.R")
	source("rankhospital.R")

	# create a global Ratio data frame to be accessible by other function	
	assign("Ratio.df", data.frame() , envir = .GlobalEnv)

	# extract relevant column for all state
	AllRatio <- extracthospital(state="all", outcome)

	# generate a list of state code
	state.l <- sort(unique(unlist(AllRatio$State)))

	# function to extract extract only the df contain only that state and
	# pass it to rankhospital function 
	StateRatio <- function (mystate){
		myratio <- AllRatio[AllRatio$State==mystate,]		
		assign("Ratio.df", myratio, envir = .GlobalEnv)
		rankhospital(mystate,outcome,num)
	}

	# state.l list are step through and each state are apply to StateRatio
	# generate the list based on outcome	
	Ratio.l <- lapply(state.l, function(x) StateRatio(x))
	do.call(rbind,Ratio.l)
}
