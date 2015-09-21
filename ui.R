# setup
library(shiny)

# dividing options according column type, the numeric ones will be options on select
# the factors one will be options at checkboxes
numAxis <- c("mpg","disp","hp","drat","wt","qsec")
facData <- c("none","cyl","vs","am","gear","carb")

# User interface
shinyUI(
  
  # fluid page to use bootstrap's css
  fluidPage(
    
    # customizing look-and-feel
    theme="bootstrap.min.css",
    
    #app title
    headerPanel("Basic MTCars and GGPlot Explorer"),
    
    #side panel with chart parameters
    sidebarPanel(
      
      h3("Parameters"),
      selectInput("x","X Axis", numAxis),
      selectInput("y","Y Axis", numAxis),
      radioButtons("groupBy","Group by", facData),
      
      # this is condicional, will appear only if 'group by' is checked
      conditionalPanel(
        condition="input.groupBy!='none'",
        
        #show a option to 'facet' the chart
        checkboxInput("facet","Use facets")
      ),    
      
      checkboxInput("lm","Plot Linear Regression")
      
    ), #sideBarPanel
    
    # main panel
    mainPanel(
      # will be tabbed
      tabsetPanel(
        
        tabPanel("Chart", 
          h3("Graphic Panel"),
          plotOutput("plot")       
        ),
        
        tabPanel("About",
          h3(img(src="logo_small.png"),"About this App"),
          p(
            "This is a simple demonstrative ", a("Shiny App", href="http://shiny.rstudio.com/") ,
            ", made for the project of", a("Developing Data Product",href="https://www.coursera.org/course/devdataprod"), 
            " course, part of ", a("Data Science Specialization ", href="https://www.coursera.org/specializations/jhudatascience"),
            "  offered by ", a("John Hopkins Bloomberg School of Plublic Health", href="http://www.jhsph.edu/"),
            " at ", a("Coursera", href="http://www.coursera.org"), "."
            ),
          p(
            "This app loads the ",a("MTCars", href="https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html")," (",em("Motor Trend Car Road Tests"),") dataset and allow you to plot, using ",a("GGPlot2", href="http://ggplot2.org/"),", any numeric dimention agains another numeric dimension.",
            "Its possible too, choose a factor dimention to group the data points, and also, show a linear model fitted in the chart itself.",
            "The application dynimic handle the options in the, ", strong("Parameter Panel")," to plot the chart in the ", strong("Chart Panel"), "."
            ),
          h4("Usage:"),
          tags$ol(
            tags$li(strong("X Axis"),": defines what (numeric) feature, from ", em("MTCars")," will be used as X variable."),
            tags$li(strong("Y Axis"),": defines what (numeric) feature, from ", em("MTCars")," will be used as Y variable."),
            tags$li(strong("Group by"),": defines what (factor) feature, from ", em("MTCars")," will grouped by, choose ",em("none")," to not agroup."),
            tags$li(strong("Use Facets"),": tells to GGPPlot chart divide the data points in facets, according the ",em("Group By"), " option. This field only appears if the group by options isn't ", em("none"), "."),
            tags$li(strong("Plot Linear Regression"),": tells to GGPPlot chart to add an line representing the linear regression of the datasets.")
          ),
          p(
            "The app source code can be found at ", a("https://github.com/GiulSposito/DDP-Project",href="https://github.com/GiulSposito/DDP-Project"),
            " and the you can find a simple explanation about the code at ", 
            a("giulsposito.github.io/DDP-Slidify", href="http://giulsposito.github.io/DDP-Slidify"),"."
          )
          )       
      ) #tabsetPanel
    ) #mainPanel
  ) #fluidPage
) #shinyUi
