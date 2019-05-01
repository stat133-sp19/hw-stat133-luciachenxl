# private function to test if an input prob is a valid probability value
check_prob<-function(prob){
  if(length(prob)>1){
    stop("invalid prob value")
  }
  if(prob>=0&prob<=1){
    TRUE
  }else{
    stop("invalid prob value")
  }
}

# private function to test if an input trials is a valid value for number of trials
check_trials<-function(trials){
  if(trials-as.integer(trials)==0&trials>=0&length(trials)==1){
    TRUE
  }else{
    stop("invalid trials value")
  }
}

# private function to test if an input success is a valid value for number of successes
check_success<-function(success,trials){
  for(i in 1:length(success)){
    if(!success[i]-as.integer(success[i])==0){
      stop("invalid success value")
    }
    if(success[i]<0|success[i]>trials){
      stop("invalid success value")
    }
  }
  TRUE
}
check_success(2,2)
