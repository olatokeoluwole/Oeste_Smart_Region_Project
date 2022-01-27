#set working directory
setwd("C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION")


# load in my libraries 
library(rvest)
library(sf)
library(stringr)
library(tidyverse)


## BIRTH RATE OF STARTUPS 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826467"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[105:117,]


values <- select(table,1:11)
values <- values[392:403,]

date <- slice(table,377)
date <- select(date,1:11)

data_startups <- rbind(date,values)
data_startups <- cbind(names,data_startups)

birth_startups <- data_startups
colnames(birth_startups) <- data_startups[1,]
birth_startups <- birth_startups[-1,]

birth_startups$'2020' <- birth_startups$'2019'

birth_startups <- gather(birth_startups,"date","value",c(-Oeste))
Birth_of_Startups <- mutate(birth_startups,"DIMENSION"= "1","ID_INDICATOR"=1,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=4 )

#write.csv(Birth_of_Startups,"birth_startups.csv")



## UNEMPLOYMENT RATE 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826472"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[103:115,]


values <- select(table,1:13)
values <- values[392:403,]

date <- slice(table,377)
date <- select(date,1:13)

unemployment <- rbind(date,values)
unemployment <- cbind(names,unemployment)

unemployment_data <- unemployment
colnames(unemployment_data) <- unemployment[1,]
unemployment_data <- unemployment_data[-1,]

unemployment_data <- gather(unemployment_data,"date","value",c(-Oeste))
Unemployment_Rate <- mutate(unemployment_data,"DIMENSION"= "1","ID_INDICATOR"=2,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=4 )

#write.csv(Unemployment_Rate,"unemployment.csv")


## EMPLOYED IN TERTIARY SECTOR 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826552 "
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[103:115,]


values <- select(table,1:4)
values <- values[384:395,]

date <- slice(table,369)
date <- select(date,1:4)

tertiary_employ <- rbind(date,values)
tertiary_employ  <- cbind(names,tertiary_employ )

tertiary_employ2 <- tertiary_employ
colnames(tertiary_employ2) <- tertiary_employ[1,]
tertiary_employ2 <- tertiary_employ2[-1,]

tertiary_employ2$'2020' <- tertiary_employ2$'2011'

tertiary_employ2 <- gather(tertiary_employ2,"date","value",c(-Oeste))
Employment_Tertiary <- mutate(tertiary_employ2,"DIMENSION"= "1","ID_INDICATOR"=4,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=3)

#write.csv(Employment_Tertiary ,"tertiary_employ2 .csv")


## CONNECTED TO PUBLIC WATER 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5825773 "
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[478:490,]


values <- select(table,1:14)
values <- values[833:844,]

date <- slice(table,378)
date <- select(date,1:14)

public_water <- rbind(date,values)
public_water <- cbind(names,public_water)

public_water_data <- public_water
colnames(public_water_data) <- public_water_data[1,]
public_water_data <- public_water_data[-1,]


public_water_data$"2020" <- public_water_data$"2019"

public_water_data <- gather(public_water_data,"date","value",c(-Oeste))
Dwellings_with_pWater <- mutate(public_water_data,"DIMENSION"= "2","ID_INDICATOR"=5,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=3)

#write.csv(Dwellings_with_pWater,"public_water_data.csv")



## WASTE MANAGEMENT HIERARCHY INDEX 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826521"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[103:115,]


values <- select(table,1:13)
values <- values[392:403,]

date <- slice(table,377)
date <- select(date,1:13)

wasteindex <- rbind(date,values)
wasteindex <- cbind(names,wasteindex)

wasteindex2 <- wasteindex
colnames(wasteindex) <- wasteindex[1,]
wasteindex <- wasteindex[-1,]

wasteindex <- gather(wasteindex,"date","value",c(-Oeste))
Waste_Index <- mutate(wasteindex,"DIMENSION"= "2","ID_INDICATOR"=8,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=2)

#write.csv(Waste_Index"wasteindex.csv")


## % OF VOTERS IN LOCAL ELECTIONS
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826523"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[105:117,]


values <- select(table,1:13)
values <- values[395:406,]

date <- slice(table,380)
date <- select(date,1:13)

voters <- rbind(date,values)
voters <- cbind(names,voters)

voters2 <- voters
colnames(voters) <- voters[1,]
voters <- voters[-1,]

voters$"2020" <- voters$"2021"
voters <- select(voters,-"2021")

voters <- gather(voters,"date","value",c(-Oeste))
Voters_in_Elections <- mutate(voters,"DIMENSION"= "3","ID_INDICATOR"=10,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=2)

#write.csv(Voters_in_Elections,"voters.csv")



## % COMPUTERS WITH INTERNET
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826524"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[107:119,]


values <- select(table,1:12)
values <- values[396:407,]

date <- slice(table,381)
date <- select(date,1:12)

internet_comp <- rbind(date,values)
internet_comp <- cbind(names,internet_comp)

internet_comp2 <- internet_comp
colnames(internet_comp) <- internet_comp[1,]
internet_comp <- internet_comp[-1,]

internet_comp <- gather(internet_comp,"date","value",c(-Oeste))
Compute_with_Internet <- mutate(internet_comp,"DIMENSION"= "4","ID_INDICATOR"=11,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=4)


#write.csv(Compute_with_Internet,"internet_comp.csv")

## % CRIME 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826442"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[103:115,]


values <- select(table,1:14)
values <- values[394:405,]

date <- slice(table,379)
date <- select(date,1:14)

crime <- rbind(date,values)
crime <- cbind(names,crime)

crime2 <- crime
colnames(crime) <- crime[1,]
crime <- crime[-1,]

crime <- gather(crime,"date","value",c(-Oeste))
Crime_Data <- mutate(crime,"DIMENSION"= "4","ID_INDICATOR"=12,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=3)

#write.csv(Crime_Data,"crime.csv")


## MUSEUMS % OF NATIONAL 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826485"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[103:115,]


values <- select(table,1:14)
values <- values[393:404,]

date <- slice(table,378)
date <- select(date,1:14)

museums <- rbind(date,values)
museums <- cbind(names,museums)

museums2 <- museums
colnames(museums) <- museums[1,]
museums <- museums[-1,]

museums <- gather(museums,"date","value",c(-Oeste))
Museums <- mutate(museums,"DIMENSION"= "4","ID_INDICATOR"=13,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=2)
#write.csv(museums,"museums.csv")




## % ROAD FATALITY 
url <- "https://www.pordata.pt/en/DB/Municipalities/Search+Environment/Table/5826486"
page <- read_html(url)
table <- page %>% html_nodes("table") %>%  .[4] %>% 
  html_table() %>% .[[1]]

names <- select(table, 1)
names <- names[104:116,]


values <- select(table,1:14)
values <- values[394:405,]

date <- slice(table,379)
date <- select(date,1:14)

fatality <- rbind(date,values)
fatality <- cbind(names,fatality)

fatality2 <- fatality
colnames(fatality) <- fatality[1,]
fatality <- fatality[-1,]

fatality$'2020' <- fatality$`2019`

fatality <- gather(fatality,"date","value",c(-Oeste))
Road_Fatalities <- mutate(fatality,"DIMENSION"= "4","ID_INDICATOR"=14,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=2)
#write.csv(Road_Fatalities,"fatality.csv")


## SURVIVAL OF ICT FIRMS
data <- read.csv("C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/ICT SURVIVAL.csv")
ict_firms <- data[10:21,]
ict_firms <- select(ict_firms,"Oeste", X.1,X.3,X.5, X.7, X.9,X.11, X.13, X.15,X.17,X.19,X.21)
colnames(ict_firms) <- c('Oeste','2019','2018','2017', '2016', '2015', '2014','2013', '2012', '2011', '2010','2009')
ict_firms <- select(ict_firms,'Oeste', '2009','2010','2011','2012','2013','2014','2015','2016','2017','2018','2019')

ict_firms$'2020' <- ict_firms$'2019'

ict_firms <- gather(ict_firms,"date","value",c(-Oeste))
ICT_Survival <- mutate(ict_firms,"DIMENSION"= "1","ID_INDICATOR"=3,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=3)

#write.csv(ICT_Survival,"ict_firms.csv")

## FUEL CONSUMPTION
data <- read.csv("C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/FUEL CONSUMPTION PER RESIDENT.csv")
fuel_consump <- data[8:19,]
fuel_consump <- select(fuel_consump,"Oeste", X.1,X.3,X.5, X.7, X.9,X.11, X.13, X.15,X.17)
colnames(fuel_consump) <- c('Oeste','2019','2018','2017', '2016', '2015', '2014','2013', '2012', '2011')
fuel_consump<- select(fuel_consump,'Oeste', '2011','2012','2013','2014','2015','2016','2017','2018','2019')

fuel_consump$"2020" <- fuel_consump$`2019`

fuel_consump <- gather(fuel_consump,"date","value",c(-Oeste))
Fuel_consumption <- mutate(fuel_consump,"DIMENSION"= "2","ID_INDICATOR"=6,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=3)
#write.csv(Fuel_consumption,"fuel_consump.csv")

## TRANSPARENCY INDEX
transparent <- read.csv("C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/TRANSPARENCY INDEX.csv")
transparent <- rename(transparent, "2013"= "X2013")
transparent$'2020' <- transparent$'2013'

transparent <- gather(transparent,"date","value",c(-Oeste))
Transparency_Index <- mutate(transparent,"DIMENSION"= "3","ID_INDICATOR"=9,"DIMENSION_COUNT"=4, "INDICATOR_COUNT"=4)
#write.csv(Transparency_Index,"transparent.csv")

## Green Areas
# load in the a map of the landuse of Oeste Region which has been spatial joined with boundaries of municipalities in arcmap

municipal_landuses <- st_read(dsn = 'C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/New folder/Export_Output.shp')
municipal_landuses <- select(municipal_landuses, GEO_COD_DS, COS2018_n1, AREA, Shape_Area)

# filter out non-green landuses
municipal_landuses <- filter(municipal_landuses, COS2018_n1 %in% c('2.Agricultura', '3.Pastagens','5.Florestas', '7. Espaços descobertos ou com pouca vegetação'))

# now calculate size of green area in each minicipality
green_Alcobaça <-filter(municipal_landuses, GEO_COD_DS == 'Alcobaça') 
a <- sum(green_Alcobaça$AREA/green_Alcobaça$Shape_Area)*100
a <- round(a,digits = 3)

green_Alenquer <-filter(municipal_landuses, GEO_COD_DS == 'Alenquer') 
b <- sum(green_Alenquer$AREA/green_Alenquer$Shape_Area)*100
b<- round(b,digits = 3)

green_Arruda_dos_Vinhos <-filter(municipal_landuses, GEO_COD_DS == 'Arruda dos Vinhos') 
c <- sum(green_Arruda_dos_Vinhos$AREA/green_Arruda_dos_Vinhos$Shape_Area)*100
c<- round(c,digits = 3)

green_Bombarral <-filter(municipal_landuses, GEO_COD_DS == 'Bombarral') 
d <- sum(green_Bombarral$AREA/green_Bombarral$Shape_Area)*100
d<- round(d,digits = 3)


green_Cadaval <-filter(municipal_landuses, GEO_COD_DS == 'Cadaval') 
e <- sum(green_Cadaval$AREA/green_Cadaval$Shape_Area)*100
e<- round(e,digits = 3)

green_Caldas_da_Rainha <-filter(municipal_landuses, GEO_COD_DS == 'Caldas da Rainha') 
f <- sum(green_Caldas_da_Rainha$AREA/green_Caldas_da_Rainha$Shape_Area)*100
f<- round(f,digits = 3)

green_Lourinhã <-filter(municipal_landuses, GEO_COD_DS == 'Lourinhã') 
g <- sum(green_Lourinhã$AREA/green_Lourinhã$Shape_Area)*100
g<- round(g,digits = 3)

green_Nazaré <-filter(municipal_landuses, GEO_COD_DS == 'Nazaré') 
h <- sum(green_Nazaré$AREA/green_Nazaré$Shape_Area)*100
h<- round(h,digits = 3)

green_Óbidos <-filter(municipal_landuses, GEO_COD_DS == 'Óbidos') 
i <- sum(green_Óbidos$AREA/green_Óbidos$Shape_Area)*100
i<- round(i,digits = 3)


green_Peniche <-filter(municipal_landuses, GEO_COD_DS == 'Peniche') 
j <- sum(green_Peniche$AREA/green_Peniche$Shape_Area)*100
j<- round(j,digits = 3)

green_Sobral_de_Monte_Agraço <-filter(municipal_landuses, GEO_COD_DS == ' Sobral de Monte Agraço') 
k <- sum(green_Peniche$AREA/green_Peniche$Shape_Area)*100
k<- round(k,digits = 3)

green_Torres_Vedras <-filter(municipal_landuses, GEO_COD_DS == 'Torres Vedras') 
l <- sum(green_Torres_Vedras$AREA/green_Torres_Vedras$Shape_Area)*100
l<- round(l,digits = 3)

# bring a to l together to form a able, add municipality names and date column
Green_Areas <- data.frame(value=c("Green_Area_(%)",a,b,c,d,e,f,g,h,i,j,k,l))
Green_Areas <- cbind(names,Green_Areas)
Green_Areas$"date"=2020
Green_Areas <-subset(Green_Areas, X1!="Oeste")
Green_Areas <- mutate(Green_Areas,"DIMENSION"= "2","ID_INDICATOR"=7,"DIMENSION_COUNT"=5, "INDICATOR_COUNT"=3)
Green_Areas <- select(Green_Areas,"Oeste"= X1, date, value, DIMENSION , ID_INDICATOR, DIMENSION_COUNT,INDICATOR_COUNT)


##FACT TABLE
fact_table <- rbind(Birth_of_Startups,Unemployment_Rate, ICT_Survival,Employment_Tertiary,Dwellings_with_pWater,Fuel_consumption,Green_Areas, Waste_Index, Transparency_Index, Voters_in_Elections, Compute_with_Internet,Crime_Data, Museums,Road_Fatalities)
fact_table <- filter(fact_table, date>="2020")
fact_table <-rename(fact_table,"Indicator_ID"="ID_INDICATOR") %>% 
  rename("Municipality_ID"="Oeste") %>% 
  rename("Date"="date") %>% 
  rename("Value"="value") %>% 
  rename("Dimension_ID"="DIMENSION") %>% 
  rename("Dimension_Count"="DIMENSION_COUNT") %>% 
  rename("Indicator_Count"="INDICATOR_COUNT")


write_csv(fact_table,path ="FACT TABLE.csv")


## Create dimension tables
## Municipality DIM

municipality <- names
colnames(municipality) <- municipality[1,]
municipality <- municipality[-1,]
municipality <- cbind(ID=1:nrow(municipality),municipality)

municipality <-rename(municipality,"Municipality ID"="ID") %>% 
  rename("Municipality"="Oeste")
municipality <- mutate(municipality,"Minicipality_Group"= " ","Region"= "Oeste","Country"="Portugal")


write.csv(municipality,"Municipality DIM.csv")

## DATE DIM
Date <- data.frame(Year=c(2020))
Date_ID <- data.frame(Date_ID=c(1))
Date_Dim <- cbind.data.frame(Date,Date_ID)

write.csv(Date_Dim,"Date DIM.csv")

## INDICATOR DIM
indicator <- read.csv('C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/INDICATOR DIM.csv')


write.csv(indicator,"C:/Users/Oluwole Olatoke/Desktop/SMART REGIONS/ETL CODE/OESTE-SMART-REGION/Indicator DIM.csv")

## Dimension DIM
Dimension <- c('Economy', 'Environment','Governance','People')
ID <- c(1,2,3,4)
Dimension_ID <- cbind(ID,Dimension)

write.csv(Dimension_ID ,"Dimension DIM.csv")

