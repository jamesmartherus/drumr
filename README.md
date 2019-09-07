<!-- badges: start -->
[![Travis build status](https://travis-ci.org/jamesmartherus/drumr.svg?branch=master)](https://travis-ci.org/jamesmartherus/drumr)
<!-- badges: end -->

# `drumr`: Turn R into a Basic Drum Machine

`drumr` allows you to play drum beats from within R. At present the package contains only two functions -- `beat()`, which plays a beat from a given `kit` and `drum`, and `tempo()`, which sets the spacing between beats.

## Installation

To install the development version of `drumr`, use the `install_github` function from the `devtools` package:

```
library(devtools)
install_github("jamesmartherus/drumr")
```

To install the latest release version of `drumr`, use the `install.packages` function:

```
install.packages("drumr")
```

## Requirements

The `beat` function requires the `audio` package.

## `beat()`

`beat()` takes two arguments - `kit` and `drum`. The `kit` argument selects a drumset, and the `drum` argument selects a specific piece from that kit. As present, there are four kits available:

- acoustic [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FREAL+LIVE+KITS%2FPearl+Real+Kit%2F)
- hiphop [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FSTYLE+KITS+%28Hip+Hop%2C+Etc%29%2FHip+Hop+Specialty+Kit%2F)
- electro [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FSTYLE+KITS+%28Hip+Hop%2C+Etc%29%2FPrecise+Electro+Percussion%2F)
- beatbox [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FUNUSUAL+KITS+and+FX%2FBeatBox+Male%2F)
- world [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FETHNIC+and+WORLD+PERCUSSION%2F)
- R2D2 [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FUNUSUAL+KITS+and+FX%2FR2D2+Construction+Kit%2F)

Each kit includes four pieces:

- kick: a standard bass drum strike
- snare: a standard snare drum strike
- hihat: a closed hihat cymbal
- crash: a crash cymbal


### Usage

`beat(kit = "acoustic", drum = "snare")`

## `tempo()`

`tempo()` is a basic wrapper for `Sys.time()` that sets the time between beats in beats per minute (bpm). `tempo()` takes one argument - `bpm`. 

### Usage

`tempo(bpm = 120)`


## Example Script

The following script will play a basic four-bar drum beat: 

```
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
```
## Example with tidyverse

```
library(tidyverse)
library(drumr)

drum <- c("kick",
          "snare",
          "hihat",
          "crash")

pattern1 <- tribble(~drum,~notes,
        1,2,
        1,2,
        2,2,
        1,2,
        1,1,
        1,2,
        2,1) 

pattern2 <- tribble(~drum,~notes,
                 1,2,
                 1,2,
                 2,2,
                 1,1,
                 1,2,
                 2,2,
                 2,4) 

song <- bind_rows(map_dfr(seq_len(3), ~ pattern1), pattern2 )

 walk2(song$drum, song$notes,~  { beat(drum=drum[.x],kit="acoustic"); tempo(120 * .y) } )
```

# Acknowledgements

Drum samples courtesy of [sampleswap.org](sampleswap.org). 

The `beat` function uses some code from Rasmus Bååth's excellent [beepr package](https://github.com/rasmusab/beepr)
