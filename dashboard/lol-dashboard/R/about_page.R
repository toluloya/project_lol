get_pred <- function(model, df, winner) {
  probs <- predict(model, df, "prob")
  
  if (winner == "Blue Team Wins") {
    probs %>%
      select(.pred_1) %>%
      mutate(.pred_1 = round(.pred_1 * 100, 1)) %>%
      pull()
  } else {
    probs %>%
      select(.pred_0) %>%
      mutate(.pred_0 = round(.pred_0 * 100, 1)) %>%
      pull()
    
  }
  
  
}

get_winner <- function(model, df) {
  predict(model, df) %>% 
    mutate(.pred_class = ifelse(.pred_class == 1, "Blue Team Wins", "Red Team Wins")) %>% 
    pull()
  
}

lr_model <- readr::read_rds("R/lr_model.rds")

texts <- list(
  main = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer 
  elementum, magna id lacinia interdum, tellus justo tristique leo, 
  id interdum ante dui et turpis. Donec tempus, eros at ultrices efficitur,
  nisl libero blandit erat, vel commodo ligula risus id urna. Nulla eros ex,
  pellentesque vel risus eget, suscipit sodales metus. Pellentesque sit amet
  mollis enim. Vivamus sit amet magna enim. Suspendisse pulvinar neque vitae
  sodales congue. Sed et mi pellentesque, volutpat purus eget, euismod ante.
  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per 
  inceptos himenaeos. Maecenas pretium neque a mollis euismod.",
  
 ff =  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer 
  elementum, magna id lacinia interdum, tellus justo tristique leo, 
  id interdum ante dui et turpis. Donec tempus, eros at ultrices efficitur,
  nisl libero blandit erat, vel commodo ligula risus id urna. Nulla eros ex,
  pellentesque vel risus eget, suscipit sodales metus. Pellentesque sit amet
  mollis enim. Vivamus sit amet magna enim. Suspendisse pulvinar neque vitae
  sodales congue. Sed et mi pellentesque, volutpat purus eget, euismod ante.
  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per 
  inceptos himenaeos. Maecenas pretium neque a mollis euismod.",
  
  dd = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer 
  elementum, magna id lacinia interdum, tellus justo tristique leo, 
  id interdum ante dui et turpis. Donec tempus, eros at ultrices efficitur,
  nisl libero blandit erat, vel commodo ligula risus id urna. Nulla eros ex,
  pellentesque vel risus eget, suscipit sodales metus. Pellentesque sit amet
  mollis enim. Vivamus sit amet magna enim. Suspendisse pulvinar neque vitae
  sodales congue. Sed et mi pellentesque, volutpat purus eget, euismod ante.
  Class aptent taciti sociosqu ad litora torquent per conubia nostra, per 
  inceptos himenaeos. Maecenas pretium neque a mollis euismod."
  

)

#border: 2px solid blue;
