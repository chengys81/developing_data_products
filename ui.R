library(shiny)

# Define UI for Species in iris data
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Species in Iris data"),
    
    # Sidebar with controls to select the variable to plot against
    # Species and to specify whether outliers should be included
    sidebarLayout(
        sidebarPanel(
            selectInput("variable", "Variable:",
                        c("Sepal Length" = "Sepal.Length",
                          "Sepal Width" = "Sepal.Width",
                          "Petal Length" = "Petal.Length",
                          "Petal Width" = "Petal.Width")),
            
            checkboxInput("outliers", "Show outliers", FALSE)
        ),
        
        # Show the caption and plot of the requested variable against
        # Species
        mainPanel(
            h3(textOutput("caption")),
            
            plotOutput("irisPlot")
        )
    )
))