# Food Insecurity During the COVID-19 Pandemic
## Project Overview
### Background
Food insecurity can be defined as a lack of consistent access to adequate and nutritious food that meets the dietary needs and food preferences of an individual (Niles et al., 2020). Food insecurity can lead to serious negative health outcomes such as diabetes, high blood pressure, heart disease, and mental health challenges (Niles et al., 2020). Trends in food insecurity tend to parallel trends in unemployment, poverty, and food prices (Niles et al., 2020). The COVID-19 pandemic and the subsequent social distancing efforts have caused disruption in food systems which has had serious food security implications (Niles et al., 2020). The purpose of the current project was to explore trends in food insecurity during the COVID-19 pandemic, as well as gather research on the topic. 

### Data and Tools
The data used for the visualizations in this project was obtained from [Kaggle](https://www.kaggle.com/datasets/jackogozaly/pulse-survey-food-insecurity-data). The Kaggle dataset was an aggregation of data from the [United States Census Bureau's Household Pulse Survey](https://www.census.gov/programs-surveys/household-pulse-survey/data.html). 

The US Census Household Pulse Survey is a 20-minute online survey which was designed to collect data on how people's lives have been impacted by the COVID-19 pandemic. Phase 1 of the survey began on April 23, 2020, and subsequent phases followed (it is currently on phase 3.4). The first phase of the survey was disseminated/collected on a weekly basis, while the phases that followed were disseminated/collected using two-week periods. After the data is collected, it is used to calculate estimates for the total number of persons who are over 18 years old and live within housing units (US Census Bureau). For more information on the source of the data and the accuracy of the estimates, the US Census Bureau publishes a "Source and Accuracy Statement" for each phase. The statement for the most recent phase can be found [here](https://www2.census.gov/programs-surveys/demo/technical-documentation/hhp/Phase3-4_Source_and_Accuracy_Week43.pdf). 

The Household Pulse Survey collected information on various topics, one being Food Sufficiency/Food Security. The data used for this project was obtained from the "Food Sufficiency for Households, in the Last 7 Dyas, by Select Characteristics" tables. The data was stored in excel files that contained roughly 67 sheets each. The data was not in a tidy format, and simply showed counts for each food sufficiency reponse per reponse in another category. Because of this, when all of the files were combined into a tidy format, it resulted in a data set where each row represented one response option in one category, rather than representing all of the responses from an individual survey participant. 

To create the visualizations, R was used in RStudio in combination with the ggplot2 package. The code for this project can be found [here](Covid_Food_Security_Script.R). 

## Demographic Groups
<img src="Resources/insecurity_race.png" height="75%" width="75%">    

<img src="Resources/often_insecure_race.png" height="75%" width="75%">     

<img src="Resources/often_insecure_age.png" height="75%" width="75%">     

<img src="Resources/often_insecure_education.png" height="75%" width="75%">     

## Employment
<img src="Resources/covid_income.png" height="75%" width="75%">  

<img src="Resources/income_food.png" height="75%" width="75%">    

<img src="Resources/covid_retire.png" height="75%" width="75%">        

## Mental Health
<img src="Resources/general_anxiety.png" height="75%" width="75%">    

<img src="Resources/food_anxious.png" height="75%" width="75%">

## Limitations


## References
