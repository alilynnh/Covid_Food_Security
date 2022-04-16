library(tidyverse)
library(ggplot2)
library(psych)
library(ggthemes)
library(scales)
library(reshape2)

# First I imported the data file using Readr. Many of the columns
# were mislabeled as logical types, so I changed them to character types during import. 

# Look at data types
sapply(Data, class)

# Get rid of spaces in column names
names(Data) <- make.names(names(Data), unique=TRUE)

# Make a total column to calculate percentages later
Data$Total <- rowSums(Data[, 1:5])

# Make a total column for those who are sometimes or often food insecure
Data$Insecure_Total <- rowSums(Data[, 3:4])

# Make a nicer date column
Data$date1 <- word(Data$week_name, -1)
Data$date2 <- word(Data$week_name, -2)
Data$Date <- paste(Data$date2, Data$date1, Data$Year, sep = "/")
Data$Date <- as.Date(Data$Date, "%B/%d/%Y")

# Check column types again
sapply(Data, class)

# Food Insecurity By Race plot - often or sometimes not enough to eat
race1plot <- Data %>%
    filter(!is.na(Race)) %>%
    filter(Location=="US") %>%
    mutate(percentage= Insecure_Total/Total) %>%
    ggplot() + aes(x = Date, y = percentage, group = Race, color = Race)+
    geom_line(size = 1) +
    theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
    ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity by Race") +
    scale_y_continuous(labels = scales::percent)

race1plot
ggsave("insecurity_race.png")

# Food Insecurity by Race plot - often not enough to eat
race2plot <- Data %>%
  filter(!is.na(Race)) %>%
  filter(Location=="US") %>%
  mutate(percentage= Often.not.enough.to.eat/Total) %>%
  ggplot() + aes(x = Date, y = percentage, group = Race, color = Race)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity by Race") +
  scale_y_continuous(labels = scales::percent)

race2plot
ggsave("often_insecure_race.png")

# Food Insecurity by Education plot
Data_E<-Data
Data_E$Education <- as.factor(Data_E$Education)
class(Data_E$Education)
levels(Data_E$Education) #need to reorder levels for better plot legend
Data_E$Education <- factor(Data_E$Education, levels = c(
  "Less than high school",
  "High school or GED",
  "Some college/associate’s degree",
  "Bachelor’s degree or higher"))
  
EducationPlot <- Data_E %>%
  filter(!is.na(Education)) %>%
  filter(Location=="US") %>%
  mutate(percentage= Often.not.enough.to.eat/Total) %>%
  ggplot() + aes(x = Date, y = percentage, group = Education, color = Education)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity by Education Level") +
  scale_y_continuous(labels = scales::percent)

EducationPlot
ggsave("often_insecure_education.png")

# Food Insecurity by Age
AgePlot <- Data %>%
  filter(!is.na(Age)) %>%
  filter(Location=="US") %>%
  mutate(percentage= Often.not.enough.to.eat/Total) %>%
  ggplot() + aes(x = Date, y = percentage, group = Age, color = Age)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity by Age Group") +
  scale_y_continuous(labels = scales::percent)

AgePlot
ggsave("often_insecure_age.png")

# COVID and Retirement - Part of "The Great Resignation"? 
# check for unique reasons for not working
unique(Data$Reason_Not_Working)# "Retired" and "I am retired" are options in the data

RetirementPlot <- Data %>%
  filter(!is.na(Reason_Not_Working)) %>%
  filter(Location=="US") %>%
  filter(Reason_Not_Working=="Retired" | Reason_Not_Working=="I am retired")%>%
  mutate(Reason_Not_Working = c("Retired")) %>%
  ggplot() + aes(x = Date, y = Total)+
  geom_line(size = 1, color="darkorchid3") +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Total Respondents") + xlab("Week") + ggtitle("Retirement and COVID") +
  scale_y_continuous(label=comma)

RetirementPlot
ggsave("covid_retire.png")

#COVID and Income (general)
Data_I<-Data
Data_I$Income <- as.factor(Data_I$Income)
class(Data_I$Income)
levels(Data_I$Income) #need to reorder levels for better plot legend
Data_I$Income <- factor(Data_I$Income, levels = c(
  "Less than $25,000", 
  "$25,000 - $34,999",
  "$35,000 - $49,999",
  "$50,000 - $74,999",
  "$75,000 - $99,999",
  "$100,000 - $149,999",
  "$150,000 - $199,999",
  "$200,000 and above",
  "Did not report")
)

IncomePlot <- Data_I %>%
  filter(!is.na(Income)) %>%
  filter(Income!="Did not report") %>%
  filter(Location=="US") %>%
  ggplot() + aes(x = Date, y = Total, group = Income, color = Income)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Total Respondents") + xlab("Week") + ggtitle("Income and COVID") +
  scale_y_continuous(label=comma)

IncomePlot
ggsave("covid_income.png")

#Food Insecurity by Income
Income_food <- Data_I %>%
  filter(!is.na(Income)) %>%
  filter(Income!="Did not report") %>%
  filter(Location=="US") %>%
  mutate(percentage= Often.not.enough.to.eat/Total) %>%
  ggplot() + aes(x = Date, y = percentage, group = Income, color = Income)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity by Income") +
  scale_y_continuous(labels = scales::percent)

Income_food
ggsave("income_food.png")

# General anxiety trend
unique(Data$Freq_Feel_Anxious)#looking at anxiety answer options

GeneralAnxietyPlot <- Data %>%
  filter(!is.na(Freq_Feel_Anxious)) %>%
  filter(Location=="US") %>%
  filter(Freq_Feel_Anxious!="Did not report")%>%
  ggplot() + aes(x = Date, y = Total, group = Freq_Feel_Anxious, color = Freq_Feel_Anxious)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Total Respondents") + xlab("Week") + ggtitle("Anxiety During COVID") +
  scale_y_continuous(label=comma)

GeneralAnxietyPlot
ggsave("general_anxiety.png")

# Food Insecurity and Anxiety
Food_Anxious <- Data %>%
  filter(!is.na(Freq_Feel_Anxious)) %>%
  filter(Location=="US") %>%
  mutate(percentage= Often.not.enough.to.eat/Total) %>%
  ggplot() + aes(x = Date, y = percentage, group = Freq_Feel_Anxious, color = Freq_Feel_Anxious)+
  geom_line(size = 1) +
  theme(axis.title = element_text(size=14),
        plot.title = element_text(hjust = .5),
        axis.text = element_text(size=12),
        axis.text.x = element_text(angle=45, hjust=1))+ 
  ylab("Percent of Respondents") + xlab("Week") + ggtitle("Food Insecurity and Anxiety Levels") +
  scale_y_continuous(labels = scales::percent)

Food_Anxious
ggsave("food_anxious.png")
