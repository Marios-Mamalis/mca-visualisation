# Libraries
library(plotly)
library(reshape2)

plotfun=function(set, type) {
  
  # Init
  wd = getwd()
  groupp = c("Individuals", "Categories")
  metricc = c("Coordinates", "Contributions", "Cosine Squared")
  
  # Set wd
  filename0 = paste(deparse(substitute(set)), type)
  filename = filename0
  ver = 0
  while(dir.exists(filename)){
    ver = ver + 1
    filename = paste0(filename0, " (", toString(ver), ")")
  }
  dir.create(filename)
  setwd(paste0(wd, "/", filename))
  
  # Plot
  for(i in 1:2){
    for(j in 1:3){
      dataa = melt(set[[i+2]][[j]])
      dataa$Var1 = as.factor(dataa$Var1)
      nameofplot = paste(metricc[j], "of", groupp[i])
      
      plot = plot_ly(dataa, x = ~Var2, y = ~Var1, z = ~value, 
                     type = "scatter3d", mode = type, color = ~Var1) %>% 
        layout(
          title = nameofplot,
          scene = list( xaxis = list(title = "Dimensions"),
                        yaxis = list(title = groupp[i]), 
                        zaxis = list(title = metricc[j]))
        )
      htmlwidgets::saveWidget(as_widget(plot), paste0(nameofplot, ".html"))
    }
  }
  
  # Restore wd
  setwd(wd)
}
