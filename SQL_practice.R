install.packages("sqldf")
library(sqldf)

result <- sqldf("SELECT Name, W, L, ERA, `ERA+`, FIP, IP, H9, R, ER, HR9, BB9, SO9
                FROM cubs_pitching 
                WHERE ERA < 4 AND R > 20
                GROUP BY Name 
                ORDER BY FIP 
                LIMIT 100")


result