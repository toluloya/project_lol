#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  blue_team <- blue_team_server("blue")
  blue_team_2 <- blue_team2_server("blue1")

  red_team <- red_team_server("red")
  red_team_2 <- red_team2_server("red1")
  
  observeEvent(input$go, {
    screenshot()
  })
  
  winner <- reactive({
    #game_stat <-
    
    get_winner(lr_model, bind_cols(blue_team(), blue_team_2(),red_team(),red_team_2()))
  }) %>%
    bindEvent(input$v_estimate)

  res <- reactive({
    #game_stat <-
    req(winner())

    get_pred(lr_model,
             bind_cols(blue_team(), blue_team_2(),red_team(),red_team_2()),
             winner())
  }) %>%
    bindEvent(input$v_estimate)
  


  # output$v_results <- renderText({
  #   res()
  # })
  
  
  output$v_winner <-
    shinydashboard::renderValueBox({
      valueBox(
        value = winner(),
        subtitle = em(paste0("With a ",res(),"% chance")),
        width = 12,
        color = "red"
      )
    })
  
  # output$v_results <-
  #   shinydashboard::renderValueBox({
  #     valueBox(
  #       subtitle = ,
  #        value = NULL,
  #       width = 12
  #     )
  #   })
  
  output$table <- renderTable({
    bind_cols(blue_team(), red_team())  %>% 
      pivot_longer(cols = everything())
  })
})
