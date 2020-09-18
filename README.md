![FOWT](https://github.com/MontseSacie/Machine-Learning-and-Big-Data/blob/master/imagenes_tfg/ini.jpg)

# Machine Learning Applied to Wind and Waves Modelling
In this repository it is shared the code of the bachelor's degree final project in Software Engineering:

**Machine Learning applied to Wind and Waves Modelling**

## Contents
The repository is structured in three folders:
- **EDA and Data cleaning** contains .m files needed during the developing of **Data loading, Exploratory Data Analysis and Data cleaning phases**. Here is included the code for:
    - Data loading from the web page of NOAA
    - Variables analysis and plots visualization, 
    - Correlation analysis implementation and 
    - Data cleaning; which include missing values detection and deletion as well as outliers deletion.

- **Features selection and extraction** contains the calculation of F-test score for measuring the significance of the variables as well as .m files for data combination that let us obtain the data sets used during the Training phase.

- **Models evaluation** contain a main file .mlx where we test the trained models with data from 2019 and 2020 (Real Time) and we plot "responses vs predicted" plot. We include also two of the files for two concrete models (as examples) used to plot the Learning Curves to evaluate models.

## Web page of the national reasearch project with which we are collaborating
- [pagina web del proyecto](http://www.floatingwindturbineucm.com/)

## Used technologies 
Before executing the code, install:
 - [Matlab](https://es.mathworks.com/downloads/)
 - [CircStat toolbox](https://es.mathworks.com/matlabcentral/fileexchange/10676-circular-statistics-toolbox-directional-statistics)
 
 And install from Matlab apps manager:
 
 - [Regression learner toolbox](https://es.mathworks.com/help/stats/regression-learner-app.html)
 - [Neural Net time series toolbox](https://es.mathworks.com/help/deeplearning/ref/neuralnettimeseries-app.html)
 - [Neural Net fitting toolbox](https://es.mathworks.com/help/deeplearning/ref/nftool.html)
 
![ucm](https://github.com/MontseSacie/Machine-Learning-and-Big-Data/blob/master/imagenes_tfg/LOGODOBLE.jpg)
