library(shiny)
library(datasets)
data(iris)

# Define server logic required to plot various variables against
# Species
shinyServer(function(input, output) {
    
    # Compute the formula text in a reactive expression 
    formulaText <- reactive({
        paste(input$variable, "~ Species")
    })
    
    pval <- reactive({
        a <- summary(aov(as.formula(paste(input$variable, "~ Species")), data=iris))
        a[[1]][1,5]
    })
    
    # generate a caption
    output$caption <- renderText({
        paste("Species vs", input$variable, ", p-value =", pval())
    })
    
    # Generate a plot of the requested variable against Species and
    # only include outliers if requested
    output$irisPlot <- renderPlot({
        plot(as.formula(formulaText()),
                data = iris,
                outline = input$outliers)
    })
})