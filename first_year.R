#read the files in via loop 
#read them into an appropriate data structure
#we are taking them from the NOAA buoy database

#using read.table() function, reads a file in table format and creates a data 
#frame from it. can take a URL as input, like from the NOAA database

#root and tail based on setup of the data being filename= name of station h year
file_root <- "https://www.ndbc.noaa.gov/view_text_file.php?filename=44013h"
tail <- ".txt.gz&dir=data/historical/stdmet/"

load_buoy_data <- function(year){
  path <- paste0(file_root, year, tail)
  if (year<2007) {
    header <- scan(path, what='character', nlines =1)
    buoy <- read.table(path, fill=TRUE, header=TRUE, sep="")
    buoy <- add_column(buoy, mm=NA, .after='hh')
    buoy <- add_column(buoy, TIDE=NA, .after='VIS')
  }
}

read.table()
