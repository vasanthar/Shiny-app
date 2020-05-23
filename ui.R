library(shiny)

# Define UI for application exploring mtcars dataset
shinyUI(pageWithSidebar(

    # Application title
    titlePanel("Analysing airquality data - Ozone levels"),

    # Sidebar with a slider input for number of bins
        sidebarPanel(
            
            # histogram with bins defined using slider input
            sliderInput("bins", "Number of bins for the Ozone data:", min = 5, max = 150, value = 80),
            
            # radio buttons for selecting the x axis for the plot
            radioButtons("s", "Plot Ozone vs selected environmental parameter, Select X-axis:", list("Solar Radiation"=2, "Wind"=3, "Temp"=4), selected = 4),
            
            # If the user wants a regression model fitted to the plotted data
            checkboxInput('lmmodel', "Show model fitting", value = TRUE),
            
            # temperature prediction 
            sliderInput('text1', 'What is the temperature for which you would like to predict Ozone levels?', 50, 100, value = 80), 
            
        ),  
            
    # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Histogram",  br(), h5("Choose number of bins for the histogram from the side panel"), plotOutput("distPlot")),
                        tabPanel("Parameters", br(), h5("Choose the parameter that you wish to plot against Ozone and whether regression model should be fitted to the plot"), br(), h4('Effect of environmental variables on Ozone levels', align = 'center'), plotOutput("Ozone")),
                        tabPanel("Prediction", br(), h5("Choose the value of temperaure for which you would like to predict Ozone levels"), br(), h4('Predicted Ozone level for the selected temperaure value'), textOutput("prediction"))
            ))
    )
)
