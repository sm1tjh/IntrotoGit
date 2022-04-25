# Edit by T Heaton
b <- b + 3


my_packages <- c("tidyverse", "broom", "coefplot", "cowplot",
                 "gapminder", "GGally", "ggrepel", "ggridges", "gridExtra",
                 "here", "interplot", "margins", "maps", "mapproj",
                 "mapdata", "MASS", "quantreg", "rlang", "scales",
                 "survey", "srvyr", "viridis", "viridisLite", "devtools")

install.packages(my_packages, repos = "http://cran.rstudio.com")
devtools::install_github("kjhealy/socviz")


#install.packages("tidyverse", dependencies =TRUE)
library(tidyverse)
library(coefplot)
library(gridExtra)



anscombe

cor(anscombe$x1, anscombe$y1)
cor(anscombe$x2, anscombe$y2)
cor(anscombe$x3, anscombe$y3)
cor(anscombe$x4, anscombe$y4)

lm1 <- lm(y1 ~ x1, data = anscombe)
summary(lm1)

lm2 <- lm(y2 ~ x2, data = anscombe)
summary(lm2)

lm3 <- lm(y3 ~ x3, data = anscombe)
summary(lm3)



# What about if we plot them?
plot(y1 ~ x1, data = anscombe, pch = 19)
abline(lm1)


# Plot first dataset
p1 <- ggplot(anscombe, aes(x = x1, y = y1)) + 
  geom_point() + xlim(3, 20) + 
  stat_smooth(method = "lm", col = "red")

p2 <- ggplot(anscombe, aes(x = x2, y = y2)) + 
  geom_point() + xlim(3, 20) +
  stat_smooth(method = "lm", col = "red")

p3 <- ggplot(anscombe, aes(x = x3, y = y3)) + 
  geom_point() + xlim(3, 20) +
  stat_smooth(method = "lm", col = "red")

p4 <- ggplot(anscombe, aes(x = x4, y = y4)) + 
  geom_point() + xlim(3, 20) +
  stat_smooth(method = "lm", col = "red")

grid.arrange(p1, p2, p3, p4, nrow=2)
