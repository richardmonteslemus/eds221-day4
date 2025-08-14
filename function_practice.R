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

# Error examples 
# animal_age_stop <- animal_age_stop("dog","5")
# animal_age_stop_1 <- animal_age_stop("whale", 6)
# animal_age_stop_2 <- animal_age_stop("dog", 0)

  
# function meet for loops 

# all the dataframes in the function are called df --> arguments df

df_means <- function(df){
  for (i in 1:ncol(df)) {
    column_name <- colnames(df[i])
    if (is.numeric(df[[i]]) == TRUE) {
    col_mean <- mean(df[[i]], na.rm = TRUE)
    print(paste("The mean value of", column_name, "is", round(col_mean, 3)))
  }}
}

df_means(df = mtcars)
df_means(mtcars)

df_means(palmerpenguins::penguins)


library(tidyverse)

# logistic growth equation
logistic_growth <- function (N0, K, r, time) {
  Nt <- K / (1 + ((K - N0)/N0) * exp(-r * time))
  print(Nt)
}

# create a vector of times 
time_vec <- seq(from = 0, to = 35, by = 0.1)

# check for one set of time values 
pop_35 <- logistic_growth(N0 = 100, K = 6000, r = 0.27, time = time_vec)

# bind vectors to create a dataframe 
pop_time_35 <- data.frame(time_vec, pop_35)

# plot it
ggplot(data = pop_time_35, aes(x = time_vec, y = pop_35)) + 
  geom_line(size = 0.5)

## adding in growth rates 

# create a sequence of growth rate values
r_seq <- seq(from = 0.20, to = 0.40, by = 0.01)

# create a nested for loop 
# logistic growth function for a range of time for each growth rate 

# need to create an empty matrix with desired dimensions
out_matrix <- matrix(nrow = length(time_vec), ncol = length(r_seq))

for (i in seq_along(r_seq)){
  for (j in seq(time_vec)){
    pop <- logistic_growth(N0 = 100, K = 6000, r = r_seq[i], time = time_vec[j])
    out_matrix[j, i] <- pop
  }
}

# wrangling now 

out_df <- data.frame(out_matrix, time = time_vec)

colnames(out_df) <- c(paste0("gr_", r_seq), "time")

# pivot_longer to make it tidy 
out_df_long <- out_df %>% 
  pivot_longer(cols = -time, names_to = "growth_rate", values_to = "population")

# Plot pivoted table 

ggplot(data = out_df_long, aes(x = time, y = population)) + 
  geom_line(aes(color = growth_rate)) + 
  theme_minimal()

