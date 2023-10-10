Interacting with APIs: Census Vingette
================
Autumn Locklear

-   [Requirements](#requirements)

This is a vignette demonstrating how to interact with an API. I used the
US Census API to show how I call the data. I wrote functions to interact
with different endpoints.

# Requirements

I used the following packages to interact with the census API… -
[`censusapi`](https://www.rdocumentation.org/packages/censusapi/versions/0.8.0):a
lightweight package to get data from the U.S. Census Bureau’s APIs.

I used the following packages in the remainder of the document…

``` r
#Call some data
pop_demo <-getCensus(name = "2019/pep/charage",
  vars = c("AGE", "RACE","SEX", "GEO_ID"),
  region = "state:*",
  key = "0ea1c54391f6e63ed7165ae06c9d8524b7415e40")
head(pop_demo)
```

    ##   state AGE RACE SEX      GEO_ID
    ## 1    31   0    0   0 0400000US31
    ## 2    31   0    1   0 0400000US31
    ## 3    31   0    2   0 0400000US31
    ## 4    31   0    3   0 0400000US31
    ## 5    31   0    4   0 0400000US31
    ## 6    31   0    5   0 0400000US31
