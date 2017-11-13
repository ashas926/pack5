---
  title: <center>Geocoding with Google API </center>
  subtitle: <center>ashas926@student.liu.se, jorvi903@student.liu.se</center>
  author: <center>Ashraful, jore villar </center>
  date: "2017-10-04"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Geocoding with Google API}
%\VignetteEngine{knitr::knitr}
%\VignetteEngine{knitr::rmarkdown}
%\VignetteEncoding{UTF-8}{inputenc}

---

  **Lab5** is entitled for the students who took the Advanced R course. This lab is based on API connetivity and Shiny Application creation. The package **Geocode** contains one function **geocode_api** and one shiny package based on that function and a testcase including **vignette** manual. The package is using Google's geocode API for fetching the latitude, longitude and complete address of user's desired location.

As usual to the other packages there is a .R script for the API calling inside the **/R** folder, a scripted testcase for testing in **/test/testthat** folder, all .Rd files inside **/man** folder and .Rmd file inside the **/vignettes** folder.

##API.R
geocode_api() function takes two arguments to call the API but the user is sending only the address argument as "u_address". Another paramter is **return.call="json"** which will append with the URL.
Two library functions **httr** and **jsonlite** is loaded. User can send any
number of locations.


**dm** A matrix for containing the parsed data.

**dk** A dataframe for returning the location, latitude , longitude & fulladdress.

**root** The fixed url for Google's geocode API HTTP request.

**url** Creating a full URL for calling API using the return.call, address & key parameters.

**key** Key is for authenticating the Google Maps Geocoding API which can be added in the app.

**resp** The GET method from *httr* package retrieves the desired information using the url.

**parsed** parsed is using the method *jsonlite::fromJSON* function to convert JSON data (google's response) in R objects.




```r
if (httr::http_type(resp) != "application/json") {
  stop("API didn't return json", call. = FALSE)
}
```

This above mentioned chunk is used  to check the JSON response from geocode API.


```r
if (httr::http_error(resp)) {
  stop(
    sprintf(
      "Github API request failed [%s]\n%s\n%s",
      httr::status_code(resp),
      parsed$message,
      parsed$documentation_url
    ),
    call. = FALSE
  )
}
```

The above mentioned chunk is used to check the response status of geocode API.

Below chunk is self explanatory where the latlong is retriving the latitude and longitude of the location as an array.The fulladd is retriving the complete address of the location. the matrix dm[i,] is taking the column values.



```r
latlong <- as.array(parsed$results[[1]]$geometry$location)
fulladd <- as.character(parsed$results[[1]]$formatted_address)
```


Finally the output is displaying as


```r
cat("The full address of ", u_address[i], "is", fulladd, ".")
cat("\nThe latitude of",u_address[i],"is",latlong[[1]],
    "and longitude is ",latlong[[2]],".\n\n")
```


##test_geocode.R

Testcase file contains 2 testcases for checking the functionality of the package.

###1. Function is not wrong :
If user gives the input without double quotation " " , then the function will throw an error.

###2. Giving wrong input:
If user gives the wrong input for searching address by giving coordinates as input  </br >
  **Example** - geocode_api('a', 'b') **It gives error because coordinates cannot be character value.

###3. Testing for is.Table:
**is.Table** function is used in the test case to check if the result is returned in table format or not.

###4. Return method result:
Result contains the location,latitude , longitude and full address of the desired place.


##Documentation using Roxygen:

Package contains a .R file for package documentation named as Geocode.R. The roxygen skeleton made the documentation of API.R. So inside /man folder there are three files named as Geocode.Rd , geocode_api.Rd and Geocode-package.Rd.


###NAMESPACE:

This file is unmodified.

###DESCRIPTION:

This file is modified as per user details. Due to build and check issues library packages needed to run the package is added as *Suggests*.



##Shiny package

Shiny package is a wrap up of the original API connecting function but with a visualization effect. The shiny app is writted in a single file where the ui and server both funtions are written. The package is created under the *Geocode/Geocode/* folder.

###ui function

UI has three panels where one is headerpanel which is the title bar for the app. Second one is sidebarLayout
which contains the input data field which is a text input. And the main panel is representing the output which will be coming from  the server. The function **textInput**,**tableOutput**,**textOutput** is used for taking the location input from the user and rest of them is returning data.


###server function
Server function is taking two parameters one is input and another is output. The **renderTable** is represeting the data as a datatable for better visualization of data.



##Examples:

geocode_api("linkoping")
geocode_api("boston")


##Output:


```r
The full address of  stockholm is Stockholm, Sweden .
The latitude of stockholm is 59.32932 and longitude is  18.06858 .
```




```r
Location   Latitude  Longitude       FullAdrress
1 linkoping 58.4531271 15.7461581 Linköping, Sweden
```


This package can be installed using below command


```r
devtools::install_github("Ashraful/GoogleAPI/Geocode")
```

To get the geocode data , run


```r
geocode_api(location)
```

To download the ShinyApp run the command

```r
shiny::runGitHub("GoogleAPI", username="Ashrful", ref="master",subdir ="Geocode/ShinyApp")
```


##References:

The study material for this lab given below.

https://github.com/Ashraful/GoogleAPI/tree/master/Geocode
https://developers.google.com/maps/documentation/geocoding/start



