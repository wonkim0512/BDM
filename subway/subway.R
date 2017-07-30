# Load subway.csv file to a data frame
# Use read.table
options(encoding = 'utf-8')
df <- read.table('C:\\Users\\woni\\Desktop\\BD\\BDM\\HW\\HW3\\subway\\subway.csv', sep = ",", header = T, fileEncoding = 'utf-8')

# (a) What is the average number of passengers of Sinchon station?
# The number should be stored in the variable 'ans_a'.
passengers <- df$get_in + df$get_off
df <- cbind(df, passengers)
ans_a <- mean(df[which(df$line == "2호선"&df$station_name == "신촌"),]$passengers)

# (b) Find top 10 subway stations in terms of the avg. number of passengers.
# The list of top 10 subway stations should be stored in the variable 'ans_b'.
# (Hint: you may use sort function like the following codes)
df1 <- data.frame()
for (line in levels(df$line)){
  
}



t <- c(1, 3, 2, 5, 4)
s <- sort(t, decreasing = T)
s

ans_b <- ...

# (c) Find top 3 subway lines in terms of the average number of passengers.
# The list of top 3 subway lines should be stored in the variable 'ans_c'.


ans_c <- ...

# (d) Draw scatter plots for the number of passengers of Nakseongdae station and Incheon Int'l Airport station.
