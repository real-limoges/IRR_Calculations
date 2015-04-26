# IRR (Internal Rate of Return) is the interest rate such that
# the NPV (Net Present Value) of a discounted stream of payments
# is 0. To do this, I numerically minimize the square of the NPV 
# function, so until I hit a minima

NPV <- function(payments, dates, IRR){
	time_diff <- dates - min(dates)
	time_diff <- as.numeric(dates, units = "days")
	NPV <- sum(payments * (1 + IRR)^{-dates})

	return(NPV)
}

find_IRR <- function(){
	# Initial conditions are chosen since funds typically have
	# IRRs of 20%
	IRR <- nlm( function(p){ NPV(payments, dates, p) ^ 2}, p = 0.2, stepmax = 0.1) )
	return(IRR)
}

