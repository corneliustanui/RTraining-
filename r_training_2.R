# Importing data

STIData <- read_excel("Data/STIData.xls")

# Check for duplicates
duplicated(STIData$IdNumber)

sum(duplicated(STIData$IdNumber))

# convert ID Number to numeric
STIData$IdNumber <- as.numeric(STIData$IdNumber)

# save duplicates as another dataset
dups <- STIData[duplicated(STIData$IdNumber), ]


# save records duplicated by ID Number
dups2 <- STIData[STIData$IdNumber == 51, ]

# Reassign ID number for subject 51, when age ==  23

STIData$IdNumber[STIData$IdNumber == 51 & STIData$A1Age == 23] <- 227

# check duplicates again
sum(duplicated(STIData$IdNumber))

# check Case status
table(STIData$CaseStatus)

case3 <- STIData[STIData$CaseStatus == 3, ]

STIData$CaseStatus[STIData$CaseStatus == 3 & STIData$IdNumber == 31] <- 1
STIData$CaseStatus[STIData$CaseStatus == 3 & STIData$IdNumber == 1] <- 2

# Reassign proper codes to CaseStatus
STIData1 <- 
  STIData %>% 
  dplyr::mutate(CaseStatus1 = dplyr::if_else(CaseStatus == 2, 0, CaseStatus)) %>% 
  dplyr::relocate(c(CaseStatus1, Sex...47), .after = CaseStatus)


STIData1$CaseStatus1 <- factor(STIData1$CaseStatus1,
                              levels = 0:1,
                              labels = c("Negative", "Positive"))


class(STIData1$CaseStatus1)

# Drop unnecessary variables 
STIData1 <- 
  STIData1 %>% 
  dplyr::select(-c(CaseStatus, C3StiYesno))


# Rename variables 
STIData2 <- 
  STIData1 %>% 
  dplyr::rename(CaseStatus = CaseStatus1,
                ID = IdNumber,
                Sex = Sex...47,
                Age = A1Age,
                Occupation = A2Occupation,
                Church = A3Church,
                `Level Of Education` = A4LevelOfEducation)

# Grouping numerical variable
STIData2 <- 
  STIData2 %>% 
  dplyr::mutate(
    AgeCat = case_when(
      Age < 18 ~ "Below 18",
      Age >= 18 & Age < 30 ~ "18 - 30",
      Age >= 30 & Age < 50 ~ "30 - 50",
      Age >= 50 ~ "Above 50"
    )
  ) %>% 
  dplyr::relocate(AgeCat, .after = Age)

table(STIData2$AgeCat, STIData2$Sex)

# Removing numbers in string values
STIData2 <- 
  STIData2 %>% 
  dplyr::mutate(Occupation = toupper(stringr::str_replace(Occupation, "\\d", "")),
                Church = stringr::str_replace(Church, "\\d", ""),
                `Level Of Education` = stringr::str_replace(`Level Of Education`, "\\d", ""),
                A5MaritalStatus = stringr::str_replace(A5MaritalStatus, "\\d", ""),)









