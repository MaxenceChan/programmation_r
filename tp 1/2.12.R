
brutToNet2 <- function(salary,statut) {
  if(!(statut == "cadre" || statut == "non-cadres")) {
    return("ERROR : contract unknown")
    
  }
  if(statut == "cadre"){
  net_salary <- salary * (1-0.22)
  return (net_salary)}
  
  if(statut == "non-cadres"){
  net_salary <- salary * (1-0.25)
  return(net_salary)}
  
}


print(brutToNet2(3000,"cadre"))

