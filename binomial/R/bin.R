#' @title choose
#' @description that calculates the number of combinations in which k successes can occur in n trials.
#' @param n the number of trials
#' @param k the number of success
#' @return the number of combinations in which k successes can occur in n trials.
#' @export
#' @examples
#'
#' bin_choose(n=5,k=2)
#' #the number of combinations where 2 successes can occur in 5 trials.
#'
bin_choose<-function(n,k){
  y<-c(n>=k)
  if(sum(as.integer(y))-length(y)!=0){
    stop("k cannot be greater than n")
  }else{
    return((factorial(n)/(factorial(k)*factorial(n-k))))
  }
}


#' @title probability
#' @description that calculates the probability of k successes in n trials
#' @param success the number of successes
#' @param trials the number of trials
#' @param prob the probability of success in 1 trial
#' @return the probability of k successes in n trials
#' @export
#' @examples
#'
#' # probability of getting 2 successes in 5 trials
#' #(assuming prob of success = 0.5)
#' bin_probability(success = 2, trials = 5, prob = 0.5
#'
#' # probabilities of getting 2 or less successes in 5 trials
#' # (assuming prob of success = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' #55 heads in 100 tosses of a loaded coin with 45% chance of heads
#' bin_probability(success = 55, trials = 100, prob = 0.45)


bin_probability<-function(success,trials,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  return(choose(trials,success)*prob^success*(1-prob)^(trials-success))
}


#' @title distribution
#' @description that returns a data frame with the probability distribution
#' @param trials the number of trials
#' @param prob the probability of success in 1 trial
#' @return  an object of class "bindis" and "data.frame" with the following elements:
#' @export
#' @examples
#'
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)


bin_distribution<-function(trials,prob){
  dis<-data.frame(success=c(0:trials),probability=bin_probability(0:trials,trials,prob))
  dis0<-structure(dis,class=c("bindis","data.frame"))
  return(dis0)
}
class(bin_distribution(5,.5))==c("bindis","data.frame")


#' @export
plot.bindis<-function(x,...){
  barplot(height=x$probability,
          names.arg =x$success,
          xlab="successes",
          ylab="probability")
}


#' @title cumulative
#' @description that returns a data frame with the probability distribution and the cumulative distribution
#' @param trials the number of trials
#' @param prob the probability of success in 1 trial
#' @return  an object of class code "bincum" and "data.frame" with the following elements:
#' @export
#' @examples
#'
#' # binomial cumulative distribution
#' bin_cumulative(trials = 5, prob = 0.5)


bin_cumulative<-function(trials,prob){
  cum<-data.frame(success=c(0:trials),probability=bin_probability(0:trials,trials,prob),cumulative=rep(0,trials+1))
  for(i in 0:trials){
    cum[i+1,3]<-sum(bin_probability(0:i,trials,prob))
  }
  cum0<-structure(cum,class=c("bincum","data.frame"))
  return(cum0)
}
bin_cumulative(trials = 5, prob = 0.5)

#' @export
plot.bincum<-function(b,...){
  plot(x = b$success, y = b$cumulative, type="b",xlab="successes",ylab="probability")
}
plot.bincum(bin_cumulative(trials = 5, prob = 0.5))

#' @title Variable
#' @description Returns a list with trials and prob
#' @param trials number of trials
#' @param prob the probability of success
#' @return  a list with trials and prob
#' @export
#' @examples
#'

bin_variable<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  obj<-list(
    trials=trials,
    prob=prob
  )
  class(obj)<-"binvar"
  obj
}

#' @export
print.binvar<-function(d,...){
  print("Binomial variable")
  print("")
  print("Paramaters")
  print(paste0("- number of trials:",d$trials))
  print(paste0("- prob of success:",d$prob))
}


#' @export

summary.binvar<-function(e,...){
  obj<-list(
    trials=e$trials,
    prob=e$prob,
    mean=aux_mean(e$trials,e$prob),
    variance=aux_variance(e$trials,e$prob),
    mode=aux_mode(e$trials,e$prob),
    skewness=aux_skewness(e$trials,e$prob),
    kurtosis=aux_kurtosis(e$trials,e$prob)
  )
  class(obj)<-"summary.binvar"
  obj
}


#' @export
print.summary.binvar<-function(f,...){
  print("Summary Binomial")
  print("")
  print("Paramaters")
  print(paste0("- number of trials:",f$trials))
  print(paste0("- prob of success:",f$prob))
  print("")
  print("Measures")
  print("")
  print(paste0("- mean:",f$mean))
  print(paste0("- variance:",f$variance))
  print(paste0("- mode:",f$mode))
  print(paste0("- skewness:",f$skewness))
  print(paste0("- kurtosis:",f$kurtosis))
}

#' @title the average probability
#' @description calculate the average probability of successes in trials
#' @param trials the number of trials
#' @param prob the probability of success in one trial
#' @return the numeric result of the average probability of successes in trials
#' @export
#' @examples
#' bin_mean(10, 0.3)
#' #the expeted value of successes in 10 trials with 0.3 success probability in one trial
#'
bin_mean<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  mean<-aux_mean(trials,prob)
  return(mean)
}

#' @title the variance of probabilities
#' @description calculate the variance of probabilities of successes in trials
#' @param trials the number of trials
#' @param prob the probability of success in one trial
#' @return the numeric result of the variance of probabilities of successes in trials
#' @export
#' @examples
#' bin_variance(10, 0.3)
#' #the variance of successes in 10 trials with 0.3 success probability in one trial
#'
bin_variance<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  variance<-aux_variance(trials,prob)
  return(variance)
}

#' @title the mode
#' @description calculate the most likely number of success in n independent trials with probability p of success on each trial is m, the greater integer less than or equal to np + p
#' @param trials the number of trials
#' @param prob the probability of success in one trial
#' @return the most likely number of success in n independent trials with probability p of success on each trial
#' @export
#' @examples
#'
#' bin_mode(10, 0.3)
#' #the most likely number of success in 10 independent trials with probability 0.3 of success on each trial
#'
bin_mode<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  mode<-aux_mode(trials,prob)
  return(mode)
}

#' @title skewness
#' @description Skewness is a measure of the asymmetry of the probability distribution of a random variable about its mean. The skewness value can be positive or negative, or undefined.
#' @param trials the number of trials
#' @param prob the probability of success in one trial
#' @return The skewness of a binomial random variable
#' @export
#' @examples
#'
#' bin_skewness(10, 0.3)
#'
bin_skewness<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  skewness<-aux_skewness(trials,prob)
  return(skewness)
}

#' @title kurtosis
#' @description The Kurtosis from greek kurtos, meaning ¡°curved, arching¡± is a measure of the ¡°tailedness¡± of the probability distribution of a random variable.
#' @param trials the number of trials
#' @param prob the probability of success in one trial
#' @return The kurtosis of a binomial random variable
#' @export
#' @examples
#'
#' bin_kurtosis(10, 0.3)
#'
bin_kurtosis<-function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  kurtosis<-aux_kurtosis(trials,prob)
  return(kurtosis)
}
