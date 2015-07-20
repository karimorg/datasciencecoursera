corr <- function(directory, thresold = 0) {
  # correr complete 
  source("complete.R")
  res <- complete(directory, 1:332) 
  mon_list <- (res[which(res$nobs > thresold), ])
  
  id_list <- c(mon_list[,1])
  
  cr_temp <- data.frame()
  c <- list()
  
  if (length(id_list) > 0 ) {
    
#    print(id_list)
    files_list <- list.files(directory, full.names = TRUE)
    
    for (i in id_list) {
      #print(files_list[i])
      #leer el archivo
      dat <- data.frame()
      dat <- rbind(dat, read.csv(files_list[i]))
      #x sulfate
      x <- dat$sulfate 
      #y nitrate
      y <- dat$nitrate
      #obtener los validos
      good <- complete.cases(x, y)
      #hacer correlacion
      c1 <- cor(x[good], y[good])
      #agregar a la lista
      cr_temp <- rbind(cr_temp, c1) 
      
    }
    
    c <- c(cr_temp[,1])
    
  } 
  
  c
  } 
