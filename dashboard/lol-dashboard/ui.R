# LIBRARIES ----

# Shiny
library(shiny)
library(shinydashboard)
library(shinyscreenshot)
library(bslib)


# Core
library(tidyverse)
library(tidymodels)
library(glmnet)


source("R/about_page.R")


ui <- navbarPage(
  title = "League of Legends",
  theme = bslib::bs_theme(version = 5, bootswatch = "quartz"),
  tabPanel(
    title = "Dashboard",
    
    fluidRow(
      
      column(
        width = 2,
        blue_team_ui("blue")
      ),
      column(
        width = 2,
        blue_team2_ui("blue1")
      ),
      column(
        width = 4,
        div(
          id = "pres",
          style = "
          margin: auto;
      width: 100%;
      text-align: center;
      padding: 5px
          ",
        h2("Result", align = "center"),
      hr(),
      
      
        
        shinydashboard::valueBoxOutput('v_winner',width = NULL),
        shinydashboard::valueBoxOutput('v_results',width = NULL),
        
        actionButton("v_estimate", 
                     "Predict!",
                     style = "color: black; 
                     background-color: NULL; 
                     position: relative; 
                     text-align:center;
                     border-radius: 6px;"),
      
      img(
        src = 'lol_logo.png',
        align = "center",
        style = "display: block;
                margin-left: auto;
                margin-right: auto;
                width: 80%;"
      ),
      
      actionButton("go", "Take a screenshot",
                   style = "color: #ffffff; 
                             background-color: #ffffff; 
                             border-color: #ffffff;
                   opacity: 0")
      )
      ),
      column(
        width = 2,
        red_team2_ui("red1")
      ),
      column(
        width = 2,
        red_team_ui("red")
      )
    )
  ),
  tabPanel(
    title = "About",
    fluidRow(
      column(
        width = 4,
        div(
          id = "about1",
          style = "
          margin: auto;
      width: 100%;
      text-align: center;
      padding: 5px
          ",
        
        texts$main)
      ),
      column(
        width = 4,
        div(
          id = "about2",
          style = "
          margin: auto;
      width: 100%;
      text-align: center;
      padding: 5px
          ",
       
        texts$ff)
      ),
      column(
        width = 4,
        div(
          id = "about3",
          style = "
          margin: auto;
      width: 100%;
      text-align: center;
      padding: 5px
          ",
        
        texts$dd)
      )
    )
  )
)
