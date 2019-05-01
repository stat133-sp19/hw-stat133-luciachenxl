# private auxiliary function to calculate the mean of a binomial distribution
aux_mean<-function(trials,prob){
  return(trials*prob)}

# private auxiliary function to calculate the variance of a binomial distribution
aux_variance<-function(trials,prob){
  return(trials*prob*(1-prob))}

# private auxiliary function to calculate the most likely number of success in n independent trials with probability p of success on each trial
aux_mode<-function(trials,prob){
  n<-trials*prob+prob
  if(n-as.integer(n)==0){
    return(c(n,n-1))
  }else{
    return(floor(n))
  }
}


# private auxiliary function to calculate the skewness of the probability distribution
aux_skewness<-function(trials,prob){
  return((1-2*prob)/sqrt(trials*prob*(1-prob)))
}

# private auxiliary function to calculate the kurtosis of the probability distribution
aux_kurtosis<-function(trials,prob){
  return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}
