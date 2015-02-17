rankhospital<- function(state, outcome, num="best") {
	source("best.R")
	source("notbest.R")

        #myRatio <- extracthospital(state, outcome)
        myRatio <- get('Ratio.df',envir=.GlobalEnv)
	
	if (num=="best") 
		ss <- best(state,outcome)
	else {if (num=="worst") {ss <- notbest(state,outcome)}
		else {
        		#myRatio <- extracthospital(state, outcome)
			ss <- myRatio[num,2:3]
			#myRatio$Hospital.Name[num]
		}
	}
	rownames(ss) <- state
	ss$State <- state
	ss
}
		

