library(dplyr)
library(plyr)
library(corrplot)

# read the nyc data
urlfile<-"https://raw.githubusercontent.com/cunyauthor/FinalProject/master/nyc_1.csv"
nyc_1<-read.csv(url(urlfile), encoding="UTF-8", na.strings=c("","NA"), stringsAsFactors = F)

nyc_1$postal_code<-as.character(nyc_1$postal_code)

# create new column for violent crime 
index<-c("DANGEROUS WEAPONS","FELONY ASSAULT","KIDNAPPING & RELATED OFFENSES","MURDER & NON-NEGL. MANSLAUGHTER","ROBBERY","SEX CRIMES")
nyc_1$crime_v<-index[(match(nyc_1$OFNS_DESC,index))]

nyc_1$crime_v<-as.factor(nyc_1$crime_v)

# agrregate the crime data by zip code
nyc_s1<-aggregate(OFNS_DESC ~ postal_code, nyc_1, length)
nyc_s2<-aggregate(crime_v ~ postal_code, nyc_1, length)

colnames(nyc_s1) <- c("zip","freq_crime")
colnames(nyc_s2) <- c("zip","freq_violent_crime")

# joint two tables of crime data
nyc_s12<-left_join(nyc_s1, nyc_s2, "zip")

# change NA for zero 
nyc_s12[is.na(nyc_s12)]<-0

# Crime table
nyc_s12

# Read data from real state 
urlfile<-"https://raw.githubusercontent.com/cunyauthor/FinalProject/master/trulia_sqft.csv"
trulia<-read.csv(url(urlfile), encoding="UTF-8", na.strings=c("","NA"), stringsAsFactors = F)

# Statistics summary of NYC prices
summary(trulia$Median_sales_price)
summary(trulia$Price_sqft)

# Trulia table price by zip
trulia

# Change zip to as.character
trulia$zip<-as.character(trulia$zip)

# Join the two tables
nyc_full<-inner_join(trulia,nyc_s12, "zip")
nyc_full

# read population by ZIP frm 2010 US Census
urlfile<-"https://raw.githubusercontent.com/cunyauthor/FinalProject/master/pop_zip_census.csv"
zip_pop<-read.csv(url(urlfile), encoding="UTF-8", na.strings=c("","NA"), stringsAsFactors = F)


colnames(zip_pop) <- c("zip","pop")
zip_pop$zip<-as.character(zip_pop$zip)

# Join the two tables, add population data
nyc_full<-inner_join(nyc_full,zip_pop, "zip")

# Include crime rate data per 1000.000 habit per year by zip
nyc_full$crime_rate<-(nyc_full$freq_crime/nyc_full$pop)*100000 * 458557/nrow(nyc_1)

#  Correlation matriz
nyc_full$X<-NULL
m<-cor(subset(nyc_full, select=-c(zip)))
corrplot(m, type="upper", order="hclust", t1.col="black",t1.srt=45)

# Regression analysis
lmt<-lm(Price_sqft ~ freq_violent_crime, nyc_full)
summary(lmt)
plot(nyc_full$freq_violent_crime,nyc_full$Price_sqft, main="Price vs Violent crime by ZIP", xlab="violent crime", ylab="price by square/foot")
abline(lmt)

