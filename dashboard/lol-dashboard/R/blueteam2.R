blue_team2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = 'blue_team',
      style = 
        "margin: auto;
      width: 90%;
      text-align: center;
      padding: 5px;",
      
      selectInput(ns("v_blue_heralds"),
                   "Heralds",
                   c("Yes" = 1,
                     "No" = 0)),
      
      numericInput(ns("v_blue_towers_destroyed"),
                   "No of towers destroyed",
                   2,
                   min = 0,
                   max = 10),
      
      numericInput(ns("v_blue_avg_level"),
                   "Average Level",
                   5.2,
                   min = 3,
                   max = 10,
                   step = 0.2),
      
      numericInput(ns("v_blue_cs_per_min"),
                   "CS per Minute",
                   19,
                   min = 5,
                   max = 30))
    
  )
}

blue_team2_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      compiled_blue_team_stat <- reactive({
        tibble(
          "blueHeralds" = input$v_blue_heralds,
          "blueTowersDestroyed" = input$v_blue_towers_destroyed,
          "blueAvgLevel" = input$v_blue_avg_level,
          "blueCSPerMin" = input$v_blue_cs_per_min
        ) %>% 
          mutate(across(everything(), as.integer))
      })
      
      return(compiled_blue_team_stat)
    }
  )
}
