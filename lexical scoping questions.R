##This makes it possible to maintain a counter that records how many times a
##function has been called, as the following example shows.
##Each time new_counter is run, it creates an environment,
##initialises the counter i in this environment, and then creates a new function.

##The new function is a closure, and its environment is the enclosing environment.
##When the closures counter_one and counter_two are run,
##each one modifies the counter in its enclosing environment and then returns the current count. 

##global environment > new_counter enviroment < closure function environment

new_counter <- function() {
  i <- 0         ##Set i <- 0 in current (new_counter) environment? Why is this not called each time?
  function() {
    i <<- i + 1  ##cache i to parent (new_counter) environment???
    i            ##which i is being returned???
  }
}
new_counter() ##what happens when new_counter() is called?
a <- new_counter()
b <- new_counter()
a() ##why is this different from calling new_counter()
## [1] 1
a()
## [1] 2
b()
## [1] 1

##each time a() or b() is called, exactly what happens?

str(a)
str(new_counter)
