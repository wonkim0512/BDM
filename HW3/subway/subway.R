# Load subway.csv file to a data frame
# Use read.table
options(encoding ='utf-8')
df <- read.table('subway.csv', header=T, sep=',', encoding ='utf-8', stringsAsFactors = FALSE)
df$sum <- df$get_in+df$get_off
df$station_name[df$station_name == '신촌' & df$line == '2호선'] <- '신촌2'
df$station_name[df$station_name == '양평' & df$line == '5호선'] <- '양평5'


# (a) What is the average number of passengers of Sinchon station?
# The number should be stored in the variable 'ans_a'.
ans_a <- mean(df[df$station_name == '신촌2' & df$line == '2호선',6])

# (b) Find top 10 subway stations in terms of the avg. number of passengers.
# The list of top 10 subway stations should be stored in the variable 'ans_b'.
# (Hint: you may use sort function like the following codes)

# 신촌 - 양평 구분

df2 <- unique(df[3])
for(i in c(1:nrow(df2))){
  df2[i,2] <- mean(df[df$station_name == df2[i,1], 6])
}
df2 <- df2[order(-df2[2]),]
ans_b <- df2[1:10,1]


# (c) Find top 3 subway lines in terms of the average number of passengers.
# The list of top 3 subway lines should be stored in the variable 'ans_c'.
df3 <- unique(df[2])
for(i in c(1:nrow(df3))){
  df3[i,2] <- mean(df[df$line == df3[i,1],6])
}
df3 <- df3[order(-df3[2]),]
ans_c <- df3[1:3,1]

# (d) Draw scatter plots for the number of passengers of Nakseongdae station and Incheon Int'l Airport station.
# x - time , y - passengers

plot( x <- df$date[df$station_name=='낙성대'], y <- df[df$station_name =='낙성대',6], ylim = c(0,90000), type = 'b' ,xlab ='Time', ylab='passengers', col='red')
par(new = T)
plot( x <- df$date[df$station_name=='인천국제공항'], y <- df[df$station_name =='인천국제공항',6], ylim = c(0,90000), type = 'b', xlab = 'Time', ylab ='passengers')
