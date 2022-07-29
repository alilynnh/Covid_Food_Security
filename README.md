# Food Insecurity During the COVID-19 Pandemic
## :red_circle: Work In Progress :red_circle:

## Project Overview
### Background
Food insecurity can be defined as a lack of consistent access to adequate and nutritious food that meets the dietary needs and food preferences of an individual (Niles et al., 2020). Food insecurity can lead to serious negative health outcomes such as diabetes, high blood pressure, heart disease, and mental health challenges (Niles et al., 2020). Trends in food insecurity tend to parallel trends in unemployment, poverty, and food prices (Niles et al., 2020). The COVID-19 pandemic and the subsequent social distancing efforts have caused disruption in food systems which has had serious food security implications (Fitzpatrick et al., 2020; Niles et al., 2020). The purpose of the current project was to explore trends in food insecurity during the COVID-19 pandemic, as well as gather research on the topic. 

### Data and Tools
The data used for the visualizations in this project was obtained from [Kaggle](https://www.kaggle.com/datasets/jackogozaly/pulse-survey-food-insecurity-data). The Kaggle dataset was an aggregation of data from the [United States Census Bureau's Household Pulse Survey](https://www.census.gov/programs-surveys/household-pulse-survey/data.html). 

The US Census Household Pulse Survey is a 20-minute online survey which was designed to collect data on how people's lives have been impacted by the COVID-19 pandemic. Phase 1 of the survey began on April 23, 2020, and subsequent phases followed (it is currently on phase 3.4). The first phase of the survey was disseminated/collected on a weekly basis, while the phases that followed were disseminated/collected using two-week periods. After the data is collected, it is used to calculate estimates for the total number of persons who are over 18 years old and live within housing units (US Census Bureau). For more information on the source of the data and the accuracy of the estimates, the US Census Bureau publishes a "Source and Accuracy Statement" for each phase. The statement for the most recent phase can be found [here](https://www2.census.gov/programs-surveys/demo/technical-documentation/hhp/Phase3-4_Source_and_Accuracy_Week43.pdf). 

The Household Pulse Survey collected information on various topics, one being Food Sufficiency/Food Security. The data used for this project was obtained from the "Food Sufficiency for Households, in the Last 7 Dyas, by Select Characteristics" tables. The data was stored in excel files that contained roughly 67 sheets each. The data was not in a tidy format, and simply showed counts for each food sufficiency reponse per reponse in another category. Because of this, when all of the files were combined into a tidy format, it resulted in a data set where each row represented one response option in one category, rather than representing all of the responses from an individual survey participant. While the survey is still ongoing, the data that was merged to form the Kaggle dataset spans from April 4, 2020 to August 23, 2021.

To create the visualizations, R was used in RStudio in combination with the ggplot2 package. The code for this project can be found [here](Covid_Food_Security_Script.R). 

## Demographics
Previous analyses provide evidence to the fact that food insecurity is not evenly spread throughout the country or across racial and ethnic groups (Fitzpatrick et al., 2020). For example, prior to the COVID-19 pandemic, wide disparities in food insecurity already existed, with elevated rates for poor households, households with children, single-parent households, people living alone, and Black- and Hispanic-headed households (Fitzpatrick et al., 2020). Fitzpatrick et al. (2020) point out that it is important to pay special attention to these vulnerable groups, as these disparities may have widended during the current pandemic. In the study done by Fitzpatrick et al. (2020), it was found that adult food insecurity in the United States had become significantly elevated during the pandemic, and that individuals who are low income, parents, and Black and/or Hispanic had a higher prevalence of food insecurity. In addition, results obtained by Lauren et al. (2021) suggest that the pandemic has indeed worsened existing societal inequalities. 

### Race
The first visualization charts the percent of repondents in various racial groups who reported that they either *sometimes* did not have enough to eat or *often* did not have enough to eat. From the chart, it is evident the rate of food insecurity was highest in the Black, Hispanic, or multiracial/other groups.    

<img src="Resources/insecurity_race.png" height="75%" width="75%">    

To try to more easily visualize differences in the racial groups and to examine the most severe cases of food insecurity, the next visual charts only the percent of repondents who reported that they *often* did not have enough to eat. The disparities between the racial groups are still prevalent, but somewhat less so than the previous graph.  

<img src="Resources/often_insecure_race.png" height="75%" width="75%">  

### Age 
In addition to exploring disparities in food insecurity rates among racial groups, it may also be beneficial to determine which age ranges may be the most at risk for food insecurity. The following graph presents the percentage of individuals in various age groups who responded that they often do not have enough to eat. It appears that the age ranges with the highest prevalences of food insecurity are 25-39 and 40-54 years old. This may be due to the fact that individuals in these age ranges may be more likely to be caring for children than the other age groups, and as discussed earlier, households with children have elevated rates of food insecurity.    

<img src="Resources/often_insecure_age.png" height="75%" width="75%">     

### Education
The following graph presents the percentage of individuals with various education levels who responded that they often do not have enough to eat. Those that have less than a high school degree have significantly higher rates of food insecurity than other education levels. It's been found that those who do not complete high school have the lowest average earnings (U.S. Bureau of Labor Statistics, 2020; U.S. Census Bureau, 1999) and have the highest rate of unemployment (U.S. Bureau of Labor Statistics, 2020) when compared to higher education levels. In addition, when looking at various occupations and the distribution of educational attainment within each, the highest rate of those with less than a high school degree occured the following fields: a.) natural resouces, construction, and maintenance, b.) service occupations, and c.) production, transportation, and material moving. In a study done by the principal economist at Gallup, it was found that these occupationns were some of the hardest hit by the pandemic based on layoffs, reduction in hours, and reduction in pay (Rothwell, 2020). Combining these facts with the fact that households with lower incomes are more likely to experience food insecurity (De Marco & Thornburn, 2009), it makes sense that individuals with the lowest levels of educational attainment would have higher rates of food insecurity. 

<img src="Resources/often_insecure_education.png" height="75%" width="75%">     

### Employment
The following graph presents the number of individuals in various income levels. There is a general downward trend in all of the groups, with the lowest income levels seeing the steepest decline. These declines are likely due to the mass unemployment casued by COVID-19 (Faria-e-Castro, 2021). According to a study done by Raifman et al. (2021), 48.3% of adults who were living in households earning less than $75,000/year and were employed in February of 2020 experienced unemployment during the COVID-19 pandemic. In addition, the number of new unemployment claims during the three weeks between March 22 and April 11, 2020 was over 22 million (Enriquez & Goldstein, 2020). To put this into perspective, this loss is roughly equal to the net job gains during the 10 year long expansion following the 2008 recession (Enriquez & Goldstein, 2020). Apart from becoming unemployed due to layoffs (Rothwell, 2020), it is likely that many individuals left the workforce due to health reasons or to care for family members (Faria-e-Castro, 2021). Retirements may also make up part of the decline in the data. According to Faria-e-Castro (2021), there has been a retirement "boom" during COVID-19. In other words, the actual percentage of retirements during covid exceeds the predicted percentage of Baby Boomer retirements, with the number of excess retirements due to COVID-19 exceeding 2.4 million (Faria-e-Castro, 2021). 

<img src="Resources/covid_income.png" height="75%" width="75%">  

It is also important to look at the rate of food insecurity among the various income levels. The following graph presents the percentage of individuals with various income levels who responded that they often do not have enough to eat. It is clear that the lower income levels have higher rates of food insecurity. Many studies have established that there is an inverse relationship between income and food insecurity (De Marco & Thorburn, 2009). For example, as a household poverty index ratio or income-to-poverty ratio increases, food insecurity decreases (De Marco & Thorburn, 2009). In the United States, households that allocate a larger portion of their income to food are affected the most by economic shocks, and previous studies of Mexican households have found that severe economic crises that result in reduced food security have a larger affect on lower income households (Gaitan-Rossi et al., 2020). Therefore, it is not suprising that during COVID-19, lower income levels suffered from food insecurity the most.  

<img src="Resources/income_food.png" height="75%" width="75%">       

## Mental Health
<img src="Resources/general_anxiety.png" height="75%" width="75%">    

<img src="Resources/food_anxious.png" height="75%" width="75%">    

<img src="Resources/depression.png" height="75%" width="75%">    

<img src="Resources/food_depression.png" height="75%" width="75%">    

## General Discussion
Most graphs exhibit a disruption in the overall directions of the lines both in the beginning of the pandemic as well as around January 2021. This January spike may be due to a surge in COVID-19 cases that happened during that time, which may have led to various food sources being closed/inaccessible.

*The image below was obtained from [Our World in Data](https://ourworldindata.org/covid-cases).
<img src="Resources/coronavirus-data-explorer.png" height="75%" width="75%">  

## Limitations


## Need Help? 
Do you need help getting food? If so, clicking on the link below will take you to the Feeding America food bank locator.

Feeding America Food Bank Locator : https://www.feedingamerica.org/need-help-find-food

From the Feeding America Website: 
> Even if a food bank looks far away, they can help you find food closer to home. Search by zip code or state using the food bank locator, and contact the food bank that serves your area.

>Food assistance is free, comfortable, and confidential. However, you may need to complete some paperwork when you check-in.

>Low or no contact options are also available in many areas, including seniors-only hours, drive-through pantries, expanded home delivery services, and more.

## References
