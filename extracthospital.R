extracthospital <- function(state="all", outcome) {
	Hospital <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
	colnames(Hospital)[11] <- "HeartAttack"
	colnames(Hospital)[17] <- "HeartFailure"
	colnames(Hospital)[23] <- "Pneumonia"

	OutcomeMap <- list("heart attack"="HeartAttack","heart failure"="HeartFailure","pneumonia"="Pneumonia")
	MyOutcome <- OutcomeMap[[ outcome ]]
	
	if (missing(outcome)  | is.null(MyOutcome[1]))
		stop("invalid outcome")
	
	if (state!="all"){
		MinRatio <- subset(Hospital, State==state, select=(c(MyOutcome,"Hospital.Name")))}
	else {
		MinRatio <- subset(Hospital, select=(c(MyOutcome,"Hospital.Name","State")))}


	#MinRatio <- ifelse(state!="all",subset(Hospital, State==state, select=(c(MyOutcome,"Hospital.Name"))), subset(Hospital, select=(c(MyOutcome,"Hospital.Name",State))))

## Check that state and outcome are valid
	if (missing(state) | nrow(MinRatio)==0)
		stop("invalid state")

	MinRatio[MinRatio=="Not Available"] <- NA
        #MinRatio <- transform(MinRatio,MyOutcome = as.numeric(MyOutcome))
        #transform not able to accept variable"MyOutcome"

   	MinRatio[,MyOutcome] <- sapply(MinRatio[,MyOutcome], as.numeric)
 	MinRatio[order(MinRatio[,MyOutcome],MinRatio$Hospital.Name),]

	#Return the DF according to state & Outcome	
}
