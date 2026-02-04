#################################################################
# THOMAS MODEL EXAMPLE GENERATION SCRIPT: ORIGINAL MODEL FOLDER #
#################################################################

###################################
# GENERATE VECTORS FOR SIMULATION #
###################################
############
## OBJECT ##
############

objects_stim = diag(104)
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

# SALIVA SHARER: 1 
# NON-SALIVA SHARER: 0 


######################
## COMFORT IDENTITY ##
######################

comfort_left_identity = data.frame(x = c('1 0', '0 1'))
names(comfort_left_identity) = NULL

comfort_right_identity = data.frame(x = c('1 0', '0 1'))
names(comfort_right_identity) = NULL

# COMFORTER: 1 
# NON-COMFORTER: 0 

##############
## DISTRESS ##
##############

distress = data.frame(x = c('1 0', '0 1'))
names(distress) = NULL

# DISTRESSED: 1 
# NON-DISTRESSED: 0  


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

# COMFORT: 1 
# NON-COMFORT: 0 

################
## FOOD ITEMS ##
################

food_items = diag(5)
food_items = as.data.frame(food_items)
names(food_items) = NULL

# food 1: 1 0 0 0 0
# food 2: 0 1 0 0 0
# food 3: 0 0 1 0 0
# food 4: 0 0 0 1 0
# food 5: 0 0 0 0 1



#############################################
## SALIVA- AND NON-SALIVA-SHARING ENTITIES ##
#############################################
# saliva sharing_id saliva sharing --> saliva sharing_id saliva sharing
saliva_sharer_left = objects_stim_full[1:10,]
saliva_sharer_right = objects_stim_full[11:20,]

names(saliva_sharer_left) = NULL
rownames(saliva_sharer_left) = NULL
row.names(saliva_sharer_left) = NULL

names(saliva_sharer_right) = NULL
rownames(saliva_sharer_right) = NULL
row.names(saliva_sharer_right) = NULL

# nonsaliva sharing_id nonsaliva sharing --> nonsaliva sharing_id nonsaliva sharing
nonsaliva_sharer_left = objects_stim_full[21:30,]
nonsaliva_sharer_right = objects_stim_full[31:40,]

names(nonsaliva_sharer_left) = NULL
rownames(nonsaliva_sharer_left) = NULL
row.names(nonsaliva_sharer_left) = NULL

names(nonsaliva_sharer_right) = NULL
rownames(nonsaliva_sharer_right) = NULL
row.names(nonsaliva_sharer_right) = NULL


# nonsaliva sharing_id distress noncomfort --> nonsaliva sharing_id distress noncomfort
nonsaliva_sharer_left_a = objects_stim_full[41:50,]
nonsaliva_sharer_right_a = objects_stim_full[51:60,]

names(nonsaliva_sharer_left_a) = NULL
rownames(nonsaliva_sharer_left_a) = NULL
row.names(nonsaliva_sharer_left_a) = NULL

names(nonsaliva_sharer_right_a) = NULL
rownames(nonsaliva_sharer_right_a) = NULL
row.names(nonsaliva_sharer_right_a) = NULL


###################################################
## COMFORTER- AND NON-COMFORTER-SHARING ENTITIES ##
###################################################
# comforting_id comforting --> comforting_id comforting
# comforting_id comforting --> comfort distress
comforter_left = objects_stim_full[1:10,]
comforter_right = objects_stim_full[11:20,]

names(comforter_left) = NULL
rownames(comforter_left) = NULL
row.names(comforter_left) = NULL

names(comforter_right) = NULL
rownames(comforter_right) = NULL
row.names(comforter_right) = NULL

# noncomforting_id noncomforting --> noncomforting_id noncomforting
noncomforter_left = objects_stim_full[61:70,]
noncomforter_right = objects_stim_full[71:80,]

names(noncomforter_left) = NULL
rownames(noncomforter_left) = NULL
row.names(noncomforter_left) = NULL

names(noncomforter_right) = NULL
rownames(noncomforter_right) = NULL
row.names(noncomforter_right) = NULL


# noncomforting_id noncomforting --> noncomfort distress
noncomforter_left_a = objects_stim_full[81:90,]
noncomforter_right_a = objects_stim_full[91:100,]

names(noncomforter_left_a) = NULL
rownames(noncomforter_left_a) = NULL
row.names(noncomforter_left_a) = NULL

names(noncomforter_right_a) = NULL
rownames(noncomforter_right_a) = NULL
row.names(noncomforter_right_a) = NULL

###################################
## HABITUATION AND TEST EXAMPLES ##
###################################

test_saliva_sharer = objects_stim_full[101,]
saliva_puppet = objects_stim_full[102,]
nonsaliva_puppet = objects_stim_full[103,]
test_ball_sharer = objects_stim_full[104,]

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
setwd("C:/Users/bentod2/Documents/projects/current/salivaModel/model/originalModel")

l1 = 1
l2 = 1
l3 = 1
l4 = 1
l5 = 1
l6 = 1
l7 = 1
l8 = 1
l9 = 1
l10 = 1



sink('pretrain.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))

# (1) SALIVA SHARING_ID SALIVA SHARING --> SALIVA SHARING_ID SALIVA SHARING
for(i in 1:nrow(food_items)){
  for(j in 1:nrow(saliva_sharer_left)){
    cat(paste("name: salivaSharingID_salivaSharing", l1, "\n", sep=""))
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
    l1 = l1+1
  }
}

# (2) SALIVA SHARING_ID NON-SALIVA SHARING --> SALIVA SHARING_ID NON-SALIVA SHARING
for(i in 1:nrow(saliva_sharer_left)){
  cat(paste("name: salivaSharingID_nonsalivaSharing", l2, "\n", sep=""))
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
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
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
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l2 = l2+1
}

# (3) SALIVA SHARING_ID COMFORT-DISTRESS --> SALIVA SHARING_ID COMFORT-DISTRESS
for(i in 1:nrow(saliva_sharer_left)){
  cat(paste("name: salivaSharingID_distressComfort", l3, "\n", sep=""))
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
  
  l3 = l3+1
}


# (4) NON-SALIVA SHARING_ID NON-SALIVA SHARING --> NON-SALIVA SHARING_ID NON-SALIVA SHARING
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_nonsalivaSharing", l4, "\n", sep=""))
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
  
  l4 = l4+1
}

# (5) NON-SALIVA SHARING_ID NON-COMFORT-DISTRESS --> NON-SALIVA SHARING_ID NON-COMFORT-DISTRESS
for(i in 1:nrow(nonsaliva_sharer_left)){
  cat(paste("name: nonsalivaSharingID_distressNonComfort", l5, "\n", sep=""))
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
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l5 = l5+1
}

# (6) COMFORT_ID COMFORT-DISTRESS --> COMFORT_ID COMFORT-DISTRESS
for(i in 1:nrow(comforter_left)){
  cat(paste("name: comfortID_distressComfort", l6, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(comforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_IN)", sep="\t"))
  print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(comforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_IN)", sep="\t"))
  print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
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
  print(comforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_OUT)", sep="\t"))
  print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(comforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_OUT)", sep="\t"))
  print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l6 = l6+1
}

# (7) COMFORT_ID SALIVA SHARING --> COMFORT_ID SALIVA SHARING
for(i in 1:nrow(food_items)){
  for(j in 1:nrow(comforter_left)){
    cat(paste("name: comfortID_salivaSharing", l7, "\n", sep=""))
    # INPUT
    cat(paste("I:", "\n", sep="\t"))
    
    # OBJECT LEFT 
    cat(paste("(Object_Left_IN)", sep="\t"))
    print(comforter_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # comfort_left_identity
    cat(paste("(comfort_left_identity_IN)", sep="\t"))
    print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_IN)", sep="\t"))
    print(comforter_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # comfort_right_identity
    cat(paste("(comfort_right_identity_IN)", sep="\t"))
    print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
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
    print(comforter_left[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # comfort_left_identity
    cat(paste("(comfort_left_identity_OUT)", sep="\t"))
    print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # OBJECT RIGHT
    cat(paste("(Object_Right_OUT)", sep="\t"))
    print(comforter_right[j,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # comfort_right_identity
    cat(paste("(comfort_right_identity_OUT)", sep="\t"))
    print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # ACTION
    cat(paste("(Action_OUT)", sep="\t"))
    print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
    
    # FOOD
    cat(paste("(Food_OUT)", sep="\t"))
    print(food_items[i,], sep = "\t", quote = FALSE, row.names = FALSE)
    
    cat(paste(";", sep="\t"))
    cat("\n")
    
    l7 = l7+1
  }
}

# (8) COMFORT_ID NON-SALIVA SHARING --> COMFORT_ID NON-SALIVA SHARING
for(i in 1:nrow(noncomforter_left)){
  cat(paste("name: noncomfortID_nonsalivaSharing", l8, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_IN)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_IN)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_OUT)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_OUT)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l8 = l8+1
}

# (9) NON-COMFORT_ID NON-COMFORT-DISTRESS --> NON-COMFORT_ID NON-COMFORT-DISTRESS
for(i in 1:nrow(noncomforter_left)){
  cat(paste("name: noncomfortID_distressNonComfort", l9, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_IN)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_IN)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
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
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_OUT)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_OUT)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # DISTRESS
  cat(paste("(Distress_OUT)", sep="\t"))
  print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # COMFORT
  cat(paste("(Comfort_OUT)", sep="\t"))
  print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l9 = l9+1
}


# (10) NON-COMFORT_ID NON-SALIVA SHARING --> NON-COMFORT_ID NON-SALIVA SHARING
for(i in 1:nrow(noncomforter_left)){
  cat(paste("name: noncomfortID_nonsalivaSharing", l10, "\n", sep=""))
  # INPUT
  cat(paste("I:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_IN)", sep="\t"))
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_IN)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_IN)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_IN)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_IN)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OUTPUT
  cat(paste("T:", "\n", sep="\t"))
  
  # OBJECT LEFT 
  cat(paste("(Object_Left_OUT)", sep="\t"))
  print(noncomforter_left[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_left_identity
  cat(paste("(comfort_left_identity_OUT)", sep="\t"))
  print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # OBJECT RIGHT
  cat(paste("(Object_Right_OUT)", sep="\t"))
  print(noncomforter_right[i,], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # comfort_right_identity
  cat(paste("(comfort_right_identity_OUT)", sep="\t"))
  print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  # ACTION
  cat(paste("(Action_OUT)", sep="\t"))
  print(saliva_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)
  
  cat(paste(";", sep="\t"))
  cat("\n")
  
  l10 = l10+1
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


sink('familiarization_exp_3.ex')
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


# prediction set
# Familiarization: left comforting when distress; right not comforting when distress
# test: left sharing saliva; right sharing saliva


sink('familiarization_comfortDistress.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: Comforting", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_IN)", sep="\t"))
print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_IN)", sep="\t"))
print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

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

# comfort_left_identity
cat(paste("(comfort_left_identity_OUT)", sep="\t"))
print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_OUT)", sep="\t"))
print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: Noncomforting", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_IN)", sep="\t"))
print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_IN)", sep="\t"))
print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

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
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_OUT)", sep="\t"))
print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_OUT)", sep="\t"))
print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# DISTRESS
cat(paste("(Distress_OUT)", sep="\t"))
print(distress[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# COMFORT
cat(paste("(Comfort_OUT)", sep="\t"))
print(comfort_action[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()




sink('test_ComfortingDistress.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: formerComforter_SalivaSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_IN)", sep="\t"))
print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_IN)", sep="\t"))
print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_OUT)", sep="\t"))
print(comfort_left_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_OUT)", sep="\t"))
print(comfort_right_identity[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: formerNonComforter_SalivaSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_IN)", sep="\t"))
print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_IN)", sep="\t"))
print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_left_identity
cat(paste("(comfort_left_identity_OUT)", sep="\t"))
print(comfort_left_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# comfort_right_identity
cat(paste("(comfort_right_identity_OUT)", sep="\t"))
print(comfort_right_identity[2,1], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()



sink('test_ComfortingDistress_control.ex')
cat(paste("defI:-", "\n", sep="\t"))
cat(paste("defT:-", "\n", sep="\t"))
cat(paste(";", "\n", sep="\t"))
cat(paste("name: formerComforter_SalivaSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)


# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_saliva_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")




# BALL SHARING
cat(paste("name: formerNonComforter_SalivaSharing", "\n", sep=""))
# INPUT
cat(paste("I:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_IN)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_IN)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_IN)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

# OUTPUT
cat(paste("T:", "\n", sep="\t"))

# OBJECT LEFT 
cat(paste("(Object_Left_OUT)", sep="\t"))
print(test_ball_sharer[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# OBJECT RIGHT
cat(paste("(Object_Right_OUT)", sep="\t"))
print(saliva_puppet[1,], sep = "\t", quote = FALSE, row.names = FALSE)

# ACTION
cat(paste("(Action_OUT)", sep="\t"))
print(saliva_action[1,1], sep = "\t", quote = FALSE, row.names = FALSE)

cat(paste(";", sep="\t"))
cat("\n")

sink()