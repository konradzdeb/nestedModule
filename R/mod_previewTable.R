previewUI <-     function(id) {

    ns <- NS(id)

    tabPanel("Summary table",
             column(4, observationSelectorUI(ns("colChooser"))),
             column(8, tableOutput(ns('headTable'))))
}

previewServer <- function(id) {
    moduleServer(id,
                 function(input, output, session) {

                     innerResult <- observationSelectorServer("colChooser")

                     output$headTable <- renderTable(head(mtcars[, innerResult()]))
                 })
}
