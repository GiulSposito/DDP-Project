Basic MTCars and GGPlot Explorer
===

This is a simple demonstrative [Shiny App](http://shiny.rstudio.com/), made for the project of Developing Data Product course, part of [Data Science Specialization](https://www.coursera.org/specializations/jhudatascience) offered by John Hopkins Bloomberg School of Plublic Health at [Coursera](http://www.coursera.org).

This app loads the [MTCars](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html) (*Motor Trend Car Road Tests*) dataset and allow you to plot, using `GGPlot2`, any numeric dimention agains another numeric dimension. Its possible too, choose a factor dimention to group the data points, and also, show a linear model fitted in the chart itself. The application dynimic handle the options in the, Parameter Panel to plot the chart in the Chart Panel .

Usage:

1. Fork this repo
1. Clone to you local computer
1. Start a `R` session, set the working dir for the files directory (`setwd()`)
1. type `runApp()`

Application:

- **X Axis** : defines what (numeric) feature, from MTCars will be used as X variable.
- **Y Axis** : defines what (numeric) feature, from MTCars will be used as Y variable.
- **Group by** : defines what (factor) feature, from MTCars will grouped by, choose none to not agroup.
- **Use Facets** : tells to GGPPlot chart divide the data points in facets, according the Group By option. This field only appears if the group by options isn't none .
- **Plot Linear Regression** : tells to GGPPlot chart to add an line representing the linear regression of the datasets.

The app source code can be found at https://github.com/GiulSposito/DDP-Project and the you can find a simple explanation about the code at https://giulsposito.github.io/DDP-Slidify .
