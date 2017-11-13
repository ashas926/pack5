library(testthat)



test_that('Wrong input type:',  {
  expect_that(geocode_api('a', 'b'), throws_error())
  expect_that(geocode_api('a', 50.4), throws_error())
  expect_that(geocode_api(-17.3, 'b'), throws_error())
})


#Testing the input
expect_true(is.table(geocode_api("Madrid")))


test_that("Function is not wrong", {
  expect_error(geocode_api(dhaka, "Error in geocode_api(dhaka) : object 'dhaka' not found"))

})

test_that("Return method result", {
  expect_output(
    geocode_api("dhaka") %in% data.frame(
      Location = "dhaka",
      Latitude = 23.9000025,
      Longitude = 90.5091047,
      FullAdrress = "Dhaka, Bangladesh"
    )
  )
})


