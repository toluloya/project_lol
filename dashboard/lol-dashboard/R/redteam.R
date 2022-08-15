red_team_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = 'blue_team',
      style = 
        "margin: auto;
      width: 90%;
      text-align: center;
      padding: 5px;",
    
    numericInput(ns("v_red_wards_placed"),
                 "Wards Placed",
                 100,
                 min = 5,
                 max = 300),
    
    numericInput(ns("v_red_wards_destroyed"),
                 "Wards Destroyed",
                 15,
                 min = 0,
                 max = 30),
    
    selectInput(ns("v_red_dragons"),
                 "Dragons",
                 c("Yes" = 1,
                   "No" = 0)),
    
    numericInput(ns("v_red_assists"),
                 "No of Assists",
                 15,
                 min = 0,
                 max = 30),
    hr(),
    
    selectInput(ns("v_first_blood"),
                "First blood",
                c("Blue team" = 1,
                  "Red team" = 0)))
    
    
  )
}

red_team_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      compiled_red_team_stat <- reactive({
        tibble(
          "redWardsPlaced" = input$v_red_wards_placed,
          "redWardsDestroyed" = input$v_red_wards_destroyed,
          "redAssists" = input$v_red_assists,
          "redDragons" = input$v_red_dragons,
          "blueFirstBlood" = input$v_first_blood
        ) %>% 
          mutate(across(everything(), as.integer))
      })
      
      return(compiled_red_team_stat)
    }
  )
}
