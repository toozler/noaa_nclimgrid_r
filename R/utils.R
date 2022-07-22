#' Validates if region names are valid
#' If no parameter is given, a list of valid options is returned
#' 
#' @param region Region name
#' 
validate_region <- function(region = NULL) {
  
  valid_options <- c("ak", "conus")
  
  if (is.null(region)) {
    
    message("Valid regions:")
    
    return(valid_options)
    
  }
  
  if (!(region %in% (valid_options))) { 
    
    stop("Invalid region, valid options are: ", paste(valid_options, collapse = ", "))
    
  }
  
}


#' Validates if measurement names are valid
#' If no parameter is given, a list of valid options is returned
#' 
#' @param measurement Measurement name
#' 
validate_measurement <- function(measurement = NULL) {
  
  valid_options <- c("tave", "tmax", "tmin", "prcp")
  
  if (is.null(measurement)) {
    
    message("Valid measurement types:")
    
    return(valid_options)
    
  }
  
  if (!(measurement %in% (valid_options))) { 
    
    stop("Invalid measurement name, valid options are: ", paste(valid_options, collapse = ", "))
    
  }
  
}


#' Validates if year is valid
#' 
#' nClimGrid stores the current and previous year only, other years are stored in a different format 
#' and in another location - this script currently doesn't support fetching the archived years
#' 
#' @param year Year, YYYY format
#' 
#' @importFrom lubridate year
validate_year <- function(year) {
  
  if (!is.numeric(year) | nchar(year) != 4) {
    
    stop("Invalid year, use YYYY format")
    
  }
  
  current_year <- lubridate::year(Sys.Date())
  
  if (!(year %in% c(current_year, current_year -1))) {
    
    stop("Year not available in current archive, must be current or previous year.")
    
  } 
  
}

#' Validates if normals period is a valid option
#' Normals exist in gridded format for some predefined periods
#' 
#' @param normals_period Normals period range
#' 
validate_normals_period <- function(normals_period = NULL) {
  
  valid_options <- c("1901-2000", "1981-2010", "1991-2020", "2006-2020")
  
  if (is.null(normals_period)) {
    
    message("Valid periods:")
    
    return(valid_options)
    
  }
  
  if (!(normals_period %in% (valid_options))) { 
    
    stop("Invalid normals period, valid options are: ", paste(valid_options, collapse = ", "))
    
  }
  
}

#' Standardizes the units from monthly nClimGrid datasets (C and mm) 
#' to the same units used by the normal historical averages (F and in)
#' 
#' @param values Vector of values
#' @param measurement Measurement type (i.e. "tmax", "tave", "tmin", "prcp)
#' 
#' @return Values in standard units
standardize_units <- function(values, measurement) {
  
  #check if measurement type is valid
  validate_measurement(measurement)
  
  #convert from C to F for temperatures
  #and from mm to in for precipitation
  if (grepl("^t", measurement)) {
    
    return((9/5) * values + 32)
    
  } else {
    
    return(values / 25.4)
  }
  
}


#' Print progress messages depending on verbose option
#' 
#' @param verbose 
#' @param string Message to print if verbose is TRUE
#' 
progress_msg <- function(verbose, string) {
  
  if (verbose) message(string)
  
}


#' Labeller function to return month name for faceting plots
#' 
#' @param m Month number
#' 
#' @return Month full name
month_to_name <- function(m) {
  
  return(month.name[as.numeric(m)])
  
}

