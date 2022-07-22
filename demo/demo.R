# testing
m_tave <- get_nclimgrid_monthly(2022, "tave", "conus", wide = FALSE, verbose = TRUE)
n_tave <- get_nclimgrid_normals("1901-2000", "tave", "conus", wide = FALSE, verbose = TRUE)
a_tave <- compute_anomaly(m_tave, n_tave)

plot_measurement_data(m_tave, subset_months = 2:5, title = "Temperature", subtitle = "Test", show_credit = T)



m_tmax <- get_nclimgrid_monthly(2022, "tmax", "conus", wide = FALSE, verbose = TRUE)
n_tmax <- get_nclimgrid_normals("1901-2000", "tmax", "conus", wide = FALSE, verbose = TRUE)
a_tmax <- compute_anomaly(m_tmax, n_tmax)

plot_measurement_data(m_tmax, subset_months = 3:6, title = "Temperature Max", subtitle = "Test", show_credit = T)


