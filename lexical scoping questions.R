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
