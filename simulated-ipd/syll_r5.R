# here i am inputting the string in its syllabic format
input_7 <- "O O N,O N"
#here i am splitting the syllables up 
syllables <- strsplit(input_7, ",")[[1]]

set.seed(500)

print(syllables)

new_word <- c()

gen_962 <-replicate(962, {
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
      non_default <- c("OT", "OD", "OC", "O0A", "OA")
      # here I am setting the probabilities of the characters in the array based on the data
      probs_nd <- c(OT=0.1509, OD=0.2004, OC=0.3341, O0A=0.0625, OA=0.1013)
      names(probs_nd) <- non_default
      
      s <- sample(non_default, size = 1, replace = TRUE, prob = probs_nd)
      
      new_syllable[1] <- s
    }
    else if (onset_counter > 1) {
      non_default <- c("OT", "OD", "OC", "O0A", "OA", "O0T")
      # here I am setting the probabilities of the characters in the array based on the data
      probs_nd <- c(OT=0.1509, OD=0.2004, OC=0.3341, O0A=0.0625, OA=0.1013, O0T=0.9509)
      names(probs_nd) <- non_default
      
      previous_onset_output <- ""
      
      for (i in 1:onset_counter) {
        print("====STARTING ONSET CHECK=====")
        print(i)
        s <- sample(non_default, size = 1, replace = TRUE, prob = probs_nd)
       print (s)

      new_syllable[i] <- s
      
      if (previous_onset_output == "O0T" && s == "O0T") {
        index <- sample(c(0, 1), size = 1)
        new_syllable[i-index] <- "O0A"
        print("FOUND 2 O0T, SETTING NEW INDEX")
        print (index)
      }
      
      previous_onset_output <- s
      }
    }
      
    print(new_syllable)
    
    # == Code For Nucleus==
    nuclei_counter <- 0
    for (phoneme in phonemes) {
      if (phoneme == "N") {
        nuclei_counter <- nuclei_counter+1
      }
    }
    print("Nuclei:")
    print(nuclei_counter)
    print("=====")
    
    if (nuclei_counter == 1) {
      non_default <- c("NC", "N0A", "N0T", "Na", "ND")
      # here I am setting the probabilities of the characters in the array based on the data
      probs_nd <- c(NC=0.7865, N0A=0.007, N0T=0.0418, Na=0.1555, ND=0.0093)
      names(probs_nd) <- non_default
      
      n <- sample(non_default, size = 1, replace = TRUE, prob = probs_nd)
      
      new_syllable[onset_counter+1] <- n
    }
    print(new_syllable)
    
    # ==Code For Coda==
    coda_counter <- 0
    for (phoneme in phonemes) {
      if (phoneme == "K") {
        coda_counter <- coda_counter+1
      }
    }
    print("Codas:")
    print(coda_counter)
    print("=====")
    
    if (coda_counter == 1) {
      non_default <- c("KC", "K0T", "K0A", "KA", "KD", "KT")
      # here I am setting the probabilities of the characters in the array based on the data
      probs_nd <- c(KC=0.4297, K0T=0.2936, K0A=0.0340, KA=0.0553, KD=0.0681, KT=0.1191)
      names(probs_nd) <- non_default
      
      k <- sample(non_default, size = 1, replace = TRUE, prob = probs_nd)
      
      new_syllable[onset_counter+nuclei_counter+1] <- k
    }
    
    print(new_syllable)
    
    new_syllable_joined <- paste0(new_syllable, collapse = "")
    
    new_word <- c(new_word, new_syllable_joined)
    
    print(new_word)
    
    
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
  new_word_joined <- paste0(new_word, collapse = "")
  new_word_joined
})

head(gen_962)

elic_1 <- "O0AO0ANAOCNC"
sum(gen_962 == elic_1) 

elic_2_3 <- "O0AOCNCOCNC"
sum(gen_962 == elic_2_3)

