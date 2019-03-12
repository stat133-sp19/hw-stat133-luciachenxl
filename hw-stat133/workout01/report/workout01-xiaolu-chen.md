workout01-xiaolu-chen
================
Xiaolu Chen

`{r setup, include=FALSE} knitr::opts_chunk$set(echo = TRUE)`

### Table1: 2PT Effective Shooting % by Player

``` {r}
library(dplyr)
pt2<-filter(shots_data,shots_data$shot_type=="2PT Field Goal")
arrange(summarise(group_by(pt2,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

### Table2: 3PT Effective Shooting % by Player

``` {r}
pt3<-filter(shots_data,shots_data$shot_type=="3PT Field Goal")
arrange(summarise(group_by(pt3,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

### Table3: Effective Shooting % by Player (overall)

``` {r}
arrange(summarise(group_by(shots_data,player),total=sum(shot_made_flag=="shot_yes"|shot_made_flag=="shot_no"),made=sum(shot_made_flag=="shot_yes"),perc_made=made/total),desc(perc_made))
```

### The image of GSW Shot Chart

`{r out.width='80%',echo=FALSE,fig.align='center'} knitr::include_graphics('gsw-shots-chart.png')`