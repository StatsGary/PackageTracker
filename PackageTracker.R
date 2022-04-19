#Load these libraries
library(ggplot2)
library(dlstats)
library(tibble)

#Create the wrapper function
package_trackeR <- function(packages){
  #Create the downloads for the package
  dl <- dlstats::cran_stats(c(packages))
  #Create the plot
  plot <- ggplot(dl,
                 aes(end, downloads, group=package)) + 
    geom_line(aes(color=package),linetype="dashed") +
    geom_point(aes(shape=package, color=package)) + 
    theme_minimal()
  plot <- plot + xlab("Download date") + 
    ylab("Number of downloads")
  #Create a list for multiple returns
  returns_list <- list("download_df"=as_tibble(dl),
                       "downloads_to_date"=sum(dl$downloads),
                       "downloads_plot"=plot)
  
  return(returns_list)
}

# if __name__=='__rmain__':
# Jokes - this is not Python
# Usage

#Call the new function
package_to_search <- 'ConfusionTableR'
results <- package_trackeR(c(package_to_search))
results_vec <- results$download_df$downloads
mean(results_vec)


plot <- results$downloads_plot
plot + geom_smooth(color='red', fill='grey', method='loess', formula='y ~ x') + geom_line(color='black') + 
  geom_point(color='black') + theme(legend.position = 'none') + 
  labs(title=paste(package_to_search, 'downloads plot'))




