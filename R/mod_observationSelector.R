observationSelectorUI <- function(id) {
    ns <- NS(id)
    fluidPage(
        selectInput(
            inputId = ns("varTypes"),
            label = h3("Variable types"),
            choices = list("Integer" = TRUE,
                           "Real" = FALSE),
            selectize = FALSE,
            multiple = FALSE
        ),

        selectInput(
            inputId = ns("selectColumn"),
            label = h4("Selected Column"),
            choices = character(0)
        )
    )
}

observationSelectorServer <- function(id, data) {
    moduleServer(id,
                 function(input, output, session) {
                     observeEvent(eventExpr = input$varTypes,
                                  handlerExpr = {
                                      all_cols <- map_lgl(.x = mtcars, ~ all(. %% 1 == 0))
                                      selected_cols <-
                                          names(all_cols[all_cols == input$varTypes])
                                      updateSelectInput(
                                          session = session,
                                          inputId = "selectColumn",
                                          label = paste(
                                              "Selected",
                                              ifelse(input$varTypes, "integer", "real"),
                                              "columns"
                                          ),
                                          choices = selected_cols
                                      )
                                  })

                     # reactive(input$selectColumn)
                 })
}
