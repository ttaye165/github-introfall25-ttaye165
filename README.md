#Tsion Taye xmv2ex
#The goal of this assignment Verify you can use Microsoft Copilot / GitHub Copilot Chat alongside RStudio 
#to accelerate—but not replace—your coding.

# ------------------------------
# 1) Paths & file I/O
# ------------------------------

# 1.1 Set working directories -------------------------------------------------
# EDIT THESE for your environment
traindir <- "/Users/tsiontaye/Desktop/SYS 3501/Data"
sourcedir <- "/Users/tsiontaye/Desktop/SYS 3501/Source"

stopifnot(dir.exists(traindir))
setwd(traindir)
message("Working directory set to: ", getwd())

# 1.3 Safe CSV read helper ----------------------------------------------------
safe_read <- function(file) {
  # Matches read.csv defaults from class, but robust NA handling
  read.csv(file, na.strings = c("", "NA", "N/A"," NA", "NA "), stringsAsFactors = FALSE)
}

# 1.4 Read the accident CSV ------------------------------------------------
totacts <- safe_read("Railroad_Equipment_Accident_Incident_Source_Data__Form_54__20250907.csv")
# ------------------------------

# Filter accidents between 2021 and 2024
# Prompt 1
totacts2124 <- accidents %>%
  filter(IYR %in% c(21, 22, 23, 24))
#Yes this line is working
#It is creating a new dataframe that inclides the years form 2021-2024

# Prompt 2
totacts2124 <- totacts2124 %>%
  mutate(CASINJ = TOTINJ + TOTKLD)
#Yes this code is working as intended
#It adds the new column CASINJ to filtered data. 
#It combines the total number of injuries and fatalitites

# Prompt 3
totacts2124 <- totacts2124 %>%
  mutate(YEAR = 2000 + IYR)
#Yes this worked
#The line makes the 2 digit years into a regular 4 digint year

# Prompt 4
dim(totacts2124)
#Yes this worked and it gives us the number of rows and columns in the new altered dataset
