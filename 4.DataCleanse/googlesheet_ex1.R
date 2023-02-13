install.packages("googlesheets")
library(googlesheets)

gs_ls()
for_gs <- gs_title("servicios_pers")

gs_ws_ls(for_gs)

#We can "download" one of the sheets using gs_read()

# get Westminster voting
west <- gs_read(ss=for_gs, ws = "Catálogo", skip=1)

# convert to data.frame
wdf <- as.data.frame(west)
View(wdf)