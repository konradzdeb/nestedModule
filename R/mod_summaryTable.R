summaryUI <- function(id) {
    ns <- NS(id)
    tabPanel("Summary table",
             column(4, observationSelectorUI(ns("colChooser"))),
             column(8, tableOutput(ns('summaryTable'))))
}

summaryServer <- function(id) {
    moduleServer(id,
                 function(input, output, session) {
                     output$summaryTable <- renderTable(summary(mtcars[, input$selectColumn]))
                 })
}
