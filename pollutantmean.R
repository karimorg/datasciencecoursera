pollutantmean <- function(directory, pol, id = 1:332) {
    # create list of files 
    files_list <- list.files(directory, full.names = TRUE)
    # create empty data frame 
    dat <- data.frame()
    for (i in id) {
       # loops through files and binds
       dat <- rbind(dat, read.csv(files_list[i]))
    }
    # identifies the mean of pollutant pol 
    mean(dat[,pol], na.rm=TRUE)
}
