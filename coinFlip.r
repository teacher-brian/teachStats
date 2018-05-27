
rbinom(10,10,.5) # 10 is the number of observations while '1' is the number of trials. So, if this were 10 as well, there would a sum of 'successes' that were less than 10
dbinom(3,10,.5)  # this determines the density,  aka probability of exact outcome, so x= 3 heads out of 10, is not the cumulative 0-3 but exactly 3 for example. for cumulative, use pbinom, or sum dbinom:
sum(dbinom(3,10,.5),dbinom(2,10,.5),dbinom(1,10,.5),dbinom(0,10,.5))
pbinom(3,10,.5)


b<-10^seq(1,5,len=1000) #creates a 1000 simulations ranging frmo 10^1 to 10^5


#flip is a funciton that takes two parameters, b and x, which are the number of simulations and the probablity of the coin with a default of .5, also known as 50/50
flip <-function(b,x=.5){
  sapply(b,                   #lapply takes a vector and then applies a function with that vector
         function(b) mean(rbinom(b,1,x)))  #rbinom is a base R function that randonly generates values based on the binomial forumla
  }

plot(log10(b),flip(b,.5),type='l',col='blue',ylim = c(.3,.8))  #plot will create a graph with log10(b) as the x axes and then pots the result of the flip() function above
lines(log10(b),flip(b,.55),type='l',col='red')  #lines is like plot, but instead of creating a new plot, it overlays over top of the current plot

flip_list<-flip(b,.5)

plot(flip_list[1:999]-flip_list[2:1000])
abline(h=.01, col='red')


fair_coin<-flip(b,.5)
unfair_coin<-flip(b,.6)
df<-data.frame(fair_coin,unfair_coin)

p<-ggplot(data=df,aes(x=log10(b),y=fair_coin))+geom_line() #makes first graph, saves to 'p'

p+ geom_line(aes(x=log10(b),y=unfair_coin,col='red')) #adds new graph to 'p'








#coin_flip() does the flipping, two styles, by thumb is standard

coin_flip<-function(type = .5, bias = .1){
  rbinom(1,1,type+bias)
}
mean(replicate(100,coin_flip()))

#coin will be either unbiased or biased.  

Bag_of_coins<- c(rep(.5,9),.6) #lists 9 fair coins, one biased coin at .6
sample<-sample(Bag_of_coins,5,replace = F) #picks 5 coins randomly from bag
coin_flip(type=sample,bias=0)


#expected value
x<-c(1,2,3,4,5,6) # single dice
probability<-(c(rep(1/7,5),.2857143)) #probabilty that the dice is loaded for 6
  hist(replicate(1000,sample(x,1,replace = T,prob=probability)))
  

  x<-c(0,1) # single coin, 0=Tails
  probability<-c(.5,.5) #probabilty that the coin is fair = .5
  mean(replicate(1000,sample(x,1,replace = T,prob=probability)))
  
