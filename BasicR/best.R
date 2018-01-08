
best <- function(in_state, outcome) {
    
    ## Read outcome data
    read_data <- read.csv(file.path(temp2,'outcome-of-care-measures.csv',fsep='\\'), colClasses="character")
    
    ## check state and outcome are valid
    if (!(in_state %in% read_data$State)) {
        return ('invalid state')
    } else {
        print('proceed')
    }
    
    compare = c('heart attack', 'heart failure', 'pneumonia')
    if (!(outcome %in% compare)) {
        return ('invalid outcome')
    } else {
        print('proceed')
    }
    
    ## return hospital name in that sate with lowest 30-day death rate
    ### [2] "Hospital.Name"
    ### [7] "State"
    ### [11]"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"    
    ### [17] "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
    ### [23] "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"  
    
    a <- read_data[, c(2,7,11,17,23)]
    a[,c(3:5)] <- lapply(a[,c(3:5)],as.numeric)
    names(a) <- c('hospital','state','heart attack','heart failure','pneumonia')
    
    
    state_group <- split(a, a$state)
    b <-lapply(state_group, function (state_group) which(state_group[outcome]== min(state_group[outcome], na.rm=TRUE)))
    outcome_a = c('hospital',"state", outcome)
    a[b[in_state][[1]],outcome_a]
}
    
    
