#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidycensus)
library(tidyverse)


# Define UI for application that draws a histogram
ui <- navbarPage(
    "Soccer Data Science Final Project",
    tabPanel("Discussion",
             titlePanel("Data Sources Discussion"),
             h3("Data Source 1: StatsBomb"),
             p("This is the data source I will be using that has all events 
               data. It has data about competitions, lineups, events (passes,
               shots, tackles, dribbles) and any in match event data. It is yet
               to be determined whether I will need to pay or find some other 
               way to  access the full dataset by obtaining an API."),
             h3("Data Source 2: Metrica Sports"),
             p("This is the data source I will be using that contains position 
               and tracking data of players. The goal currently in my mind 
               for my final project is to emphasize and categorize players into 
               different 'role players'. For that goal, tracking data becomes 
               increasingly important as soccers' players movement and starting 
               position with respect and with or without the ball becomes as 
               paramount as the actions they complete with it that will be 
               recorded in the Statsbomb events dataset. Wyscout also has some 
               interesting data that I could leverage if I'm going to end up 
               getting an API.")),
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("Hello, this is where I talk about my project. I have not completely
             nailed down what I will be doing for my project. However, I would 
             like to use event and tracking data to allow an outsider to be able
             to search the game and visualize what happened. For example, if
             somebody is interested in goals scored. I would make it such that
             you can filter for such an event and specify the time before the 
             goal was scored and visualize the player and ball movements according
             to the tracking data available."),
             h3("About Me"),
             p("My name is Fahad Alkhaja and I study Mechanical Engineering. 
             You can reach me at falkhaja@college.harvard.edu."),
             h3("Repo URL"),
             p("https://github.com/Falkhaja/milestone4_finalproj_Gov_1005.git")))

# Define server logic required to draw a histogram
server <- function(input, output) {
    # I don't think I need to insert anything here
}

# Run the application 
shinyApp(ui = ui, server = server)
