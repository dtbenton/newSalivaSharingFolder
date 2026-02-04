#########################################################
# THOMAS MODEL EXAMPLE GENERATION SCRIPT: SIMULATION 3B #
#########################################################

###################################
# GENERATE VECTORS FOR SIMULATION #
###################################
############
## OBJECT ##
############

objects_stim = diag(64)
objects_stim_full = as.data.frame(objects_stim)

names(objects_stim_full) = NULL
rownames(objects_stim_full) = NULL
row.names(objects_stim_full) = NULL

#####################
## SALIVA IDENTITY ##
#####################

saliva_left_identity = data.frame(x = c('1 0', '0 1'))
names(saliva_left_identity) = NULL

saliva_right_identity = data.frame(x = c('1 0', '0 1'))
names(saliva_right_identity) = NULL

# SALIVA SHARER: 1 0
# NON-SALIVA SHARER: 0 1


######################
## COMFORT IDENTITY ##
######################

comfort_left_identity = data.frame(x = c('1 0', '0 1'))
names(comfort_left_identity) = NULL

comfort_right_identity = data.frame(x = c('1 0', '0 1'))
names(comfort_right_identity) = NULL

# COMFORTER: 1 0
# NON-COMFORTER: 0 1

##############
## DISTRESS ##
##############

distress = data.frame(x = c('1 0', '0 1'))
names(distress) = NULL

# DISTRESSED: 1 0 
# NON-DISTRESSED: 0  1


############
## ACTION ##
############

saliva_action = data.frame(x = c('1 0', '0 1'))
names(saliva_action) = NULL

# SHARING SALIVA: 1 0 
# SHARING OTHER THINGS: 0 1


#############
## COMFORT ##
#############

comfort_action = data.frame(x = c('1 0', '0 1'))
names(comfort_action) = NULL

# COMFORT: 1 0
# NON-COMFORT: 0 1

################
## FOOD ITEMS ##
################

food_items = diag(1)
food_items = as.data.frame(food_items)
names(food_items) = NULL

########################
########################
##  PRETRAIN EXAMPLES ##
########################
########################

##########################################################
## Non-saliva sharing examples used for all simulations ##
##########################################################
# nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
nonsaliva_sharer_left = objects_stim_full[21:30,]
nonsaliva_sharer_right = objects_stim_full[31:40,]

names(nonsaliva_sharer_left) = NULL
rownames(nonsaliva_sharer_left) = NULL
row.names(nonsaliva_sharer_left) = NULL

names(nonsaliva_sharer_right) = NULL
rownames(nonsaliva_sharer_right) = NULL
row.names(nonsaliva_sharer_right) = NULL


# nonsaliva sharing_id nonsaliva sharing --> noncomfort distress
nonsaliva_sharer_left_a = objects_stim_full[41:50,]
nonsaliva_sharer_right_a = objects_stim_full[51:60,]

names(nonsaliva_sharer_left_a) = NULL
rownames(nonsaliva_sharer_left_a) = NULL
row.names(nonsaliva_sharer_left_a) = NULL

names(nonsaliva_sharer_right_a) = NULL
rownames(nonsaliva_sharer_right_a) = NULL
row.names(nonsaliva_sharer_right_a) = NULL

##############
## 100 v. 0 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left = objects_stim_full[1:10,]
saliva_sharer_right = objects_stim_full[11:20,]

names(saliva_sharer_left) = NULL
rownames(saliva_sharer_left) = NULL
row.names(saliva_sharer_left) = NULL

names(saliva_sharer_right) = NULL
rownames(saliva_sharer_right) = NULL
row.names(saliva_sharer_right) = NULL



##############
## 90 v. 10 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left_90 = objects_stim_full[1:9,]
saliva_sharer_right_90 = objects_stim_full[12:20,]

names(saliva_sharer_left_90) = NULL
rownames(saliva_sharer_left_90) = NULL
row.names(saliva_sharer_left_90) = NULL

names(saliva_sharer_right_90) = NULL
rownames(saliva_sharer_right_90) = NULL
row.names(saliva_sharer_right_90) = NULL


saliva_sharer_left_10 = objects_stim_full[10,]
saliva_sharer_right_10 = objects_stim_full[11,]

names(saliva_sharer_left_10) = NULL
rownames(saliva_sharer_left_10) = NULL
row.names(saliva_sharer_left_10) = NULL

names(saliva_sharer_right_10) = NULL
rownames(saliva_sharer_right_10) = NULL
row.names(saliva_sharer_right_10) = NULL


##############
## 80 v. 20 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left_80 = objects_stim_full[1:8,]
saliva_sharer_right_80 = objects_stim_full[13:20,]

names(saliva_sharer_left_80) = NULL
rownames(saliva_sharer_left_80) = NULL
row.names(saliva_sharer_left_80) = NULL

names(saliva_sharer_right_80) = NULL
rownames(saliva_sharer_right_80) = NULL
row.names(saliva_sharer_right_80) = NULL


saliva_sharer_left_20 = objects_stim_full[9:10,]
saliva_sharer_right_20 = objects_stim_full[11:12,]

names(saliva_sharer_left_20) = NULL
rownames(saliva_sharer_left_20) = NULL
row.names(saliva_sharer_left_20) = NULL

names(saliva_sharer_right_20) = NULL
rownames(saliva_sharer_right_20) = NULL
row.names(saliva_sharer_right_20) = NULL

##############
## 0 v. 100 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left_100r = objects_stim_full[1:10,]
saliva_sharer_right_100r = objects_stim_full[11:20,]

names(saliva_sharer_left_100r) = NULL
rownames(saliva_sharer_left_100r) = NULL
row.names(saliva_sharer_left_100r) = NULL

names(saliva_sharer_right_100r) = NULL
rownames(saliva_sharer_right_100r) = NULL
row.names(saliva_sharer_right_100r) = NULL



##############
## 10 v. 90 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left_10r = objects_stim_full[1,]
saliva_sharer_right_10r = objects_stim_full[11,]

names(saliva_sharer_left_10r) = NULL
rownames(saliva_sharer_left_10r) = NULL
row.names(saliva_sharer_left_10r) = NULL

names(saliva_sharer_right_10r) = NULL
rownames(saliva_sharer_right_10r) = NULL
row.names(saliva_sharer_right_10r) = NULL


saliva_sharer_left_90r = objects_stim_full[2:10,]
saliva_sharer_right_90r = objects_stim_full[12:20,]

names(saliva_sharer_left_90r) = NULL
rownames(saliva_sharer_left_90r) = NULL
row.names(saliva_sharer_left_90r) = NULL

names(saliva_sharer_right_90r) = NULL
rownames(saliva_sharer_right_90r) = NULL
row.names(saliva_sharer_right_90r) = NULL


##############
## 20 v. 80 ##
##############
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
# saliva sharing_id saliva sharing --> comfort distress
saliva_sharer_left_20r = objects_stim_full[1:2,]
saliva_sharer_right_20r = objects_stim_full[11:12,]

names(saliva_sharer_left_20r) = NULL
rownames(saliva_sharer_left_20r) = NULL
row.names(saliva_sharer_left_20r) = NULL

names(saliva_sharer_right_20r) = NULL
rownames(saliva_sharer_right_20r) = NULL
row.names(saliva_sharer_right_20r) = NULL


saliva_sharer_left_80r = objects_stim_full[3:10,]
saliva_sharer_right_80r = objects_stim_full[13:20,]

names(saliva_sharer_left_80r) = NULL
rownames(saliva_sharer_left_80r) = NULL
row.names(saliva_sharer_left_80r) = NULL

names(saliva_sharer_right_80r) = NULL
rownames(saliva_sharer_right_80r) = NULL
row.names(saliva_sharer_right_80r) = NULL


###################################
## HABITUATION AND TEST EXAMPLES ##
###################################

test_saliva_sharer = objects_stim_full[61,]
saliva_puppet = objects_stim_full[62,]
nonsaliva_puppet = objects_stim_full[63,]
test_ball_sharer = objects_stim_full[64,]

names(test_saliva_sharer) = NULL
rownames(test_saliva_sharer) = NULL
row.names(test_saliva_sharer) = NULL

names(test_ball_sharer) = NULL
rownames(test_ball_sharer) = NULL
row.names(test_ball_sharer) = NULL

names(saliva_puppet) = NULL
rownames(saliva_puppet) = NULL
row.names(saliva_puppet) = NULL

names(nonsaliva_puppet) = NULL
rownames(nonsaliva_puppet) = NULL
row.names(nonsaliva_puppet) = NULL



#################
## PRETRAINING ##
#################
setwd("C:/Users/bentod2/Documents/projects/current/salivaModel/model/requestedRevisionsModel/simulation3b")

l = 1
l1 = 1
l1a = 1
l2 = 1
l3 = 1
l4 = 1
l5 = 1
l6 = 1
l7 = 1
l8 = 1
l9 = 1
l10 = 1
l11 = 1
l12 = 1

################
### 100 v. 0 ###
################
sink('pretrain_100_0.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress comfort --> saliva sharing_id distress comfort
for(i in 1:nrow(saliva_sharer_left)){
  cat(paste("name: salivaSharingID_distressComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}
sink()



################
### 90 v. 10 ###
################
sink('pretrain_90_10.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress comfort --> saliva sharing_id distress comfort
for(i in 1:nrow(saliva_sharer_left_90)){
  cat(paste("name: salivaSharingID_distressComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_90[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_90[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_90[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_90[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (6) T1: saliva sharing_id distress noncomfort --> saliva sharing_id distress noncomfort
for(i in 1:nrow(saliva_sharer_left_10)){
  cat(paste("name: salivaSharingID_distressNonComfort", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_10[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_10[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_10[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_10[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l4, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l4 = l4+1
}
sink()



################
### 80 v. 20 ###
################
sink('pretrain_80_20.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress comfort --> saliva sharing_id distress comfort
for(i in 1:nrow(saliva_sharer_left_80)){
  cat(paste("name: salivaSharingID_distressComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_80[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_80[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_80[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_80[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (6) T1: saliva sharing_id distress noncomfort --> saliva sharing_id distress noncomfort
for(i in 1:nrow(saliva_sharer_left_20)){
  cat(paste("name: salivaSharingID_distressNonComfort", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_20[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_20[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_20[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_20[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l4, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l4 = l4+1
}
sink()

################
### 0r v. 100r ###
################
sink('pretrain_0r_100r.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress noncomfort --> saliva sharing_id distress noncomfort
for(i in 1:nrow(saliva_sharer_left_100r)){
  cat(paste("name: salivaSharingID_distressNonComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_100r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_100r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_100r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_100r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}
sink()

##################
### 10r v. 90r ###
##################
sink('pretrain_10r_90r.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress comfort --> saliva sharing_id distress comfort
for(i in 1:nrow(saliva_sharer_left_10r)){
  cat(paste("name: salivaSharingID_distressComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_10r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_10r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_10r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_10r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (6) T1: saliva sharing_id distress noncomfort --> saliva sharing_id distress noncomfort
for(i in 1:nrow(saliva_sharer_left_90r)){
  cat(paste("name: salivaSharingID_distressNonComfort", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_90r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_90r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_90r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_90r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l4, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l4 = l4+1
}
sink()

##################
### 20r v. 80r ###
##################
sink('pretrain_20r_80r.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

for(i in 1:nrow(food_items)){
  # (1) T1: saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_IN)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_IN)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_IN)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_IN)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OUTPUT
    cat(paste("T:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_OUT)", sep="\t"))
    print(saliva_sharer_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_left_identity
    cat(paste("(saliva_left_identity_OUT)", sep="\t"))
    print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(saliva_sharer_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # saliva_right_identity
    cat(paste("(saliva_right_identity_OUT)", sep="\t"))
    print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    l = l+1
  }
}


# (6) T1: saliva sharing_id distress comfort --> saliva sharing_id distress comfort
for(i in 1:nrow(saliva_sharer_left_20r)){
  cat(paste("name: salivaSharingID_distressComfort", l1, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_20r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_20r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_20r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_20r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l1 = l1+1
}

# (6) T1: saliva sharing_id distress noncomfort --> saliva sharing_id distress noncomfort
for(i in 1:nrow(saliva_sharer_left_80r)){
  cat(paste("name: salivaSharingID_distressNonComfort", l2, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(saliva_sharer_left_80r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(saliva_sharer_right_80r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(saliva_sharer_left_80r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(saliva_sharer_right_80r[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (3) T1: nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l3, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l3 = l3+1
}

# (7) T1: nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
for(i in 1:nrow(nonsaliva_sharer_left_a)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l4, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_IN)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_IN)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_IN)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_IN)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(nonsaliva_sharer_left_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_left_identity
  cat(paste("(saliva_left_identity_OUT)", sep="\t"))
  print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(nonsaliva_sharer_right_a[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # saliva_right_identity
  cat(paste("(saliva_right_identity_OUT)", sep="\t"))
  print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l4 = l4+1
}
sink()

#########################
## HABITUATION AND TEST #
#########################
sink('familiarization_exp_2b.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: salivaSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_IN)", sep="\t"))
print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_IN)", sep="\t"))
print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# FOOD
cat(paste("(Food_IN)", sep="\t"))
print(food_items[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_OUT)", sep="\t"))
print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_OUT)", sep="\t"))
print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# FOOD
cat(paste("(Food_OUT)", sep="\t"))
print(food_items[1,], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: ballSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_left_identity_IN)", sep="\t"))
print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_IN)", sep="\t"))
print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_OUT)", sep="\t"))
print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_OUT)", sep="\t"))
print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()

sink('test_exp_2b.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: foodSharer", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_IN)", sep="\t"))
print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_IN)", sep="\t"))
print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_IN)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_IN)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_OUT)", sep="\t"))
print(saliva_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_OUT)", sep="\t"))
print(saliva_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)


# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: ballSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_left_identity_IN)", sep="\t"))
print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_IN)", sep="\t"))
print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_IN)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_IN)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_left_identity
cat(paste("(saliva_left_identity_OUT)", sep="\t"))
print(saliva_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# saliva_right_identity
cat(paste("(saliva_right_identity_OUT)", sep="\t"))
print(saliva_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()



sink('test_exp_2d.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: foodSharer", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(nonsaliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_IN)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_IN)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(nonsaliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)


# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: ballSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(nonsaliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# DISTRESS
cat(paste("(Distress_IN)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_IN)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(nonsaliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()