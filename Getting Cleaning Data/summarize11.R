# Compute four values, in the following order, from
# the grouped data:
#
# 1. count = n()
# 2. unique = n_distinct(ip_id)
# 3. countries = n_distinct(country)
# 4. avg_bytes = mean(size)
#
# A few thing to be careful of:
#
# 1. Separate arguments by commas
# 2. Make sure you have a closing parenthesis
# 3. Check your spelling!
# 4. Store the result in pack_sum (for 'package summary')
#
# You should also take a look at ?n and ?n_distinct, so
# that you really understand what is going on.

pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))

pack_sum

#============================================                                                                       |  38%
# We need to know the value of 'count' that splits the data into the top 1% and bottom 99% of packages based on total
# downloads. In statistics, this is called the 0.99, or 99%, sample quantile. Use quantile(pack_sum$count, probs = 0.99)
# to determine this number.

x <- quantile(pack_sum$count, probs = 0.99)

top_counts <- filter(pack_sum, count > x)
view(top_counts)

top_counts_sorted <- arrange(top_counts, count)

### useful to find the top 10 customers by a value

