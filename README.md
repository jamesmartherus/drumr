# `drumr`: Turn R into a Basic Drum Machine

`drumr` allows you to play drum beats from within R. At present the package contains only two working functions -- `beat()`, which plays a beat from a given `kit` and `drum`, and `tempo()`, which sets the spacing between beats. Admittedly, this package is basically useless, but it's fun to play with.

## Installation

To install `drumr`, use the `install_github` function from the `devtools` package:

```
library(devtools)
install_github("jamesmartherus/drumr")
```

## Requirements

The `beat` function requires the `audio` package.

## `beat()`

`beat()` takes two arguments - `kit` and `drum`. The `kit` argument selects a drumset, and the `drum` argument selects a specific piece from that kit. As present, there are three kits available:

- acoustic
- hiphop
- electro

Each kit includes four pieces:

- kick: a sample of a standard bass drum strike
- snare: a sample of a standard snare drum strike
- hihat: a sample of a closed hihat
- crash: a sample of a crash cymbal

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


```

# Acknowledgements

Drum samples courtesy of [sampleswap.org](sampleswap.org). 

The `beat` function uses some code from Rasmus Bååth's excellent [beepr package](https://github.com/rasmusab/beepr)




