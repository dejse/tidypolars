### [GENERATED AUTOMATICALLY] Update test-strptime.R instead.

Sys.setenv('TIDYPOLARS_TEST' = TRUE)

test_that("basic behavior works", {
  test_df <- tibble(
    s = "2026-01-01 01:02:03"
  )
  test_pl <- as_polars_lf(test_df)

  out <- test_pl |>
    mutate(s = base::strptime(s, format = "%Y-%m-%d %H:%M:%S"))

  out_pl <- test_pl$with_columns(
    pl$col("s")$str$strptime(
      dtype = pl$Datetime("us", time_zone = ""),
      format = "%Y-%m-%d %H:%M:%S"
    )
  )

  expect_equal_lazy(out, out_pl)
})

Sys.setenv('TIDYPOLARS_TEST' = FALSE)
