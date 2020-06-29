library("shiny")
library("tidyverse")


ui <- fluidPage(


    titlePanel("Nested Modules"),
    observationSelectorUI("colChooser")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    observationSelectorServer("colChooser")
}

# Run the application
shinyApp(ui = ui, server = server)
