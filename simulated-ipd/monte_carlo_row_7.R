# here i am making an array of the 3 options for non-default OT tableus
non_default <- c("A", "T", "C")
# here I am setting the probabilities of the characters in the array based on the data
probs_nd <- c(A=0.2546, T=0.2726, C=0.4727)

names(probs_nd) <- non_default
#names is a function to set the values of an array
#here i get 5 letters based on the probabilities
# gen_elicitation <- sample(non_default, size = 5, replace = TRUE, prob = probs_nd)
#set seed makes it so that it always generates the same random set)
set.seed(70)
#here i am replicating it a buch of times 
gen_962 <-replicate(962, {
  paste0(
    sample(non_default, size = 5, replace = TRUE, prob = probs_nd), collapse = ""
  )
})
#here they get collapsed into one string
head(gen_962)

elic_1 <- "CCTCC"
sum(gen_962 == elic_1) 

elic_2 <- "ACCCC"
sum(gen_962 == elic_2) 

