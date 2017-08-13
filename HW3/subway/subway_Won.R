# Load subway.csv file to a data frame
# Use read.table
df <- read.table('subway.csv', header = T, sep = ',', encoding = 'utf-8', stringsAsFactors = FALSE)
passenger <- df$get_in + df$get_off
df <- cbind(df, passenger)
df$station_name[df$line == "2호선" & df$station_name == "신촌"] <- "신촌2"
df$station_name[df$line == "5호선" & df$station_name == "양평"] <- "양평5"


# (a) What is the average numberxc of passengers of Sinchon station?
# The number should be stored in the variable 'ans_a'.
ans_a <- mean(df[df$line == "2호선" & df$station_name == "신촌2",6])


# (b) Find top 10 subway stations in terms of the avg. number of passengers.
# The list of top 10 subway stations should be stored in the variable 'ans_b'.
# (Hint: you may use sort function like the following codes)
stations <- unique(df[3])

for(i in c(1:nrow(stations))){
  stations[i, 2] <- mean(df[df$station_name == stations[i, 1], 6])
}
names(stations)[2] <- "avg_passengers"
sorted_stations <- stations[order(stations$avg_passengers, decreasing = TRUE),]
ans_b <- sorted_stations$station_name[1:10]

for (i in c(1:length(ans_b)))
{
  if (ans_b[i] == "신촌2")
  {
    ans_b[i] <- c("신촌")
  }
}
ans_b
# (c) Find top 3 subway lines in terms of the average number of passengers.
# The list of top 3 subway lines should be stored in the variable 'ans_c'.
lines <- unique(df[2])
for(i in c(1:nrow(lines))){
  lines[i, 2] <- mean(df[df$line == lines[i, 1], 6])
}
names(lines)[2] <- "avg_passengers" 
sorted_lines <- lines[order(lines$avg_passengers, decreasing = TRUE),]
ans_c <- sorted_lines$line[1:3]
ans_c

# (d) Draw scatter plots for the number of passengers of Nakseongdae station and Incheon Int'l Airport station.
x1 <- df$date[df$station_name == "낙성대"]
y1 <- df$passenger[df$station_name == "낙성대"]
plot(x1, y1, xlab = "time", ylab = "passengers", main = "낙성대", ylim = c(20000,80000),pch = 1, col = "red")
par(new = T)
x2 <- df$date[df$station_name == "인천국제공항"]
y2 <- df$passenger[df$station_name == "인천국제공항"]
plot(x2, y2, xlab = "time", ylab = "passengers", main = "인천국제공항", ylim = c(20000,50000), pch = 2, col = 'blue')

