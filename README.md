# Package Tracker

This is a function to track your packages and create download and output statistics as a list object. The outputs from the PackageTracker function are:

1. The download statistics per month 
2. The download plot
3. Aggregate summary of the number of downloads per month

To use the tracker just type in the name of your package on CRAN to download, such as `package_to_search <- 'ConfusionTableR'`.

## Using the function

```{r}
package_to_search <- 'ConfusionTableR'
results <- package_trackeR(c(package_to_search))
```
