

#create dataframes
x <- data.frame("SN" = 1:2, "Age" = c(21,15), "Name" = c("John","Dora"))
x

y <- data.frame("SN" = 2:4, 
                "Gender" = c("Male", "Female", "Female"))
y

#merge - Full outer join
merge(x=x, y=y, by = "SN", all=TRUE)


# SN Age Name Gender
# 1  1  21 John   <NA>
# 2  2  15 Dora   Male
# 3  3  NA <NA> Female
# 4  4  NA <NA> Female

#No rows dropped if no corresponding values in either table.


#merge - Left outer join
merge(x=x, y=y, by = "SN", all.x=TRUE)

# SN Age Name Gender
# 1  1  21 John   <NA>
# 2  2  15 Dora   Male

#rows only kept if left side has rows. NA if missing value on right.

#merge - right outer join
merge(x=x, y=y, by = "SN", all.y=TRUE)

#    SN Age Name Gender
# 1  2  15 Dora   Male
# 2  3  NA <NA> Female
# 3  4  NA <NA> Female

#rows only kept if right side has values. NA's inserted if left missing.

#merge - cross join
merge(x=x, y=y, by = NULL)
#never do this?
# 
#    SN.x Age Name SN.y Gender
# 1    1  21 John    2   Male
# 2    2  15 Dora    2   Male
# 3    1  21 John    3 Female
# 4    2  15 Dora    3 Female
# 5    1  21 John    4 Female
# 6    2  15 Dora    4 Female


#inner join
merge(x, y)
#only keep rows where _BOTH_ tables have values in join columns.

merge(x, y, by = "SN") 
#same result as above, nominating the join column is redundant.


#as above but with colname for join explicitly nominated

#inner join
merge(x=x, y=y, by.x=c("SN"), by.y=c("SN"))
#only keep rows where _BOTH_ tables have values in join columns.
