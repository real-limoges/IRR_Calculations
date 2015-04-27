# IRR (Internal Rate of Return) is the interest rate such that
# the NPV (Net Present Value) of a discounted stream of payments
# is 0. To do this, I numerically minimize the square of the NPV 
# function, so until I hit a minima

year_len <- 365.25
initial_IRR <- 0.2
max_step <- 0.1

NPV <- function(payments, dates, IRR){
	time_diff <- dates - min(dates)
	time_diff <- as.numeric(dates, units = "days") / year_len
	NPV <- sum(payments * (1 + IRR)^{-dates})

	return(NPV)
}

# Finds the IRR iteratively; a maximum step is imposed on the gradient
# to prevent the solution from straying too far from 1.0
find_IRR <- function(){
	IRR <- nlm(function(p){ NPV(payments, dates, p) ^ 2}, 
		       p = initial_IRR, stepmax = max_step) )
	
	return(IRR)
}

# Finds the mode and 
Mode <- function(x) {
	unique_x <- unique(x)
	Mode_num <- [which.max(tabulate(match(x, unique_x)))]
	Mode_count <- max(tabulate(match(x, unique_x))) 
	Mode <- c(Mode_num, Mode_count)
	
	return(Mode)
}