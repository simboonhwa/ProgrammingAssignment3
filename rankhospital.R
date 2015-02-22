rankhospital<- function(state, outcome, num="best") {
	source("best.R")
	source("notbest.R")

	if (!exists("myRate.df")) 
        	myRate.df <- extracthospital(state, outcome)

	
	if (num=="best") 
		best(state,outcome)
	else {if (num=="worst") {
		notbest(state,outcome)}
		else {
			myRate.df[num,2]
			#myRate.df$Hospital.Name[num]
		}
	}
}
		

