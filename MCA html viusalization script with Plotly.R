#Libraries
library(plotly)
#Function
plotfun=function(set, type) {
  #Init vars
  wd = getwd()
  tempq=list()
  for(i in 1:18) {
    tempq[[i]]=1
  }
  k=1
  q=1
  #Fill list
  for(n in 3:4) {
    for(p in 1:3) {
      k=1
      for(i in 1:(dim(set[[n]][[p]])[1])){ 
        for(j in 1:(dim(set[[n]][[p]])[2])){
          tempq[[q]][k]=set[[n]][[p]][i,j]
          tempq[[q+1]][k]=names(set[[n]][[p]][,1][i])
          tempq[[q+2]][k]=names(set[[n]][[p]][1,][j])
          k=k+1
        }
      }
      q=q+3
    }
  }
  #Set wd
  filename = paste(deparse(substitute(set)), " ", type, collapse = "", sep = "")
  ver = 0
  while(dir.exists(filename)){
    ver = ver + 1
    filename = paste(filename, " (", toString(ver), ")", collapse = "", sep="")
  }
  dir.create(filename)
  setwd(paste(wd, "/", filename, collapse = "", sep = ""))
  #Init plotting vars
  for(i in seq(1,6)) {
    if(i<=3) {
      y = "Individuals"
    } else {
      y = "Categories"
    }
    if(i==1 | i==4) {
      z = "Coordinates"
    } else if(i==2 | i==5) {
      z= "Contributions"
    } else {
      z = "Cosine Squared"
    }
    nameofplot = paste( z, " of ", y, collapse = "")
    #Plot
    plot = plot_ly(x = tempq[[(i*3)]], y = tempq[[(i*3)-1]], z = tempq[[(i*3)-2]], 
        type = "scatter3d", mode = type, color = tempq[[(i*3)-1]]) %>% 
        layout(
        title = nameofplot,
        scene = list( xaxis = list(title = "Dimensions"),
        yaxis = list(title = y), 
        zaxis = list(title = z)))
    #Saving plot
    htmlwidgets::saveWidget(as_widget(plot), paste(nameofplot, ".html", collapse = "", sep=""))
  }
  setwd(wd)
}
