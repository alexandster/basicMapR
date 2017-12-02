install.packages("maps")
library(maps)


#Part 1

#read CSV
costcos <- read.csv("C:\\Users\\ahohl\\Google Drive\\Classes\\Fall2017\\GEOG6030\\Ex1\\ch08\\geocode\\costcos-geocoded.csv", sep=",")

#First attempt
map(database="state")
#symbols(costcos$Longitude, costcos$Latitude, circles=rep(1, length(costcos$Longitude)), inches=0.05, add=TRUE)

V1 <- rep(1, length(costcos$Longitude))
V2 <- rep(1, length(costcos$Longitude))
V3 <- rep(1, length(costcos$Longitude))
V4 <- rep(1, length(costcos$Longitude))
V5 <- rep(1, length(costcos$Longitude))
V6 <- rep(1, length(costcos$Longitude))

mat <- matrix(c(V1,V2,V3,V4,V5,V6),nrow=length(V1))

symbols(costcos$Longitude, costcos$Latitude, stars=mat, inches=0.1, add=TRUE)


#red dots, grey lines
map(database="state", col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff",lwd=0.5, circles=rep(1, length(costcos$Longitude)), inches=0.05, add=TRUE)
            
#whole world
map(database="world", col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff",lwd=0.3, circles=rep(1, length(costcos$Longitude)), inches=0.03, add=TRUE)

#west coast
map(database="state", region=c("California", "Nevada", "Oregon", "Washington"),col="#cccccc")
symbols(costcos$Longitude, costcos$Latitude, bg="#e2373f", fg="#ffffff",lwd=0.3, circles=rep(1, length(costcos$Longitude)), inches=0.03, add=TRUE)



#Part 2

#read CSV
fertility <- read.csv("C:\\Users\\ahohl\\Google Drive\\Classes\\Fall2017\\GEOG6030\\Ex1\\ch08\\points\\adol-fertility.csv", sep=",")

#map fertility rates, graduated symbols
map("world", fill=FALSE, col="#cccccc")
symbols(fertility$longitude, fertility$latitude, circles=sqrt(fertility$ad_fert_rate), add=TRUE, inches=0.15, bg="#93ceef", fg="#ffffff")



#Part 3

#read CSV
gps <- read.csv("V:\\Users\\ahohl\\Classes\\fall17\\GEOG6030\\elwyn.csv", 
                header = TRUE)

library(ggmap)
mapImageData <- get_map(location = c(lon = mean(gps$Longitude), 
                                     lat = 33.824),
                        color = "color", # or bw
                        source = "google",
                        #maptype = "hybrid",
                        # api_key = "your_api_key", # only needed for source = "cloudmade"
                        zoom = 17)

pathcolor <- "#F8971F"

ggmap(mapImageData,
      extent = "device", # "panel" keeps in axes, etc.
      ylab = "Latitude",
      xlab = "Longitude",
      legend = "right") + 
  geom_path(aes(x = Longitude, # path outline
                y = Latitude),
            data = gps,
            colour = "black",
            size = 2) +
  geom_path(aes(x = Longitude, # path
                y = Latitude),
            colour = pathcolor,
            data = gps,
            size = 1.4) # +
# labs(x = "Longitude",
#   y = "Latitude") # if you do extent = "panel"
