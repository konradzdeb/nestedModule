summaryUI <- function(id) {

    ns <- NS(id)

    tabPanel("Summary table",
             column(4, observationSelectorUI(ns("colChooser"))),
             column(8, tableOutput(ns('summaryTable'))))
}

summaryServer <- function(id) {
    moduleServer(id,
                 function(input, output, session) {

                     inner_result <- observationSelectorServer("colChooser")

                     output$summaryTable <- renderTable(summary(mtcars[, inner_result()]))
                 })
}
