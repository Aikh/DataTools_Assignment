firstroot <- function(a,b,c) (-b+(b^2-4*a*c)^0.5)/(2*a)
secondroot <- function(a,b,c) (-b-(b^2-4*a*c)^0.5)/(2*a)
output$val1<-firstroot(input$a, input$b, input$c)
output$val2<-secondroot(input$a, input$b, input$c)

require(rCharts)
	
output$nvd3plot <- renderChart({
  haireye = as.data.frame(HairEyeColor)
  n1 <- nPlot(Freq ~ Hair, group = 'Eye', type = input$type,
    data = subset(haireye, Sex == input$sex)
  )
  n1$set(dom = 'nvd3plot', width = 600)
  n1
})