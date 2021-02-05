#Create download log of NHSDataDictionaRy package
library(ggplot2)
library(dlstats)

data_dict_status <- dlstats::cran_stats(c("caret", "parsnip", "reticulate", "keras", "NHSDataDictionaRy"))

if (!is.null(data_dict_status)){
  head(data_dict_status)
  plot <- ggplot(data_dict_status,
                 aes(end, downloads, group=package)) + geom_line(aes(color=package),linetype="dashed") +
          geom_point(aes(shape=package, color=package)) + theme_minimal()

  plot <- plot + xlab("Download date") + ylab("Number of downloads")
  print(plot)
}


package_list <- list("NHSDataDictionaRy_plot"= plot,
                     "download_df"=as_tibble(data_dict_status),
                     "downloads_to_date"=sum(data_dict_status$downloads))


package_list$download_df

