# adds up numbers of birds and dogs

# defined function
birddog_sum <- function(bird, dog) {
  pets <- bird + dog
  return(pets) 
}

# use it 
total_pets <- birddog_sum(bird = 2, dog = 5)

total_pets <- birddog_sum(2, 5) # same as above

# create a function to double values 
double_it <- function(x){
  print(2 * x)
}

double_it(4)

# write a function with conditionals
# example is converting animals' ages 
# write an updated version of animal age now with error messages 

animal_age_stop <- function(animal, age) {
  
  if (!animal %in% c("dog", "goat")) {
    stop("Ooops animal must be a dog or goat.")
}

  if (is.numeric(age) == FALSE) {
  stop("The age must be a number.")
  }
  if (age <= 0){
    stop("age must be greater than zero")
  }
}

animal_age_stop <- animal_age_stop("dog","5")
animal_age_stop_1 <- animal_age_stop("whale", 6)
animal_age_stop_2 <- animal_age_stop("dog", 0)

  
 


