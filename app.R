library("shiny")
library("tidyverse")


ui <- fluidPage(titlePanel("Nested Modules"),
                tabsetPanel(summaryUI("modSummary"),
                            previewUI("modPreview")))

# Define server logic required to draw a histogram
server <- function(input, output) {
    summaryServer("modSummary")
    previewServer("modPreview")
}

# Run the application
shinyApp(ui = ui, server = server)
