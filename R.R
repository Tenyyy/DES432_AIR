file_paths <- c("C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1669827600-1672505999.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1667235600-1669827599.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1664557200-1667235599.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1661965200-1664557199.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1659286800-1661965199.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1656608400-1659286799.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1654016400-1656608399.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1648746000-1651337999.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1651338000-1654016399.csv",
                "C:/Users/Krisda Taveesak/Documents/TU-siit/siit/des432/dataset/TU-EnvData-1643648400-1646067599.csv"
)
# use lapply to read all files into a list of data frames
my_data_list <- lapply(file_paths, read.csv)

# combine data frames into one data frameS
combined_data <- do.call(rbind, my_data_list)
combined_data
df_refine <- subset(combined_data, select = -c( time_stamp,acceleration_x ,acceleration_y,acceleration_z,inclination_xz ,inclination_yz  ))
df_refine
hist(df_refine$temperature )

library(dplyr)
summary_table <- df_refine %>%
  group_by(illuminance) %>%
  summarize(mean_wind_velocity = mean(wind_velocity ),
            sd_wind_velocity = sd(wind_velocity ),
            n = n())
summary_table
install.packages("ggplot2")
library(ggplot2)
ggplot(data = combined_data, aes(x = air_pressure, y = wind_velocity))
  geom_point()
  
  
  
  # Load data
  #data <- read.csv("data.csv")
  
  # Compute correlation matrix
  #cor_matrix <- cor(data[, c("column1", "column2", "column3")])
  
  # Test correlation between two columns
  #cor_test <- cor.test(data$column1, data$column2)

  
  
  # Load data
  #data <- read.csv("data.csv")
  
  # Perform linear regression
  #model <- lm(column_of_interest ~ predictor_column, data=data)
  
  # View summary of the regression model
  #summary(model)