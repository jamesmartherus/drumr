# `drumr`: Turn R into a Basic Drum Machine

`drumr` allows you to play drum beats from within R. At present the package contains only two functions -- `beat()`, which plays a beat from a given `kit` and `drum`, and `tempo()`, which sets the spacing between beats. Admittedly, this package is basically useless, but it's fun to play with.

## Installation

To install `drumr`, use the `install_github` function from the `devtools` package:

```
library(devtools)
install_github("jamesmartherus/drumr")
```

## Requirements

The `beat` function requires the `audio` package.

## `beat()`

`beat()` takes two arguments - `kit` and `drum`. The `kit` argument selects a drumset, and the `drum` argument selects a specific piece from that kit. As present, there are four kits available:

- acoustic
- hiphop
- electro
- pearl [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FREAL+LIVE+KITS%2FPearl+Real+Kit%2F)
- beatbox [(source)](https://sampleswap.org/filebrowser-new.php?d=DRUMS+%28FULL+KITS%29%2FUNUSUAL+KITS+and+FX%2FBeatBox+Male%2F)

Each kit includes at least four pieces:

- kick: a standard bass drum strike
- snare: a standard snare drum strike
- hihat: a closed hihat cymbal
- crash: a crash cymbal

Some kits also include additional pieces:

- hitom1: a high tom
- hitom2: a second high tom
- floortom: a floor tom
- openhat: an open hihat
- misc1: varies by kit
- misc2: varies by kit


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

# Acknowledgements

Drum samples courtesy of [sampleswap.org](sampleswap.org). 

The `beat` function uses some code from Rasmus Bååth's excellent [beepr package](https://github.com/rasmusab/beepr)
