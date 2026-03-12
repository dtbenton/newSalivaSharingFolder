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


###################################
###################################
##                               ##
##         SIMULATION 3A         ##
##                               ##
###################################
###################################
setwd("C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/reviewer1RequestedRevision/3a")
#setwd("C:/Users/Deon T. Benton/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3a")
cond46005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond46005$V3 = max(cond46005$V3)-cond46005$V3

cond460010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond460010$V3 = max(cond460010$V3)-cond460010$V3

cond47005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond47005$V3 = max(cond47005$V3)-cond47005$V3

cond470010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond470010$V3 = max(cond470010$V3)-cond470010$V3

cond48005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond48005$V3 = max(cond48005$V3)-cond48005$V3

cond480010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond480010$V3 = max(cond480010$V3)-cond480010$V3



# combine dataframes into a single 'D' data frame
D.c1 = rbind(cond46005, cond460010, cond47005, cond470010, cond48005, cond480010)


D = D.c1

D = as.data.frame(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:120, each = 2)

D = D[order(D$ID),] 

# create trial type column
D$trialType = rep(c("Former Saliva Sharer", "Former Non-saliva Sharer"), each = 1, times = 120)
D$trialType = as.factor(D$trialType)

# epoch
D$pretrainEpoch = rep(c("600", "700", "800"), each = 80)
D$pretrainEpoch = as.factor(D$pretrainEpoch)



# create a 'looking time' column
D$lookingTime = D$V3

#(max(error) - error)

# remove columns
D = D[,-c(1:3)]

# get structure of the data
str(D)

## MAIN ANALYSIS ##
lm.fit = lme(lookingTime~(trialType + pretrainEpoch)^2, 
             random=~1|ID, 
             data = D)
anova.lme(lm.fit)


# FOLLOW UP ANALYSES

# 600 
fbs_600 = D$lookingTime[D$pretrainEpoch=="600" & D$trialType=="Former Ball Sharer"]
fss_600 = D$lookingTime[D$pretrainEpoch=="600" & D$trialType=="Former Saliva Sharer"]

t.test(fbs_600, fss_600, paired = TRUE, alternative = "two.sided")

# 800 
fbs_800 = D$lookingTime[D$pretrainEpoch=="800" & D$trialType=="Former Ball Sharer"]
fss_800 = D$lookingTime[D$pretrainEpoch=="800" & D$trialType=="Former Saliva Sharer"]

t.test(fbs_800, fss_800, paired = TRUE, alternative = "two.sided")

####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(trialType, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for a Peek-a-Boo") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~pretrainEpoch) + 
  coord_cartesian(ylim=c(0, 10)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(
    axis.text.x = element_text(size = 24, angle = 20, hjust = 1),
    axis.text.y = element_text(size = 24), 
    legend.text = element_text(size = 24),
    legend.title = element_text(size = 24),
    axis.title = element_text(size = 24),
    strip.text = element_text(size = 24), 
    axis.title.x = element_blank()
  )




####################################
####################################
##                                ##
##         SIMULATION 3Ba         ##
##                                ##
####################################
####################################


root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba"
#root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba"
#root = "C:/Users/Deon T. Benton/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba"
#root = "C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba"

read_one = function(path) {
  
  df = read.table(path, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("V1", "V2", "V3")
  
  # flip V3 within-file
  df$V3 = max(df$V3, na.rm = TRUE) - df$V3
  
  # folder + file metadata
  df$file = basename(path)
  df$test_folder = basename(dirname(path))                 # e.g., test_exp_2b, test_ComfortingDistress
  df$probability = basename(dirname(dirname(path)))        # e.g., 0v100, 90v10
  
  # parse epochs from filename
  m = regexec("pEpochs_(\\d+)_tEpochs_(\\d+)", df$file)
  hit = regmatches(df$file, m)[[1]]
  if (length(hit) == 3) {
    df$pEpochs = as.integer(hit[2])
    df$tEpochs = as.integer(hit[3])
  } else {
    df$pEpochs = NA_integer_
    df$tEpochs = NA_integer_
  }
  
  # parse condition token from filename (robust to suffixes)
  m2 = regexec("condition_([0-9]+v[0-9]+)", df$file)
  hit2 = regmatches(df$file, m2)[[1]]
  df$condition_from_name = if (length(hit2) == 2) hit2[2] else df$probability
  
  # --- trialType handling ---
  # Your files come in two flavors:
  # (A) V2 alternates foodSharer / ballSharing
  # (B) V2 alternates formerComforter_SalivaSharing / formerNonComforter_SalivaSharing
  #
  # We'll standardize both into df$trialType.
  
  v2 = tolower(df$V2)
  
  if (all(grepl("foodsharer|ballsharing", v2))) {
    df$trialType = ifelse(grepl("foodsharer", v2), "Food-Sharer", "Ball-Sharer")
    
  } else if (all(grepl("formercomforter|formernoncomforter", v2))) {
    df$trialType = ifelse(grepl("formercomforter", v2),
                          "Former-Comforter_SalivaSharing",
                          "Former-NonComforter_SalivaSharing")
    
  } else {
    # fallback: alternating 20/20 pattern (40 total rows)
    n = nrow(df)
    df$trialType = rep(c("Type1", "Type2"), length.out = n)
  }
  
  df
}

# all txt files under all probability folders and subfolders
files = list.files(root, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)

D = do.call(rbind, lapply(files, read_one))
D = as.data.frame(D)


# add ID column
D$ID = rep(c(1:2880), each = 2)

# create experiment column
D$experiment = rep(c("Simulation of Predictions", "Simulation of Thomas 2B"), each = 480, times = 6)
D$experiment = as.factor(D$experiment)

# add ratio column
D$ratio = D$condition_from_name
D$ratio = as.factor(D$ratio)

# add condition column
D$condition = rep(c("Experimental Condition", "Control Condition"), each = 240, times = 12)
D$condition = as.factor(D$condition)


# add trialType column
D$trialType = revalue(D$trialType, c("Ball-Sharer" = "Non-saliva Sharer", "Food-Sharer" = "Saliva Sharer",
                                     "Former-Comforter_SalivaSharing" = "Comforter", 
                                     "Former-NonComforter_SalivaSharing" = "Non-comforter"))


# add pretrainEpochs column
D$pretrainEpochs = rep(c("600", "700", "800"), each = 80, times = 24)
D$pretrainEpochs = as.factor(D$pretrainEpochs)

# add lookingTime column
D$lookingTime = D$V3


# get names of dataframe
names(D)


# create reduced dataframe  
D = D[,c("ID", "experiment","ratio", "condition","pretrainEpochs","trialType","lookingTime")]
D = as.data.frame(D)


# rename levels of ratio column
library(plyr)
D$ratio = revalue(D$ratio, c("0v100" = "0% comfort vs. 100% non-comfort", 
                             "100v0" = "100% comfort vs. 0% non-comfort",
                             "10v90" = "10% comfort vs. 90% non-comfort",
                             "20v80" = "20% comfort vs. 80% non-comfort",
                             "80v20" = "80% comfort vs. 20% non-comfort",
                             "90v10" = "90% comfort vs. 10% non-comfort"))

D$ratio = factor(D$ratio, levels = c("100v0" = "100% comfort vs. 0% non-comfort",
                                     "90v10" = "90% comfort vs. 10% non-comfort",
                                     "80v20" = "80% comfort vs. 20% non-comfort",
                                     "20v80" = "20% comfort vs. 80% non-comfort",
                                     "10v90" = "10% comfort vs. 90% non-comfort",
                                     "0v100" = "0% comfort vs. 100% non-comfort"))


##############
## ANALYSIS ##
##############
# convert data to wide format
D_wide = reshape(D_exp, idvar = "ID", 
                 timevar   = "trialType", 
                 direction = "wide")

# get column names from D_wide
names(D_wide)

# create difference column
D_wide$dif = D_wide$`lookingTime.Saliva Sharer` -
  D_wide$`lookingTime.Ball Sharer`

D_wide$ratio = D_wide$`ratio.Ball Sharer`
D_wide$ratio = ordered(D_wide$ratio)

lm.fit = lm(dif~as.factor(ratio), data = D_wide)
summary(lm.fit)

# 100% comfort v. 0% non-comfort
one.hundred.zero.comfort.saliva.sharer = D$lookingTime[D$ratio=="100% comfort v. 0% non-comfort" & 
                                           D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

one.hundred.zero.comfort.ball.sharer = D$lookingTime[D$ratio=="100% comfort v. 0% non-comfort" & 
                                                         D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


one.hundred.zero.comfort.dif = one.hundred.zero.comfort.saliva.sharer - one.hundred.zero.comfort.ball.sharer
mean(one.hundred.zero.comfort.dif)
sd(one.hundred.zero.comfort.dif)


# 90% comfort v. 10% non-comfort
ninety.ten.comfort.saliva.sharer = D$lookingTime[D$ratio=="90% comfort v. 10% non-comfort" & 
                                                   D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

ninety.ten.comfort.ball.sharer = D$lookingTime[D$ratio=="90% comfort v. 10% non-comfort" & 
                                                 D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


ninety.ten.comfort.dif = ninety.ten.comfort.saliva.sharer - ninety.ten.comfort.ball.sharer
mean(ninety.ten.comfort.dif)
sd(ninety.ten.comfort.dif)


# 80% comfort v. 20% non-comfort
eighty.twenty.comfort.saliva.sharer = D$lookingTime[D$ratio=="80% comfort v. 20% non-comfort" & 
                                                      D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

eighty.twenty.comfort.ball.sharer = D$lookingTime[D$ratio=="80% comfort v. 20% non-comfort" & 
                                                    D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


eighty.twenty.comfort.dif = eighty.twenty.comfort.saliva.sharer - eighty.twenty.comfort.ball.sharer
mean(eighty.twenty.comfort.dif)
sd(eighty.twenty.comfort.dif)

# 20% comfort v. 80% non-comfort
twenty.eighty.comfort.saliva.sharer = D$lookingTime[D$ratio=="20% comfort v. 80% non-comfort" & 
                                                      D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

twenty.eighty.comfort.ball.sharer = D$lookingTime[D$ratio=="20% comfort v. 80% non-comfort" & 
                                                    D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


twenty.eighty.comfort.dif = twenty.eighty.comfort.saliva.sharer - twenty.eighty.comfort.ball.sharer
mean(twenty.eighty.comfort.dif)
sd(twenty.eighty.comfort.dif)


# 10% comfort v. 90% non-comfort
ten.ninety.comfort.saliva.sharer = D$lookingTime[D$ratio=="10% comfort v. 90% non-comfort" & 
                                                   D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

ten.ninety.comfort.ball.sharer = D$lookingTime[D$ratio=="10% comfort v. 90% non-comfort" & 
                                                 D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


ten.ninety.comfort.dif = ten.ninety.comfort.saliva.sharer - ten.ninety.comfort.ball.sharer
mean(ten.ninety.comfort.dif)
sd(ten.ninety.comfort.dif)

# 0% comfort v. 100% non-comfort
zero.one.hundred.comfort.saliva.sharer = D$lookingTime[D$ratio=="0% comfort v. 100% non-comfort" & 
                                                         D$condition=="Experimental Condition" & D$trialType=="Saliva Sharer"]

zero.one.hundred.comfort.ball.sharer = D$lookingTime[D$ratio=="0% comfort v. 100% non-comfort" & 
                                                       D$condition=="Experimental Condition" & D$trialType=="Ball Sharer"]


zero.one.hundred.comfort.dif = zero.one.hundred.comfort.saliva.sharer - zero.one.hundred.comfort.ball.sharer
mean(zero.one.hundred.comfort.dif)
sd(zero.one.hundred.comfort.dif)

# 100 v 0 compared to 90 v 10
t.test(one.hundred.zero.comfort.dif, ninety.ten.comfort.dif, paired = FALSE)

# 90 v 10 compared to 80 v 20
t.test(ninety.ten.comfort.dif, eighty.twenty.comfort.dif, paired = FALSE)


# 80 v 20 compared to 20 v 80
t.test(eighty.twenty.comfort.dif, twenty.eighty.comfort.dif, paired = FALSE)

####################
## OMNIBUS FIGURE ##
####################

# create subset dataframe
D_exp = subset(D, ! experiment %in% c("Simulation of Predictions"))
D_pred = subset(D, ! experiment %in% c("Simulation of Thomas 2B"))

# figure for "Simulation of Experiment 2A"
condition_barplot = ggplot(D_exp, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for Comfort") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~ratio) + 
  coord_cartesian(ylim=c(0, 9)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill="Trial type")  +
  theme(
    axis.text.x = element_text(size = 22, angle = 20, hjust = 1),
    axis.text.y = element_text(size = 22), 
    legend.text = element_text(size = 22),
    legend.title = element_text(size = 22),
    axis.title = element_text(size = 22),
    strip.text = element_text(size = 22), 
    axis.title.x = element_blank()
  )

D_pred = subset(D, ! experiment %in% c("Simulation of Thomas 2B"))

D_pred$ratio = 

# figure for "Simulation of Predictions"
condition_barplot = ggplot(D_pred, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for Saliva Sharing") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~ratio) + 
  coord_cartesian(ylim=c(0, 9)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill="Trial type")  +
  theme(
    axis.text.x = element_text(size = 22, angle = 20, hjust = 1),
    axis.text.y = element_text(size = 22), 
    legend.text = element_text(size = 22),
    legend.title = element_text(size = 22),
    axis.title = element_text(size = 22),
    strip.text = element_text(size = 22), 
    axis.title.x = element_blank()
  )


############################
# Simulation of Prediction #
############################

# 100 v 0 #
# Comfort Distress: CD #
setwd("C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba/simulationOfPrediction/100v0/test_ComfortingDistress")
cond600_100v0_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_100v0_5_CD$V3 = max(cond600_100v0_5_CD$V3)-cond600_100v0_5_CD$V3

cond600_100v0_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_100v0_10_CD$V3 = max(cond600_100v0_10_CD$V3)-cond600_100v0_10_CD$V3

cond700_100v0_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_100v0_5_CD$V3 = max(cond700_100v0_5_CD$V3)-cond700_100v0_5_CD$V3

cond700_100v0_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_100v0_10_CD$V3 = max(cond700_100v0_10_CD$V3)-cond700_100v0_10_CD$V3

cond800_100v0_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_100v0_5_CD$V3 = max(cond800_100v0_5_CD$V3)-cond800_100v0_5_CD$V3

cond800_100v0_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_100v0_10_CD$V3 = max(cond800_100v0_10_CD$V3)-cond800_100v0_10_CD$V3



# 90 v 10 #
# Comfort Distress: CD #
setwd("C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba/simulationOfPrediction/90v10/test_ComfortingDistress")
cond600_90v10_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_90v10_5_CD$V3 = max(cond600_90v10_5_CD$V3)-cond600_90v10_5_CD$V3

cond600_90v10_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_90v10_10_CD$V3 = max(cond600_90v10_10_CD$V3)-cond600_90v10_10_CD$V3

cond700_90v10_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_90v10_5_CD$V3 = max(cond700_90v10_5_CD$V3)-cond700_90v10_5_CD$V3

cond700_90v10_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_90v10_10_CD$V3 = max(cond700_90v10_10_CD$V3)-cond700_90v10_10_CD$V3

cond800_90v10_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_90v10_5_CD$V3 = max(cond800_90v10_5_CD$V3)-cond800_90v10_5_CD$V3

cond800_90v10_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_90v10_10_CD$V3 = max(cond800_90v10_10_CD$V3)-cond800_90v10_10_CD$V3



# 80 v 20 #
# Comfort Distress: CD #
setwd("C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba/simulationOfPrediction/80v20/test_ComfortingDistress")
cond600_80v20_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_80v20_5_CD$V3 = max(cond600_80v20_5_CD$V3)-cond600_80v20_5_CD$V3

cond600_80v20_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_80v20_10_CD$V3 = max(cond600_80v20_10_CD$V3)-cond600_80v20_10_CD$V3

cond700_80v20_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_80v20_5_CD$V3 = max(cond700_80v20_5_CD$V3)-cond700_80v20_5_CD$V3

cond700_80v20_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_80v20_10_CD$V3 = max(cond700_80v20_10_CD$V3)-cond700_80v20_10_CD$V3

cond800_80v20_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_80v20_5_CD$V3 = max(cond800_80v20_5_CD$V3)-cond800_80v20_5_CD$V3

cond800_80v20_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_80v20_10_CD$V3 = max(cond800_80v20_10_CD$V3)-cond800_80v20_10_CD$V3


# 0 v 100 #
# Comfort Distress: CD #
setwd("C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/reviewer1RequestedRevision/3ba/simulationOfPrediction/0v100/test_ComfortingDistress")
cond600_0v100_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_0v100_5_CD$V3 = max(cond600_0v100_5_CD$V3)-cond600_0v100_5_CD$V3

cond600_0v100_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond600_0v100_10_CD$V3 = max(cond600_0v100_10_CD$V3)-cond600_0v100_10_CD$V3

cond700_0v100_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_0v100_5_CD$V3 = max(cond700_0v100_5_CD$V3)-cond700_0v100_5_CD$V3

cond700_0v100_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond700_0v100_10_CD$V3 = max(cond700_0v100_10_CD$V3)-cond700_0v100_10_CD$V3

cond800_0v100_5_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_0v100_5_CD$V3 = max(cond800_0v100_5_CD$V3)-cond800_0v100_5_CD$V3

cond800_0v100_10_CD = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond800_0v100_10_CD$V3 = max(cond800_0v100_10_CD$V3)-cond800_0v100_10_CD$V3











# 100 v 0 #
# Comfort Distress Control: CDC #
