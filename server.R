library(shiny)
shinyServer(function(input, output) {
        
        # plotting the histogram
        output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- airquality[, 2]
        bins <- seq(as.integer(min(x, na.rm = T)), as.integer(max(x, na.rm = T)), length.out = input$bins + 1)
        # draw histogram with specified number of bins
        hist(x, breaks = bins, main = "Histogram of Ozone")
        })
        
        # plotting ozone data with respect to selected X label
        output$Ozone <- renderPlot({
            airquality <- na.omit(airquality) # removing na data
            i <- as.numeric(input$s)
            plot(x = airquality[,i], y = airquality[,1], ylab = "Ozone", xlab = colnames(airquality)[i])
            # Fit a regression line if check box is true 
            if(input$lmmodel){
            abline(lm(airquality[,1]~airquality[,i]), col = 'red', lwd = 2)}
        })
        
        # predicting the ozone value for the selected temperaure data
        output$prediction <- reactive({
            airquality <- na.omit(airquality)
            model1 <- lm(airquality[,1]~ airquality[,4])
            as.numeric(model1$coefficients[1] + model1$coefficients[2] * as.numeric(input$text1))
        })
        
    })

