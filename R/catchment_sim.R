#### Simulating catchment areas ####

# Function to simulate specified catchment square area (a x a)

catchment_sim <- function(n, alpha, gamma, area){

  #gamma distribution of catchment area
  size <- round(rgamma(n, alpha, gamma)) |>
    (\(x) replace(x, x == 0, 1))()


  # creating empty vectors to hold number catchment areas of size n
  xStart <- c()
  xEnd <- c()
  yStart <- c()
  yEnd <- c()


  # for loop that populates the start and end values for x and y coordinates of the boundaries of catchment areas
  for(i in 1:n){

    xStart[i] <- (i-1) %/% (n/4) * area
    xEnd[i] <- (i-1) %/% (n/4) * area + area
    yStart[i] <- (i-1) %% (n/4) * area
    yEnd[i] <- (i-1) %% (n/4) * area + area

  }


  # populating a data frame with simulated data
  sim_catchment_df <- data.frame(catchID = c(1:n),
                                 num.schools = size,
                                 xStart, xEnd,
                                 yStart, yEnd)

  return(sim_catchment_df)
}