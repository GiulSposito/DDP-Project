library(shiny)
library(ggplot2)
library(ggthemes)
data(mtcars)


# converting some columns to factors
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$vs <- as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)

shinyServer(
  function(input,output){   
    output$plot <- renderPlot({
      x_name <- input$x
      y_name <- input$y
      group_name <- input$groupBy
      g <- ggplot(mtcars, aes_string(x=x_name, y=y_name)) + geom_point(size=5) 
      g <- g   + theme_solarized()
      if (group_name!="none") g <- g + aes_string(col=group_name)
      if (input$lm) g <- g + geom_smooth(method="lm")
      if (group_name!="none" & input$facet) g <- g + facet_wrap(as.formula(paste("~", group_name)))
      g
    })
  }
)





