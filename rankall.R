rankall <- function(outcome, num="best") {
	source("extracthospital.R")
	source("rankhospital.R")

	# create a global Ratio data frame to be accessible by other function	
	assign("Rate.df", NULL , envir = .GlobalEnv)
	

	# extract relevant column for all state
	AllRatio <- extracthospital(state="all", outcome)

	# generate a list of state code
	state.l <- sort(unique(unlist(AllRatio$State)))
	
	# function to extract extract only the df contain only that state and
	# pass it to rankhospital function 
	StateRate <- function (mystate){
		myratio <- AllRatio[AllRatio$State==mystate,]		
		assign("Rate.df", myratio, envir = .GlobalEnv)
		c(rankhospital(mystate,outcome,num), mystate)
	}

	
	# zerolise the global Rate.df
	assign("Rate.df", NULL , envir = .GlobalEnv)
	
	# state.l list are step through and each state are apply to StateRate
	# generate the list based on outcome	
	Ratio.l <- lapply(state.l, function(x) StateRate(x))
	
	# convert the matrix to data frame after combine the list using rbind
	result.df<- data.frame(do.call(rbind,Ratio.l))
  	colnames(result.df) <- c("hospital","state")
	rownames(result.df) <- result.df$state
        result.df
}
