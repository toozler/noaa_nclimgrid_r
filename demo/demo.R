# testing
m_tave <- get_nclimgrid_monthly(2021, "tave", "conus", wide = FALSE, verbose = TRUE)
n_tave <- get_nclimgrid_normals("1901-2000", "tave", "conus", wide = FALSE, verbose = TRUE)
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


#testing tmax
m_tmax <- get_nclimgrid_monthly(2022, "tmax", "conus", wide = FALSE, verbose = TRUE)
n_tmax <- get_nclimgrid_normals("1901-2000", "tmax", "conus", wide = FALSE, verbose = TRUE)
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
m_p <- get_nclimgrid_monthly(2021, "prcp", "conus", wide = FALSE, verbose = TRUE)
n_p <- get_nclimgrid_normals("1901-2000", "prcp", "conus", wide = FALSE, verbose = TRUE)
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



#create .rds with pixels by state (intersect nclimgrid grid with maps polygons and store  )
