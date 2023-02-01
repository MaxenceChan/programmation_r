brutToNet1 <- function(salary) {
  if (!is.numeric(salary)) {
    return("ERROR: type not expected")
  }
  net_salary <- salary * (1 - 0.22)
  return(net_salary)
}

print(brutToNet1(3000))






