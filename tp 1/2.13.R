brutToNet3 <- function (salary,statut,prelevement,temps_travail)
{
  if(!(statut == "cadre" || statut == "non-cadres")) {
    return("ERROR : contract unknown")
    
  }
  
  if (!(prelevement <= 1 & prelevement > 0)){
    return("ERROR : rate and time must be in range(0%,100%)")
  }
  
  if (!(temps_travail <= 1 & temps_travail > 0)){
    return("ERROR : rate and time must be in range(0%,100%)")
  }
  
  if(statut == "non-cadres"){
    net_salary <- salary * (1-0.22)
    net_salary_impot <- net_salary * (1-prelevement) * temps_travail
    
    ma_liste <- list(net_salary,net_salary_impot)
    return(ma_liste)}
  
  if(statut == "cadre"){
    net_salary <- salary * (1-0.25)
    net_salary_impot <- net_salary * (1-prelevement) * temps_travail
   
    ma_liste <- list(net_salary,net_salary_impot)
    return(ma_liste)}
  
}   

print(brutToNet3(1000,"cadre",0.075,1))

      