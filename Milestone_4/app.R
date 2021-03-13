#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)

gather_RDS <-readRDS("gather.RDS")

# Define UI for application that draws a barplot
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
    tabPanel("Manipulation", 
             fluidPage(
                 titlePanel("Game Events Bar Plot"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Pick Team",
                             c("Home" = "Home", "Away" = "Away")
                         )),
                     mainPanel(plotOutput("events_plot")))),
             p("The plot above shows the number of each type of event recorded 
             for a soccer game between a Home and an Away Team."),
             ),
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

# Define server logic
server <- function(input, output) {
    output$events_plot <- renderPlot({
        # Generate type based on input$plot_type from ui
        
        ifelse(
            input$plot_type == "Home",
            
            # If input$plot_type is "Home", plot bar graph of home team events
            
            x   <- gather_RDS %>%
                filter(Team == "Home") %>%
                select(Type) %>% 
                count(Type),
            
            # If input$plot_type is "Away", plot bar graph of away team events
            
            x   <- gather_RDS %>%
                filter(Team == "Away") %>%
                select(Type) %>% 
                count(Type)
        )
        
        # Draw the barplot with the specified number of bins
        
        barplot(height = pull(x), names.arg = x$Type, horiz = FALSE,
                col = 'darkgray',
                border = 'black',
                main = "Team Event Data", cex.names = .75)
    })
}
# Run the application 
shinyApp(ui = ui, server = server)
