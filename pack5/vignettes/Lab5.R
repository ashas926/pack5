## ---- eval=FALSE---------------------------------------------------------
#  if (httr::http_type(resp) != "application/json") {
#        stop("API didn't return json", call. = FALSE)
#      }
#

## ----eval=FALSE----------------------------------------------------------
#   if (httr::http_error(resp)) {
#        stop(
#          sprintf(
#            "Github API request failed [%s]\n%s\n%s",
#            httr::status_code(resp),
#            parsed$message,
#            parsed$documentation_url
#          ),
#          call. = FALSE
#        )
#      }

## ----eval= FALSE---------------------------------------------------------
#    latlong <- as.array(parsed$results[[1]]$geometry$location)
#       fulladd <- as.character(parsed$results[[1]]$formatted_address)

## ----eval= FALSE---------------------------------------------------------
#
#       cat("The full address of ", u_address[i], "is", fulladd, ".")
#       cat("\nThe latitude of",u_address[i],"is",latlong[[1]],
#           "and longitude is ",latlong[[2]],".\n\n")

## ---- eval=FALSE---------------------------------------------------------
#  The full address of  stockholm is Stockholm, Sweden .
#  The latitude of stockholm is 59.32932 and longitude is  18.06858 .

## ---- eval=FALSE---------------------------------------------------------
#    Location   Latitude  Longitude       FullAdrress
#    1 linkoping 58.4531271 15.7461581 Link?ping, Sweden

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("Ashraful/GoogleAPI/Geocode")

## ---- eval=FALSE---------------------------------------------------------
#  geocode_api(location)

## ---- eval=FALSE---------------------------------------------------------
#  shiny::runGitHub("GoogleAPI", username="Ashraful", ref="master",subdir ="Geocode/ShinyApp")

