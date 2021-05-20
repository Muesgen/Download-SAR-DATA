getwd()
setwd("/Users/muesgen/Documents/Deforestation_monitoring")
Platform <- "Sentinel-1A" #Options: "Sentinel-1A","Sentinel-1B","Sentinel-1A,Sentinel-1B"
process <- "GRD_HD" #Options: METADATA_GRD, GRD_HS, GRD_HD, GRD_MS, GRD_MD, GRD_FS, GRD_FD, SLC, RAW, OCN, METADATA_RAW, METADATA, METADATA_SLC, THUMBNAIL
Mode <- "IW" # Options: "EW, IW, S1, S2, S3, S4, S5, S6, WV"
aoi <- "/Users/muesgen/Documents/Deforestation_monitoring/Forestinput/GRAS/ProSympac_Mill_Point_Buffer_50km.shp" # Path to area of interest
poly <- rgdal::readOGR("/Users/muesgen/Documents/Deforestation_monitoring/Forestinput/GRAS/ProSympac_Mill_Point_Buffer_50km.shp")
subArea.wkt <- paste0("POLYGON((",poly@bbox[1,1]," ",poly@bbox[2,2],",",poly@bbox[1,1]," ",poly@bbox[2,1],",",poly@bbox[1,2]," ",poly@bbox[2,1],",",poly@bbox[1,2],
                      " ",poly@bbox[2,2],",",poly@bbox[1,1]," ",poly@bbox[2,2],"))")
start <- "2021-04-20" # Startdate YYYY-MMM-DD
end <- "2021-05-01" # Enddate YYYY-MM-DD
startdate <- paste0(start, "T00:00:00UTC")
enddate <- paste0(end, "T00:00:00UTC")
user <- "muesgen" # Username ASF
pw <- "Sanchez93" # Password

fileConn<-file("config.txt")
writeLines(c("[api_search]",
             "output=csv",
             paste0("platform = ", Platform),
             paste0("processingLevel = ", process),
             paste0("beamMode = ", Mode),
             paste0("intersectsWith = ", subArea.wkt),
             paste0("start=", startdate),
             paste0("end=", enddate),
             paste0(" "),
             "[download]",
             "download_site = both",
             "nproc = 6",
             paste0(" "),
             "[asf_download]",
             paste0("http-user = ",user),
             paste0("http-password = ",pw)), fileConn)
close(fileConn)

command <- paste0("python ",getwd(),"/sentinel_query_download.py ",getwd(),"/config.txt --verbose")
system(command) 
command <- paste0("python ",getwd(),"/sentinel_query_download.py ",getwd(),"/config.txt --verbose --download")
system(command)  
