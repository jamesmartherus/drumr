#'Set a tempo
#'
#'\code{tempo} is a wrapper for Sys.time() that sets a tempo in bpm.
#'
#'
#'@param bpm A number specifying the tempo in beats per minute. Default is 120. 
#'  
#'  
#'@return NULL
#'  
#' @examples
#' # Set tempo at 60 beats per minute
#' tempo(60)
#' 
#'@export

tempo <- function(bpm=120){
  Sys.sleep(60 / bpm)
}

