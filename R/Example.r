library(devtools)
install_github("jamesmartherus/drumr")
library(drumr)

# Bars 1-3
for(i in 1:3){
  
  beat(drum="kick",kit="acoustic")
  
  tempo(240)
  
  beat(drum="kick",kit="acoustic")
  
  tempo(240)
  
  beat(drum="snare",kit="acoustic")
  
  tempo(240)
  
  beat(drum="kick",kit="acoustic")
  
  tempo(120)
  
  beat(drum="kick",kit="acoustic")
  
  tempo(240)
  
  beat(drum="snare",kit="acoustic")
  
  tempo(120)
  
}

#Bar 4
beat(drum="kick",kit="acoustic")

tempo(240)

beat(drum="kick",kit="acoustic")

tempo(240)

beat(drum="snare",kit="acoustic")

tempo(240)

beat(drum="kick",kit="acoustic")

tempo(120)

beat(drum="kick",kit="acoustic")

tempo(240)

beat(drum="snare",kit="acoustic")

tempo(240)

beat(drum="snare",kit="acoustic")

tempo(480)

beat(drum="snare",kit="acoustic")



