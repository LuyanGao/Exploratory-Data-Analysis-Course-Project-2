# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

# Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
NEIdp <- tbl_df(NEI)
# Emissions per year of Baltimore
BaltimoraEmissionsForYear = summarize(group_by(filter(NEIdp, fips=="24510"), year), sum(Emissions)) 
# Rename columns
colnames(BaltimoraEmissionsForYear) <- c("Year", "Emissions") 

# Plot it
png('plot2.png')
barplot(BaltimoraEmissionsForYear$Emissions, names.arg=EmissionsForYear$Year, col="red", xlab='Years', ylab='Emissions (PM 2.5)', main =  'Baltimore City: Emissions (PM 2.5) per year')
dev.off()
