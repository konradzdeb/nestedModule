previewUI <-     function(id) {
    ns <- NS(id)
    tabPanel("Summary table",
             column(4, observationSelectorUI(ns("colChooser"))),
             column(8, tableOutput(ns('headTable'))))
}
