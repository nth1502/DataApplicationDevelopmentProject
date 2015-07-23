Australian Life table 2011-2013 data  apps  
========================================================
author: Trung-Hieu Nguyen
date: 23/07/2015

What is life table?
========================================================
In actuarial science and demography, a life table (also called a mortality table or actuarial table) is a table which shows, for each age, what the probability is that a person of that age will die before his or her next birthday ("probability of death").

- lx : number of persons surviving to exact age x. 

- qx : proportion of persons dying between exact age x and exact age x+1.

- Lx : number of person years lived within the age interval x to x+1.

- ex : expectation of life at exact age x. 


Why actuarial data application?
========================================================
- Actuarial students constantly  needs references to data for hand calculation.

- Mortality rates can be best demonstrated with visual graphing to explain certain demographic properties.

- Actuarial science is a science of data, number, statistic, probabilities. Technology (such as these data app) gives it an edge.

- Plenty of actuaries are into spreadsheets , very few would go for R (even SAS) despite its powerful capacity >>> need a  greater push.

Ui.R inputs
========================================================
- The application's outlay includes a sidebar for inputs and main panel for outputs
- The input includes 
1. Dropdown for State selection
2. Box for entering age.
3. Tick choice for gender.
4. Check boxes to choose interested infmation for display.

Ui.R outputs
========================================================
3 tabs in main panel for output:

1. About tab: brief introduction of the application

2. Result tab: display interested data and an interactive plot of qx

3. Life table tab: display a filtered data.

server.R
========================================================
-First load the ABS excel files and create 10 data files.

-Depend on input of state and gender, certain file will be drawn to filter with function in helpers.R .

-Render tables and plots accordingly.

helpers.R
========================================================
-helpers.R  contains functions that is sourced into server.R

-functions in helpers.R:

1. gettable(state, gender): filter the data upon state and gender inputs and properly names rows and columns for display.

2. extractdata(state,gender,age,info): a step further than gettable. Extract columns and a row from gettable()

3. plotqx(state, gender): take all qx column data of gettable() and plot an interactive plot. When hovering over the exact data will appear next to the dot of the plot.





