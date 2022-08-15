red_team2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = 'blue_team',
      style = 
        "margin: auto;
      width: 90%;
      text-align: center;
      padding: 5px;",
    
      selectInput(ns("v_red_heralds"),
                 "Heralds",
                 c("Yes" = 1,
                   "No" = 0)),
    
    numericInput(ns("v_red_towers_destroyed"),
                 "No of towers destroyed",
                 1,
                 min = 0,
                 max = 5),
    
    numericInput(ns("v_red_avg_level"),
                 "Average Level",
                 5,
                 min = 3,
                 max = 10,
                 step = 0.2),
    
    numericInput(ns("v_red_cs_per_min"),
                 "CS per Minute",
                 15.2,
                 min = 10,
                 max = 30,
                 step = 0.1))
    
    
  )
}

red_team2_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      compiled_red_team_stat <- reactive({
        tibble(
          "redHeralds" = input$v_red_heralds,
          "redTowersDestroyed" = input$v_red_towers_destroyed,
          "redAvgLevel" = input$v_red_avg_level,
          "redCSPerMin" = input$v_red_cs_per_min
        ) %>% 
          mutate(across(everything(), as.integer))
      })
      
      return(compiled_red_team_stat)
    }
  )
}
