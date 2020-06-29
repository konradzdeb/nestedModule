library("shiny")
library("tidyverse")


ui <- fluidPage(titlePanel("Nested Modules"),
                tabsetPanel(summaryUI("modsmry"), previewUI("previewUI")))

# Define server logic required to draw a histogram
server <- function(input, output) {
    summaryUI("modsmry")
}

# Run the application
shinyApp(ui = ui, server = server)
