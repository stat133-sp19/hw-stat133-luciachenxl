library(shiny)
library(ggplot2)
future_value <- function(amount, rate, years){
  FV = amount * (1 + rate) ^ years
  return(FV)
}

annuity <- function(contrib, rate, years){
  FVA = contrib * (((1 + rate) ^ years -1) / rate)
  return(FVA)
}

growing_annuity <- function(contrib, rate, growth, years){
  FVGA = contrib * (((1 + rate) ^ years - (1 + growth) ^ years) / (rate - growth))
  return(FVGA)
}
# Define UI for application that draws a histogram

ui <- fluidPage(
  
  # Application title
  titlePanel("Investment Models"),
  
  # Sidebar with a slider input for number of bins 
  fluidRow(
    column(4,
           sliderInput("initial",
                       "Initial Amount",
                       min = 1,
                       max = 100000,
                       value =1000),
           sliderInput("contrib",
                       "Annual Contribution",
                       min=0,
                       max=50000,
                       value=2000)
    ),
    column(4,
           sliderInput("rrate",
                       "Return Rate (in %)",
                       min = 0,
                       max = 20,
                       value =5,step=2),
           sliderInput("grate",
                       "Growth Rate (in %)",
                       min=0,
                       max=20,
                       value=2,step=5)
    ),
    column(4,
           sliderInput("years",
                       "Years",
                       min=0,
                       max=50,
                       value=10),
           selectInput("select", label = h3("Facet?"), 
                       choices = list("No" = 1, "Yes" = 2), 
                       selected = 1),
           
           hr(),
           fluidRow(column(2, verbatimTextOutput("value")))
           
    ),
    mainPanel(
      titlePanel("Timeline"),
      plotOutput("distPlot"),
      titlePanel("Balance"),
      tableOutput("view")
    )
  )
)

server <- function(input, output) {
  
  output$distPlot <- renderPlot(width=900,{
    
    no_contrib = rep(input$initial, input$years)
    for (i in 1:input$years) {
      no_contrib[i+1] = future_value(amount = no_contrib[i], rate = input$rrate*0.01, years = 1)
    }
    
    fixed_contrib = rep(input$initial, input$years)
    for (i in 1:input$years) {
      fixed_contrib[i+1] = future_value(amount = input$initial, rate = input$rrate*0.01, years = i) + annuity(contrib = input$contrib, rate = input$rrate*0.01, years = i)
    }
    
    growing_contrib = rep(input$initial, input$years)
    for (i in 1:input$years) {
      growing_contrib[i+1] = future_value(amount = input$initial, rate = input$rrate*0.01, years = i) + growing_annuity(contrib = input$contrib, rate = input$rrate*0.01, growth = input$grate*0.01, years = i)
    }
    
    modalities = data.frame(
      year = c(0:input$years),
      value = c(no_contrib = no_contrib,
                fixed_contrib = fixed_contrib,
                growing_contrib = growing_contrib),
      modality = c(rep("no_contrib", input$years+1), 
                   rep("fixed_contrib", input$years+1),
                   rep("growing_contrib", input$years+1)
      ))
    
    if(input$select==1){
      ggplot(data = modalities)+
        geom_line(aes(x = year, y = value, color = modality)) +
        geom_point(aes(x = year,  y = value, color = modality), cex = 0.5)+
        labs(x="years",y="balance",title="3 models of investing")
    }else{
      modalities$modality_f<-factor(modalities$modality,levels=c("no_contrib","fixed_contrib","growing_contrib"))
      ggplot(data = modalities)+
        geom_line(aes(x = year, y = value, color = modality)) +
        geom_point(aes(x = year,  y = value, color = modality), cex = 0.5)+
        labs(x="years",y="balance",title="3 models of investing")+
        geom_area(aes(x= year,y=value,fill=modality),alpha=0.15)+
        facet_wrap(~modality_f)
    }
  })
  
  output$view<-renderTable({
    
    modalities=data.frame(matrix(rep(0,4*input$years),ncol=4,nrow=input$years))
    colnames(modalities)<-c("year","no_contrib","fixed_contrib","growing_contrib")
    rownames(modalities)<-NULL
    for(i in 0:10){
      modalities[i+1,1]=i
      modalities[i+1,2]=future_value(input$initial,input$rrate*0.01,i)
      modalities[i+1,3]=annuity(input$contrib,input$rrate,i)+modalities[i+1,2]
      modalities[i+1,4]=growing_annuity(input$contrib,input$rrate,input$grate,i)+modalities[i+1,2]
    }
    modalities
    modalities[1:11,]
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)

