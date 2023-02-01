netAnnuelToImpot <- function (salary) {
  
  impot_total <- 0
  impot_1 <- 0
  impot_2 <- (27478 - 10777)*0.11
  impot_3 <- (78570 - 27478)*0.30
  impot_4 <- (168994 - 78570)*0.41
  impot_5 <- (salary - 168993)*0.45
  
  if (salary < 27478){
    
    impot_2 <- (salary - 10777)*0.11
  }
  
  if (salary < 78750) {
    
    impot_3 <- (salary - 27478)*0.30
  }
  
  if (salary < 168994){
    
    impot_4 <- (salary - 78570)*0.45
    impot_5 <- 0
  }
  
  c <- list(impot_1,impot_2,impot_3,impot_4,impot_5)
  print("Voici les taxes d'impots par tranche")
  for (i in (1:(length(c)))){
    if (as.numeric(c[i]) > 0){
      print(as.numeric(c[i]))
      impot_total <- impot_total + as.numeric(c[i])}}
  print("Le revenu total net imposable est de")
  return(impot_total)
}

print(netAnnuelToImpot(30000))



