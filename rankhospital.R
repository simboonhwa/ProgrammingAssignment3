rankhospital<- function(state, outcome, num="best") {
	source("best.R")
	source("notbest.R")
	
	if (num=="best") 
		best(state,outcome)
	else {if (num=="worst") {notbest(state,outcome)}
		else {
        		MinRatio <- extracthospital(state, outcome)
			MinRatio$Hospital.Name[num]
		}
	}
}
		

