##This makes it possible to maintain a counter that records how many times a
##function has been called, as the following example shows.
##Each time new_counter is run, it creates an environment,
##initialises the counter i in this environment, and then creates a new function.

##The new function is a closure, and its environment is the enclosing environment.
##When the closures counter_one and counter_two are run,
##each one modifies the counter in its enclosing environment and then returns the current count. 

##global environment > new_counter enviroment > closure function environment

new_counter <- function() {
  i <- 0         ##Set i <- 0 in current (new_counter) environment?
  function() {
    i <<- i + 1  ##cache i to parent (new_counter) environment(?)
    i            ##return i in which environment (?)
  }
}
new_counter() ##The first  function is run when this is called
              ##Output is the second function only
a <- new_counter()  ##The first function is called, i<-0, then a<-function2
b <- new_counter()  ##The first function is called, i<-0 in a different environment, then b<-function2
a() ##calls ONLY the second function, return(i) in the new_counter/parent environment
## [1] 1
a()
## [1] 2
b() ##calls ONLY the second function, return(i) in the other new_counter/parent environment
## [1] 1
