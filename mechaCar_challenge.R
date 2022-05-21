# Load dplyr package
library(dplyr)

# Import and read in csv as a dataframe
mpg_table <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table)

# Determine p-value and r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mpg_table))



# Import and read in csv as a dataframe
suspension_table <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

# Summarize the suspension coil's PSI column
total_summary <- suspension_table %>% summarize(Mean=mean(PSI),
                                                Median=median(PSI),
                                                Variance=var(PSI),
                                                SD=sd(PSI))
# Summarize the PSI metrics for each lot
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),
                                                                              Median=median(PSI),
                                                                              Variance=var(PSI),
                                                                              SD=sd(PSI))



# Use t-Test to determine if PSI across all manufacturing lots is statistically different from the population mean of 1500 PSI
t.test(suspension_table$PSI,mu=1500)

# Create subsets for the lots
lot_one <- subset(suspension_table, Manufacturing_Lot=="Lot1")
lot_two <- subset(suspension_table, Manufacturing_Lot=="Lot2")
lot_three <- subset(suspension_table, Manufacturing_Lot=="Lot3")

# Test Manufacturing Lot 1
t.test(lot_one$PSI,mu=1500)

# Test Manufacturing Lot 2
t.test(lot_two$PSI,mu=1500)

# Test Manufacturing Lot 2
t.test(lot_three$PSI,mu=1500)
