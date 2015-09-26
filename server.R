library(shiny)

firstroot <- function(a,b,c) (-b+(b^2-4*a*c)^0.5)/(2*a)
secondroot <- function(a,b,c) (-b-(b^2-4*a*c)^0.5)/(2*a)

shinyServer(
  function(input, output) {
    val1<-reactive({firstroot(input$a, input$b, input$c)})
    val2<-reactive({secondroot(input$a, input$b, input$c)})
    val1a<-reactive({if(is.na(val1())) "no real root" else val1()})
    val2a<-reactive({if(is.na(val1())) "no real root" else val2()})    
    output$inputValue <- renderPrint({print(paste0(input$a,"x^2 + ",input$b,"x + ",input$c))})
    output$f_root <- renderPrint({print(paste0("x1 = ",val1a()))})
    output$s_root <- renderPrint({print(paste0("x2 = ",val2a()))})
    xlim1<-reactive({if(val1a()>=val2a()) val1a() else val2a()})
    xlim2<-reactive({if(val1a()>=val2a()) val2a() else val1a()})    
  
    
    cplot<-function(x) (input$a*x^2+input$b*x+input$c)
    output$curveplot <- renderPlot({
    plot(curve(cplot,xlim=c(xlim2()-abs((xlim2()-xlim1())*0.15+0.1),xlim1()+abs((xlim2()-xlim1())*0.15+0.1))),type="l",xlim=c(xlim2()-abs((xlim2()-xlim1())*0.1+0.1),xlim1()+abs((xlim2()-xlim1())*0.1+0.1)),ylim=c(-10,10),ylab="y",xlab="x")

      }
)
  }
)
