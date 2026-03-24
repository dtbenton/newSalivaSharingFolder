#########################################
#########################################
##                                     ##
## SIMULATION FOR CONDITIONS 1, 2, & 3 ##
##                                     ##
#########################################
#########################################


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

## load data from Experiment 2B ##

root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/exp2B"

read_one = function(path) {
  df = read.table(path, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("V1", "V2", "V3")
  
  # Flip V3 within-file
  df$V3 = max(df$V3, na.rm = TRUE) - df$V3
  
  # Trial type (assumes 40 rows total)
  df$trialType = rep(c("Saliva-Sharer", "Ball-Sharer"), each = 1, times = 20)
  
  # Metadata
  df$condition_folder = basename(dirname(path))
  df$file = basename(path)
  
  # Use filename without extension for safer parsing
  fname = tools::file_path_sans_ext(df$file)
  
  # Grab pEpochs and tEpochs even if extra tokens are in between (e.g., exp2B)
  m = regexec("pEpochs_(\\d+).*?tEpochs_(\\d+)", fname)
  hit = regmatches(fname, m)[[1]]
  
  if (length(hit) == 3) {
    df$pEpochs = as.integer(hit[2])
    df$tEpochs = as.integer(hit[3])
  } else {
    df$pEpochs = NA_integer_
    df$tEpochs = NA_integer_
  }
  
  # Optional: condition token if present
  mC = regexec("condition_([0-9]+v[0-9]+)", fname)
  hitC = regmatches(fname, mC)[[1]]
  df$condition = if (length(hitC) == 2) hitC[2] else NA_character_
  
  # Optional: exp tag works for exp2B or exp_2b, etc.
  m2 = regexec("exp_?([A-Za-z0-9]+)", fname)
  hit2 = regmatches(fname, m2)[[1]]
  df$exp_tag = if (length(hit2) == 2) hit2[2] else NA_character_
  
  df
}

# If your files truly end in .txt, keep this; if extensions are hidden/variable, see note below
files = list.files(root, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)

D.2B = do.call(rbind, lapply(files, read_one))
D.2B = as.data.frame(D.2B)



## load data from Experiment 2D ##
root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/exp2D"

read_one = function(path) {
  df = read.table(path, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("V1", "V2", "V3")
  
  # Flip V3 within-file
  df$V3 = max(df$V3, na.rm = TRUE) - df$V3
  
  # Trial type (assumes 40 rows total)
  df$trialType = rep(c("Saliva-Sharer", "Ball-Sharer"), each = 1, times = 20)
  
  # Metadata
  df$condition_folder = basename(dirname(path))
  df$file = basename(path)
  
  # Use filename without extension for safer parsing
  fname = tools::file_path_sans_ext(df$file)
  
  # Grab pEpochs and tEpochs even if extra tokens are in between (e.g., exp2B)
  m = regexec("pEpochs_(\\d+).*?tEpochs_(\\d+)", fname)
  hit = regmatches(fname, m)[[1]]
  
  if (length(hit) == 3) {
    df$pEpochs = as.integer(hit[2])
    df$tEpochs = as.integer(hit[3])
  } else {
    df$pEpochs = NA_integer_
    df$tEpochs = NA_integer_
  }
  
  # Optional: condition token if present
  mC = regexec("condition_([0-9]+v[0-9]+)", fname)
  hitC = regmatches(fname, mC)[[1]]
  df$condition = if (length(hitC) == 2) hitC[2] else NA_character_
  
  # Optional: exp tag works for exp2B or exp_2b, etc.
  m2 = regexec("exp_?([A-Za-z0-9]+)", fname)
  hit2 = regmatches(fname, m2)[[1]]
  df$exp_tag = if (length(hit2) == 2) hit2[2] else NA_character_
  
  df
}

# If your files truly end in .txt, keep this; if extensions are hidden/variable, see note below
files = list.files(root, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)

D.2D = do.call(rbind, lapply(files, read_one))
D.2D = as.data.frame(D.2D)


## load data from Experiment 3B ##
root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/exp3B"

read_one = function(path) {
  df = read.table(path, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("V1", "V2", "V3")
  
  # Flip V3 within-file
  df$V3 = max(df$V3, na.rm = TRUE) - df$V3
  
  # Trial type (assumes 40 rows total)
  df$trialType = rep(c("Saliva-Sharer", "Ball-Sharer"), each = 1, times = 20)
  
  # Metadata
  df$condition_folder = basename(dirname(path))
  df$file = basename(path)
  
  # Use filename without extension for safer parsing
  fname = tools::file_path_sans_ext(df$file)
  
  # Grab pEpochs and tEpochs even if extra tokens are in between (e.g., exp2B)
  m = regexec("pEpochs_(\\d+).*?tEpochs_(\\d+)", fname)
  hit = regmatches(fname, m)[[1]]
  
  if (length(hit) == 3) {
    df$pEpochs = as.integer(hit[2])
    df$tEpochs = as.integer(hit[3])
  } else {
    df$pEpochs = NA_integer_
    df$tEpochs = NA_integer_
  }
  
  # Optional: condition token if present
  mC = regexec("condition_([0-9]+v[0-9]+)", fname)
  hitC = regmatches(fname, mC)[[1]]
  df$condition = if (length(hitC) == 2) hitC[2] else NA_character_
  
  # Optional: exp tag works for exp2B or exp_2b, etc.
  m2 = regexec("exp_?([A-Za-z0-9]+)", fname)
  hit2 = regmatches(fname, m2)[[1]]
  df$exp_tag = if (length(hit2) == 2) hit2[2] else NA_character_
  
  df
}

# If your files truly end in .txt, keep this; if extensions are hidden/variable, see note below
files = list.files(root, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)

D.3B = do.call(rbind, lapply(files, read_one))
D.3B = as.data.frame(D.3B)

# combine the dataframes
D = rbind(D.2B, D.2D, D.3B)

D = as.data.frame(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:360, each = 2)

D = D[order(D$ID),] 

# epoch
D$pretrainEpoch = rep(c("600", "700", "800"), each = 80, times = 3)
D$pretrainEpoch = as.factor(D$pretrainEpoch)

# famEpoch
D$famEpoch = rep(c("10", "5"), each = 40, times = 9)
D$famEpoch = as.factor(D$famEpoch)

# create trial type column
D$trialType = rep(c("Saliva Sharer", "Non-saliva Sharer"), each = 1, times = 360)
D$trialType = as.factor(D$trialType)

# create condition column
D$condition = rep(c("Condition 1", "Condition 2", "Condition 3"), 
                  each = 240)
D$condition = as.factor(D$condition)


# create a 'looking time' column
D$lookingTime = D$V3

#(max(error) - error)

# rearrange dataframe
D = D[,c("ID", "condition", "pretrainEpoch", "famEpoch",
         "trialType", "lookingTime")]


## MAIN ANALYSIS ##
lm.fit = lme(lookingTime~(trialType+condition+pretrainEpoch)^3, 
             random=~1|ID, 
      data = D)
anova.lme(lm.fit)


# condition x trial type: interaction
# condition 1
t.test(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Saliva Sharer"],
       D$lookingTime[D$condition=="Condition 1" & D$trialType=="Ball Sharer"], 
       paired = TRUE)
mean(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Saliva Sharer"])
sd(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Saliva Sharer"])
mean(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Ball Sharer"])
sd(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Ball Sharer"])


# condition 3
t.test(D$lookingTime[D$condition=="Condition 3" & D$trialType=="Saliva Sharer"],
       D$lookingTime[D$condition=="Condition 3" & D$trialType=="Ball Sharer"], 
       paired = TRUE)
mean(D$lookingTime[D$condition=="Condition 3" & D$trialType=="Saliva Sharer"])
sd(D$lookingTime[D$condition=="Condition 3" & D$trialType=="Saliva Sharer"])
mean(D$lookingTime[D$condition=="Condition 3" & D$trialType=="Ball Sharer"])
sd(D$lookingTime[D$condition=="Condition 3" & D$trialType=="Ball Sharer"])


# condition 2
t.test(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Saliva Sharer"],
       D$lookingTime[D$condition=="Condition 2" & D$trialType=="Ball Sharer"], 
       paired = TRUE)
mean(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Saliva Sharer"])
sd(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Saliva Sharer"])
mean(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Ball Sharer"])
sd(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Ball Sharer"])

# difference analysis 

conditions_1_3_food_sharer = c(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Saliva Sharer"],
                               D$lookingTime[D$condition=="Condition 3" & D$trialType=="Saliva Sharer"])
conditions_1_3_ball_sharer = c(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Ball Sharer"],
                               D$lookingTime[D$condition=="Condition 3" & D$trialType=="Ball Sharer"])

conditions_1_3_dif = conditions_1_3_food_sharer - conditions_1_3_ball_sharer
conditions_2_dif = D$lookingTime[D$condition=="Condition 2" & D$trialType=="Saliva Sharer"]-
  D$lookingTime[D$condition=="Condition 2" & D$trialType=="Ball Sharer"]

t.test(conditions_1_3_dif, conditions_2_dif, paired=FALSE)

mean(conditions_1_3_dif)
sd(conditions_1_3_dif)

mean(conditions_2_dif)
sd(conditions_2_dif)

####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for Comfort") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~pretrainEpoch) + 
  coord_cartesian(ylim=c(0, 18)) +
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




###################################
###################################
##                               ##
## SIMULATION FOR CONDITIONS 4-5 ##
##                               ##
###################################
###################################

setwd("C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/prediction")
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


setwd("C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/predictionControl")
cond56005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond56005$V3 = max(cond56005$V3)-cond56005$V3

cond560010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond560010$V3 = max(cond560010$V3)-cond560010$V3

cond57005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond57005$V3 = max(cond57005$V3)-cond57005$V3

cond570010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond570010$V3 = max(cond570010$V3)-cond570010$V3

cond58005 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond58005$V3 = max(cond58005$V3)-cond58005$V3

cond580010 = read.table(file.choose(), header = FALSE, stringsAsFactors = FALSE)
cond580010$V3 = max(cond580010$V3)-cond580010$V3

# combine dataframes into a single 'D' data frame
D.c1 = rbind(cond46005, cond460010, cond47005, cond470010, cond48005, cond480010)

D.c2 = rbind(cond56005, cond560010, cond57005, cond570010, cond58005, cond580010)


D = rbind(D.c1, D.c2)

D = as.data.frame(D)

# get dimensionality of D
dim(D)

# create an ID column
D$ID = rep(1:240, each = 2)

D = D[order(D$ID),] 

# create trial type column
D$trialType = rep(c("Comforter", "Non-comforter"), each = 1, times = 240)
D$trialType = as.factor(D$trialType)

D$trialType <- factor(
  D$trialType,
  levels = c("Non-comforter", "Comforter")
)

# epoch
D$pretrainEpoch = rep(c("600", "700", "800"), each = 2, times = 80)
D$pretrainEpoch = as.factor(D$pretrainEpoch)


# create condition column
D$condition = rep(c("Condition 1", "Condition 2"), 
                  each = 240)
D$condition = as.factor(D$condition)


# create a 'looking time' column
D$lookingTime = D$V3

#(max(error) - error)

# remove columns
D = D[,-c(1:3)]

## MAIN ANALYSIS ##
lm.fit = lme(lookingTime~(trialType+condition+pretrainEpoch)^3, 
             random=~1|ID, 
             data = D)
anova.lme(lm.fit)

# condition x test trial interaction

# Condition 1
t.test(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Comforter"],
       D$lookingTime[D$condition=="Condition 1" & D$trialType=="Non-comforter"], 
       paired = TRUE)
mean(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Comforter"])
sd(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Comforter"])
mean(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Non-comforter"])
sd(D$lookingTime[D$condition=="Condition 1" & D$trialType=="Non-comforter"])


# Condition 2
t.test(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Comforter"],
       D$lookingTime[D$condition=="Condition 2" & D$trialType=="Non-comforter"], 
       paired = TRUE)
mean(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Comforter"])
sd(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Comforter"])
mean(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Non-comforter"])
sd(D$lookingTime[D$condition=="Condition 2" & D$trialType=="Non-comforter"])


####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for Saliva Sharing") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~pretrainEpoch) + 
  coord_cartesian(ylim=c(0, 15)) +
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(
    axis.text.x = element_text(size = 22),
    axis.text.y = element_text(size = 22), 
    legend.text = element_text(size = 22),
    legend.title = element_text(size = 22),
    axis.title = element_text(size = 22),
    strip.text = element_text(size = 22), 
    axis.title.x = element_blank()
  )




###################################
###################################
##                               ##
##       DEVELOPMENTAL DATA      ##
##                               ##
###################################
###################################

root = "C:/Users/bentod2/Documents/projects/current/newSalivaSharingFolder/data/devSim"
#root = "C:/Users/Deon T. Benton/Documents/projects/newSalivaSharingFolder/data/devSim"
#root = "C:/Users/detbe/Documents/projects/newSalivaSharingFolder/data/devSim"

read_one = function(path) {
  
  df = read.table(path, header = FALSE, stringsAsFactors = FALSE)
  names(df) = c("V1", "V2", "V3")
  
  # Flip V3 within-file
  df$V3 = max(df$V3, na.rm = TRUE) - df$V3
  
  # Metadata: folder + file
  df$file = basename(path)
  df$exp  = basename(dirname(path))   # "exp2B" or "exp2D"
  
  # Parse: lRates, hUnits, pEpochs, tEpochs from filename
  # Works for: lRates_0.0208_hUnits_14_pEpochs_200_exp2D_tEpochs_10.txt
  m = regexec(
    "lRates_([0-9.]+)_hUnits_(\\d+)_pEpochs_(\\d+)_([^_]+)_tEpochs_(\\d+)",
    df$file
  )
  hit = regmatches(df$file, m)[[1]]
  
  if (length(hit) == 6) {
    df$lRate  = as.numeric(hit[2])
    df$hUnits = as.integer(hit[3])
    df$pEpochs = as.integer(hit[4])
    df$exp_from_name = hit[5]          # should be "exp2B" or "exp2D"
    df$tEpochs = as.integer(hit[6])
  } else {
    df$lRate  = NA_real_
    df$hUnits = NA_integer_
    df$pEpochs = NA_integer_
    df$exp_from_name = NA_character_
    df$tEpochs = NA_integer_
  }
  
  # trialType from V2 (since your files already label rows)
  v2 = tolower(df$V2)
  if (all(grepl("foodsharer|ballsharing", v2))) {
    df$trialType = ifelse(grepl("foodsharer", v2), "Food-Sharer", "Ball-Sharer")
  } else {
    df$trialType = df$V2  # fallback: keep whatever labels are there
  }
  
  df
}

# Find all txt files under devSim (both exp2B and exp2D)
files = list.files(root, pattern = "\\.txt$", full.names = TRUE, recursive = TRUE)

# Read + combine
D = do.call(rbind, lapply(files, read_one))
D = as.data.frame(D)
row.names(D) = NULL



# create an ID column
D$ID = rep(1:240, each = 2)

# add age column 
D$age = rep(c("Young", "Intermediate", "Old"), 
            each = 80, times = 2)
D$age = as.factor(D$age)

D$age = factor(D$age, levels = c("Young", "Intermediate", "Old"))
# create trial type column
D$trialType = rep(c("Saliva Sharer", "Non-saliva Sharer"), each = 1, times = 240)
D$trialType = as.factor(D$trialType)

#create condition column
D$condition = rep(c("Condition 1", "Condition 2"), each = 240)
D$condition = as.factor(D$condition)

# create pretrainEpochs column
D$pretrainEpoch = rep(c("100", "300", "600"), each = 80, times = 2)
D$pretrainEpoch = as.factor(D$pretrainEpoch)

# create a 'looking time' column
D$lookingTime = D$V3

#(max(error) - error)

# remove columns
names(D)
D = D[,c("ID","age", "condition", "pretrainEpoch", "trialType", "lookingTime")]
fix(D)

#################
# Main analysis #
#################
lm.fit = lme(lookingTime~(trialType+age+condition)^3, 
             random=~1|ID, 
             data = D)
anova.lme(lm.fit)

## follow-up analysis: Young
# experimental
young.salivasharer.experimental = D$lookingTime[D$age=="Young" & 
                                                  D$condition=="Condition 1" & 
                                                  D$trialType=="Saliva Sharer"]
young.ballsharer.experimental = D$lookingTime[D$age=="Young" & 
                                                D$condition=="Condition 1" & 
                                                D$trialType=="Ball Sharer"]
t.test(young.salivasharer.experimental,
       young.ballsharer.experimental, paired = TRUE)

mean(young.salivasharer.experimental)
sd(young.salivasharer.experimental)

mean(young.ballsharer.experimental)
sd(young.ballsharer.experimental)





## follow-up analysis: early intermediate
# experimental
intermediate.salivasharer.experimental = D$lookingTime[D$age=="Intermediate" & 
                                                               D$condition=="Condition 1" & 
                                                               D$trialType=="Saliva Sharer"]
intermediate.ballsharer.experimental = D$lookingTime[D$age=="Intermediate" & 
                                                             D$condition=="Condition 1" & 
                                                             D$trialType=="Ball Sharer"]
t.test(intermediate.salivasharer.experimental,
       intermediate.ballsharer.experimental, paired = TRUE)

mean(intermediate.salivasharer.experimental)
sd(intermediate.salivasharer.experimental)

mean(intermediate.ballsharer.experimental)
sd(intermediate.ballsharer.experimental)




## follow-up analysis: old
# experimental
old.salivasharer.experimental = D$lookingTime[D$age=="Old" & 
                                                D$condition=="Condition 1" & 
                                                D$trialType=="Saliva Sharer"]
old.ballsharer.experimental = D$lookingTime[D$age=="Old" & 
                                              D$condition=="Condition 1" & 
                                              D$trialType=="Ball Sharer"]
t.test(old.salivasharer.experimental,
       old.ballsharer.experimental, paired = TRUE)

mean(old.salivasharer.experimental)
sd(old.salivasharer.experimental)

mean(old.ballsharer.experimental)
sd(old.ballsharer.experimental)



# difference analysis 
young.dif = D$lookingTime[D$age=="Young" & 
                            D$condition=="Condition 1" & 
                            D$trialType=="Saliva Sharer"] -
  D$lookingTime[D$age=="Young" & 
                  D$condition=="Condition 1" & 
                  D$trialType=="Ball Sharer"]
mean(young.dif)
sd(young.dif)

intermediate.dif = D$lookingTime[D$age=="Intermediate" & 
                                         D$condition=="Condition 1" & 
                                         D$trialType=="Saliva Sharer"] -
  D$lookingTime[D$age=="Intermediate" & 
                  D$condition=="Condition 1" & 
                  D$trialType=="Ball Sharer"]

mean(intermediate.dif)
sd(intermediate.dif)


old.dif = D$lookingTime[D$age=="Old" & 
                                   D$condition=="Condition 1" & 
                                   D$trialType=="Saliva Sharer"] -
  D$lookingTime[D$age=="Old" & 
                  D$condition=="Condition 1" & 
                  D$trialType=="Ball Sharer"]

mean(old.dif)
sd(old.dif)





t.test(young.dif,intermediate.dif, paired=FALSE)

t.test(intermediate.dif,old.dif, paired=FALSE)

t.test(young.dif,old.dif, paired=FALSE)

# compute difference analysis
D$dif = D$lookingTime[D$trialType=="Saliva Sharer"] - 
  D$lookingTime[D$trialType=="Ball Sharer"]

D_wide = reshape(D, idvar = "ID", 
                 timevar   = "trialType", 
                 direction = "wide")

names(D_wide)

names(D_wide)[names(D_wide) == "lookingTime.Saliva Sharer"] = "Saliva_Sharing"
names(D_wide)[names(D_wide) == "lookingTime.Ball Sharer"] = "Ball_Sharing"

D_wide$dif = D_wide$Saliva_Sharing - D_wide$Ball_Sharing

D_wide$pretrainEpoch = D_wide$`pretrainEpoch.Ball Sharer`
D_wide$pretrainEpoch = as.numeric(D_wide$pretrainEpoch)
D_wide$pretrainEpoch = ordered(D_wide$pretrainEpoch)

lm.fit = lm(dif~as.factor(pretrainEpoch), data = D_wide)
summary(lm.fit)
####################
## OMNIBUS FIGURE ##
####################
# figure
condition_barplot = ggplot(D, aes(condition, lookingTime, fill=trialType)) # create the bar graph with test.trial.2 on the x-axis and measure on the y-axis
condition_barplot + stat_summary(fun = mean, geom = "bar", position = "dodge") + # add the bars, which represent the means and the place them side-by-side with 'dodge'
  stat_summary(fun.data=mean_cl_boot, geom = "errorbar", position = position_dodge(width=0.90), width = 0.2) + # add errors bars
  ylab("Expectation for Comfort") + # change the label of the y-axis
  scale_y_continuous(expand = c(0, 0)) +
  facet_wrap(~age, scales = "free_y") + 
  scale_fill_manual(values = c("black", "azure3")) +
  labs(fill='Test Trial')  +
  theme(
    axis.text.x = element_text(size = 22),
    axis.text.y = element_text(size = 22), 
    legend.text = element_text(size = 22),
    legend.title = element_text(size = 22),
    axis.title = element_text(size = 22),
    strip.text = element_text(size = 22), 
    axis.title.x = element_blank()
  ) 
