#'Play a drum sound
#'
#'\code{beat} plays a drum beat.
#'
#'
#'@param drum character string or number specifying which drum is to be played by 
#'  specifying one of the built in sounds. The default is "snare". Every kit includes at 
#'  least four pieces:
#'  \enumerate{ \item \code{"kick"} \item \code{"snare"} \item \code{"hihat"}
#'  \item \code{"crash"}}
#'  If \code{drum} does not match any
#'  of the sounds above, a random sound will be played.
#'  
#'@param kit character string specifying which kit is to be used. The default is "acoustic."
#' Possible kits are:
#' \enumerate{ \item \code{"acoustic"} \item \code{"hiphop"} \item \code{"electro"}
#' \item \code{beatbox} \item \code{pearl}}
#'  If \code{kit} does not match any
#'  of the sounds above, a random sound will be played.
#'  
#'@param expr An optional expression to be excecuted before the sound.
#'@import audio
#'@import stringr
#'  
#'  
#'@return NULL
#'  
#' @examples
#' # Play a "snare" sound from the "acoustic" kit
#' beat()
#' 
#' \dontrun{
#' # Play a bass sound from the hiphop kit.
#' beep(drum="bass", kit="hiphop")
#' 
#' }
#'@export
beat <- function(drum="snare", kit="acoustic", expr=NULL) {
  expr
  drums <- c(snare = "snare.wav",
              kick = "kick.wav",
              hihat = "hihat.wav",
              crash = "crash.wav")
  kits <- c(acoustic = "acoustic/",
            electro = "electro/",
            hiphop = "hiphop/",
            beatbox = "beatbox/",
            pearl = "pearl/")
  drum_path <- NULL
  if(is.na(drums[drum]) || length(drums[drum]) != 1 || is.na(kits[kit]) || length(kits[kit]) != 1) {
    if(is.character(drum)) {
      drum <- stringr::str_trim(drum)
      if(is.character(kit)){
        kit <- stringr::str_trim(kit)
        if(file.exists(system.file(paste("sounds/", kits[kit], drums[drum], sep=""), package="drumr"))){
          drum_path <- system.file(paste("sounds/", kits[kit], drums[drum], sep=""), package="drumr")
        } else {
          warning(paste("Either ", '"', kit, '"', " is not a valid kit, or ", '"', drum, '"', " is not a valid drum. Playing a random sound instead.", sep = ""))
        }
      }
    }
  } else if(!file.exists(system.file(paste("sounds/", kits[kit], drums[drum], sep=""), package="drumr"))){
      warning(paste("Either ", '"', kit, '"', " is not a valid kit, or ", '"', drum, '"', " is not a valid drum. Playing a random sound instead.", sep = ""))
  } else {
    drum_path <- system.file(paste("sounds/", kits[kit], drums[drum], sep=""), package="drumr")
  }
  
  if(is.null(drum_path)) { # play a random sound
    drum_path <- system.file(paste("sounds/", sample(kits, size=1), sample(drums, size=1), sep=""), package="drumr")
  }
  
  tryCatch(play_file(drum_path), error = function(ex) {
    warning("beat() could not play the sound due to the following error:\n", ex)
  })
}

is_wav_fname <- function(fname) {
  stringr::str_detect(fname, regex("\\.wav$", ignore_case = TRUE))
}

escape_spaces <- function(s) {
  stringr::str_replace_all(s, " ", "\\\\ ")
}

play_vlc <- function(fname) {
  fname <- escape_spaces(fname)
  system(paste0("vlc -Idummy --no-loop --no-repeat --playlist-autostart --no-media-library --play-and-exit ", fname), 
         ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_paplay <- function(fname) {
  fname <- escape_spaces(fname)
  system(paste0("paplay ", fname), ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_aplay <- function(fname) {
  fname <- escape_spaces(fname)
  system(paste0("aplay --buffer-time=48000 -N -q ", fname), ignore.stdout = TRUE, ignore.stderr=TRUE,wait = FALSE)
  invisible(NULL)
}

play_audio <- function(fname) {
  sfx <- audio::load.wave(fname)
  audio::play(sfx)
}

play_file <- function(fname) {
  if(Sys.info()["sysname"] == "Linux") {
    if(is_wav_fname(fname) && nchar(Sys.which("paplay")) >= 1) {
      play_paplay(fname)
    } else if(is_wav_fname(fname) && nchar(Sys.which("aplay")) >= 1) {
      play_aplay(fname)
    } else if(nchar(Sys.which("vlc")) >= 1) {
      play_vlc(fname)
    } else {
      play_audio(fname)
    }
  } else {
    play_audio(fname)
  }
}
