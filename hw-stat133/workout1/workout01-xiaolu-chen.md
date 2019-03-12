workout01-xiaolu-chen
================
Xiaolu Chen

### Table1: 2PT Effective Shooting % by Player

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
pt2<-filter(shots_data,shots_data$shot_type=="2PT Field Goal")
arrange(summarise(group_by(pt2,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     210   134     0.638
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

### Table2: 3PT Effective Shooting % by Player

``` r
pt3<-filter(shots_data,shots_data$shot_type=="3PT Field Goal")
arrange(summarise(group_by(pt3,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Andre Iguodala   161    58     0.360
    ## 4 Kevin Durant     161    58     0.360
    ## 5 Draymond Green   232    74     0.319

### Table3: Effective Shooting % by Player (overall)

``` r
arrange(summarise(group_by(shots_data,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

    ## # A tibble: 5 x 4
    ##   player         total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   371   192     0.518
    ## 2 Kevin Durant     371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

### The image of GSW Shot Chart

``` r
knitr::include_graphics('C:/Users/xiaol/Desktop/hw-stat133/workout01/images/gsw-shots-chart.png')
```

<img src="C:/Users/xiaol/Desktop/hw-stat133/workout01/images/gsw-shots-chart.png" width="80%" style="display: block; margin: auto;" />
