###########################################################
# return data.frame with the following column
# Rate: extract the relevant rate according to outcome specified
# Hospital name
# State
###########################################################
extracthospital <- function(state="all", outcome) {
	Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	
	#create mapping the outcome to column
	OutcomeMap <- list("heart attack"=11,"heart failure"=17,"pneumonia"=23)
	MyOutcome <- OutcomeMap[[ outcome ]]

	# to check validity of argument "outcome"	
	if (missing(outcome)  | is.null(MyOutcome[1]))
		stop("invalid outcome")

	# extract Rates(base on outcome), HospitalName(column 2)&State(column 7)
	if (state!="all")
		Rate.df <- Hospital[Hospital$State==state, c(MyOutcome,2,7)]
	else 
		Rate.df <- Hospital[, c(MyOutcome,2,7)]

	# rename the extracted column name
	names(Rate.df) <- c("Rate","Hospital","State")

	# to check validity of argument "state"	& exist in table
	if (missing(state) | nrow(Rate.df)==0)
		stop("invalid state")

	Rate.df[Rate.df=="Not Available"] <- NA
        
        #transform not able to accept variable"MyOutcome"
	#Rate.df <- transform(Rate.df,MyOutcome = as.numeric(MyOutcome))

   	Rate.df[,1] <- sapply(Rate.df[,1], as.numeric)
 	Rate.df[order(Rate.df[,1],Rate.df$Hospital),]
}
