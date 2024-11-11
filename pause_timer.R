library(beepr)

# Denne funktion skal holde styr på pausernes længde.
pause_timer <- function(time){
  for(i in 1:time){
    Sys.sleep(1) # vent 1 sekund
    print(paste(time-i, "sekunder tilbage")) # Print tilbage tid
    if(time == i){ # hvis tiden er ovre 
      print("Vi starter igen") #print vi starter
      beep()}} # og bip
}
