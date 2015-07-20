complete <- function (directory, id = 1:332){
  # create list of files 
  files_list <- list.files(directory, full.names = TRUE)
  # create empty data frame 
  nobs_list <- data.frame()
  id_list <- data.frame()
 
  for (i in id) {
    # loops through files and binds
    dat <- data.frame()
    dat <- rbind(dat, read.csv(files_list[i]))
    good <- complete.cases(dat)
    x1 <- factor(good)
    t1 <- table (x1)
    nobs_list <- rbind(nobs_list, t1[2])
    id_list <- rbind(id_list, i)
  }
  
  comp <- data.frame(id_list, nobs_list)
  names(comp) <- c("id", "nobs")
  comp
}
