# load libraries 
library(lme4)
library(nlme)
library(boot)
library(car) 
library(reshape2)
library(ggplot2)
library(ez)
library(plyr)
library(ggsignif)
library(lsr)
library(sjmisc)
library(sjstats)
library(BayesFactor)
library(foreign)
library(dplyr)
library(lattice)
library(Hmisc)

# DATA CLEAN UP AND RESTRUCTURING #
D = read.csv(file.choose(), header = TRUE, stringsAsFactors = FALSE)

D$condition = as.factor(D$condition)

# create new proportions column

# Test against chance
t.test(D$pref.prop[D$condition=="test"], mu = 0.5)
