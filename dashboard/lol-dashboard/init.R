###########################################################
# Update this line with the R packages to install:

my_packages = c("shiny","shinydashboard","shinyscreenshot",
                "bslib","tidyverse","tidymodels","glmnet")

###########################################################

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", p, "\n"))
  }
}
invisible(sapply(my_packages, install_if_missing))
