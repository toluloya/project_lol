blue_team_ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      id = 'blue_team',
      style = 
        "margin: auto;
      width: 90%;
      text-align: center;
      padding: 5px;",
      
    
    numericInput(ns("v_blue_wards_placed"),
                 "Wards Placed",
                 30,
                 min = 5,
                 max = 250),
    
    numericInput(ns("v_blue_wards_destroyed"),
                 "Wards Destroyed",
                 15,
                 min = 0,
                 max = 30),
    
    selectInput(ns("v_blue_dragons"),
                 "Dragons",
                c("Yes" = 1,
                  "No" = 0)),
    
    numericInput(ns("v_blue_assists"),
                 "No of Assists",
                 15,
                 min = 0,
                 max = 30),
    hr(),
    
    selectInput(ns("v_winning"),
                "Team with More Exp",
                c("Blue team" = 1,
                  "Red team" = 0)))
  
  )
}

blue_team_server <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      compiled_blue_team_stat <- reactive({
        tibble(
          "blueWardsPlaced" = input$v_blue_wards_placed,
          "blueWardsDestroyed" = input$v_blue_wards_destroyed,
          "blueAssists" = input$v_blue_assists,
          "blueDragons" = input$v_blue_dragons,
          "winning" = input$v_winning
        ) %>% 
          mutate(across(everything(), as.integer))
      })
      
      return(compiled_blue_team_stat)
    }
  )
}
