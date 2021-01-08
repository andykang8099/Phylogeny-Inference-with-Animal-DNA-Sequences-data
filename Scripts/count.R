args = commandArgs()

file = args[length(args)]

suppressPackageStartupMessages(library(tidyverse))

count_topologies = function(file)
{
  x = suppressMessages(read_table2(file, col_names=FALSE)) %>%
    rename( tree_string = X1 ) %>%
    mutate( top = case_when(
      str_detect(tree_string, "\\(1,2\\)|\\(2,1\\)|\\(3,4\\)|\\(4,3\\)") ~ "(1,2,(3,4));",
      str_detect(tree_string, "\\(1,3\\)|\\(3,1\\)|\\(2,4\\)|\\(4,2\\)") ~ "(1,(2,4),3);",
      str_detect(tree_string, "\\(1,4\\)|\\(4,1\\)|\\(2,3\\)|\\(3,2\\)") ~ "(1,(2,3),4);")) %>%
    mutate( index = case_when(
      top ==  "(1,2,(3,4));" ~ 1,
      top ==  "(1,(2,4),3);" ~ 2,
      top ==  "(1,(2,3),4);" ~ 3 ))
  
  out = tabulate(x$index)
  
  return ( out )
}

out = count_topologies(file)

cat(out,"\n")