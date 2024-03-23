# testing
m_tave <- get_nclimgrid_monthly(2023, "tave", "us", wide = FALSE, verbose = TRUE)
n_tave <- get_nclimgrid_normals("1901-2000", "tave", "us", wide = FALSE, verbose = TRUE)
a_tave <- compute_anomaly(m_tave, n_tave)

m_tave %>%
  filter(month %in% 2:5) %>%
  plot_nclimgrid()

n_tave %>%
  filter(month %in% 2:5) %>%
  plot_nclimgrid()

a_tave %>%
  filter(month %in% 2:5) %>%
  plot_nclimgrid()


plot_nclimgrid_histogram(m_tave, n_tave)

plot_nclimgrid_histogram(a_tave)

#testing tmax
m_tmax <- get_nclimgrid_monthly(2023, "tmax", "us", wide = FALSE, verbose = TRUE)
n_tmax <- get_nclimgrid_normals("1901-2000", "tmax", "us", wide = FALSE, verbose = TRUE)
a_tmax <- compute_anomaly(m_tmax, n_tmax)

m_tmax %>%
  filter(month %in% 6) %>%
  plot_nclimgrid() +
  theme_void() +
  theme(legend.position = 'left')

n_tmax %>%
  filter(month %in% 6) %>%
  plot_nclimgrid() +
  theme_void() +
  theme(legend.position = 'left')

a_tmax %>%
  filter(month %in% 4) %>%
  plot_nclimgrid()



# testing
m_p <- get_nclimgrid_monthly(2023, "prcp", "us", wide = FALSE, verbose = TRUE)
n_p <- get_nclimgrid_normals("1901-2000", "prcp", "us", wide = FALSE, verbose = TRUE)
a_p <- compute_anomaly(m_p, n_p)

m_p %>%
  filter(month %in% 7) %>%
  plot_nclimgrid(show_credit = F) +
  theme_void() +
  theme(legend.position = 'none', strip.text = element_blank()) +
  labs(title = NULL, subtitle = NULL)

n_p %>%
  filter(month %in% 5:8) %>%
  plot_nclimgrid()

a_p %>%
  filter(month %in% 6) %>%
  plot_nclimgrid()


plot_nclimgrid_histogram(m_p, n_p)

plot_nclimgrid_histogram(a_p)

#create .rds with pixels by state (intersect nclimgrid grid with maps polygons and store  )


#daily preliminary grids - can be read and aggregated to get prcp prior to the official release
# requires netcdf
# https://www.ncei.noaa.gov/pub/data/daily-grids/beta/by-month/2022/07/

#newly published ranks data
# https://www.ncei.noaa.gov/access/monitoring/us-maps/1/202206?products[]=grid-ranks-tavg
rks <- 'https://www.ncei.noaa.gov/pub/data/cirs/climgrid/us_tave_1mo.dat' %>%
  read.delim(header=T, sep="")

t_rank_names <- data.frame(cat = 1:7,
                         description = c("Record Coldest",
                                         "Much Below Avg",
                                         "Below Average",
                                         "Near Average",
                                         "Above Average",
                                         "Much Above Avg",
                                         "Record Warmest"))

rks %>%
  ggplot() +
  geom_raster(aes(x = lon, y = lat, fill = as.factor(cat))) +
  scale_fill_manual(values = rev(brewer.pal(7, "RdBu")),
                    drop = F,
                    breaks = t_rank_names$cat,
                    labels = t_rank_names$description,
                    name = NULL) +
  theme_minimal() +
  geom_polygon(data = map_data("state"), aes(x = long, y = lat, group = group), color = "black", fill=NA, size=0.1) +
  labs(x=NULL, y=NULL) +
  theme(legend.position = 'bottom') +
  guides(fill = guide_legend(nrow = 1))



  prcp_rks <- 'https://www.ncei.noaa.gov/pub/data/cirs/climgrid/us_prcp_1mo.dat' %>%
  read.delim(header=T, sep="")

prcp_rank_names <- data.frame(cat = 0:7,
                              description = c('Record Driest (0")',
                                              "Record Driest",
                                              "Much Below Average",
                                              "Below Average",
                                              "Near Average",
                                              "Above Average",
                                              "Much Above Avg",
                                              "Record Wettest"))

prcp_rks %>%
  #left_join(rank_names, by = "cat") %>%
  ggplot() +
  geom_raster(aes(x = lon, y = lat, fill = as.factor(cat))) +
  scale_fill_manual(values = c("#BBBBBB", brewer.pal(7, "BrBG")),
                    drop = F,
                    breaks = prcp_rank_names$cat,
                    labels = prcp_rank_names$description,
                    name = NULL) +
  theme_minimal() +
  geom_polygon(data = map_data("state"), aes(x = long, y = lat, group = group), color = "black", fill=NA, size=0.1) +
  labs(x=NULL, y=NULL) +
  theme(legend.position = 'bottom') +
  guides(fill = guide_legend(nrow = 1)) +
  coord_quickmap(xlim = c(-110,-90), ylim =c(26.5,40))
