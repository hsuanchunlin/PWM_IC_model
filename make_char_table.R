library(tidyverse)

data <- read.csv('demo_data.csv')
sequence = data$Sequence
temp_1 = strsplit(sequence,"") %>% data.frame() 
temp_2 = t(temp_1) %>% data.frame()
#tet = t(q) %>% data.frame()

#One-hot encoding
input_matrix_1 <- model.matrix(~X1-1, temp_2)
input_matrix_2 <- model.matrix(~X2-1, temp_2)
input_matrix_3 <- model.matrix(~X3-1, temp_2)
input_matrix_4 <- model.matrix(~X4-1, temp_2)
input_matrix_5 <- model.matrix(~X5-1, temp_2)
input_matrix_6 <- model.matrix(~X6-1, temp_2)

input_matrix <- cbind(input_matrix_1,input_matrix_2,input_matrix_3, input_matrix_4,
                      input_matrix_5,input_matrix_6) %>% data.frame()
#change colname
colnames_list <- colnames(input_matrix)
colnames(input_matrix) <- paste(substr(colnames_list, start=3, stop=3),
                                substr(colnames_list, start=2, stop=2),
                                sep = "")

input_matrix <- cbind(data, input_matrix)
rownames(input_matrix) <- input_matrix$Sequence

write.csv(input_matrix, "chr_table.csv")
