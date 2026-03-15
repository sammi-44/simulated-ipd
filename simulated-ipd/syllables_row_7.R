# here i am inputting the string in its syllabic format
input_7 <- "O N,O N K"
#here i am splitting the syllables up 
syllables <- strsplit(input_7, ",")[[1]]

print(syllables)

for (syllable in syllables) {
  # inside this loop we're only operating within syllables
  
  phonemes <- strsplit(syllable, " ")[[1]]
  # here making a copy of the syllable so that we can change stuff in it
  print(phonemes)
  new_syllable <- list(phonemes)[[1]] # add "list" to ensure the copying is okay
  
  
  numphones <- length(phonemes)
  
  # == Code For Onset==
  onset_counter <- 0
  for (phoneme in phonemes) {
    if (phoneme == "O") {
      onset_counter <- onset_counter+1
    }
  }
  print("Onsets:")
  print(onset_counter)
  print("=====")
  
  if (onset_counter == 1) {
    non_default <- c("OT", "OD", "OC", "O0A")
    # here I am setting the probabilities of the characters in the array based on the data
    probs_nd <- c(OT=0.2546, OD=0.2726, OC=0.2727, O0A=0.2)
    names(probs_nd) <- non_default
    
    s <- sample(non_default, size = 1, replace = TRUE, prob = probs_nd)
    
    new_syllable[1] <- s
  }
  print(new_syllable)
  
  # == Code For Nucleus==
  
  # ==Code For Coda==
  
  
  # if (numphones >= 3) {
    #if (phonemes[[1]] == "O" & phonemes[[2]] == "O" & phonemes [[3]] == "O") {
  #   }
  # }
  # 
  # if (numphones >= 2) {
  #   if (phonemes[[1]] == "O" & phonemes[[2]] == "O") { 
  #   }
  # }
  
}






