Interacting with APIs: Census Vingette
================
Autumn Locklear

-   [Requirements](#requirements)

This is a vignette demonstrating how to interact with an API. I used the
US Census API to show how I call the data. I wrote functions to interact
with different endpoints.

# Requirements

I used the following packages to interact with the census API…

-   [`censusapi`](https://www.rdocumentation.org/packages/censusapi/versions/0.8.0):a
    lightweight package to get data from the U.S. Census Bureau’s APIs.

``` r
#Query state-level data
state_pop <-getCensus(name = "2019/pep/charage",
  vars = c("NAME","POP","AGE", "RACE", "HISP", "SEX"),
  region = "state:*",
  key = "0ea1c54391f6e63ed7165ae06c9d8524b7415e40")
head(state_pop)
```

    ##   state    NAME   POP AGE RACE HISP SEX
    ## 1    01 Alabama 56901   0    0    0   0
    ## 2    01 Alabama 51761   0    0    1   0
    ## 3    01 Alabama  5140   0    0    2   0
    ## 4    01 Alabama 35594   0    1    0   0
    ## 5    01 Alabama 31393   0    1    1   0
    ## 6    01 Alabama  4201   0    1    2   0

``` r
query_census <- function(name, vars, region, key) {
  root_url <- "https://api.census.gov/data/"
  get_string <- paste(vars, collapse=",")
  resp <- request(root_url) %>% 
    req_url_path_append(name) %>%
    req_url_query(`get` = get_string, `for` = region, `key` = key) %>%
    req_perform() %>%
    resp_body_string()
  return(fromJSON(resp))
}

#Set inputs
name <- "2019/pep/charage"
vars <- c("NAME","POP","AGE", "RACE", "HISP", "SEX")
region <- "state:*"
key <- "0ea1c54391f6e63ed7165ae06c9d8524b7415e40"

#call the function
query_test <- query_census(name, vars, region, key)
```

``` r
#Set the first row as the headers
colnames(query_test) <- query_test[1,]
census_query <- query_test[-1,]

#Filter for observations where state is NC
NC_data <-as_tibble(census_query)%>%
  filter(NAME == "North Carolina")
```
