# todos ------------------------------------------------------------------------

# TODO: Consider fancier auth ({keyring}?). Notion is a single token, easy
#       integration, probably fine.

# TODO: Authorized App?
# - Look into the overhead/difficultly of creating an authorized app that
#   users can just sign into (like a "login to Notion" screen)
# - This is a *V2* problem, nice-to-have

# notion_token -----------------------------------------------------------------

# Following:
# https://httr2.r-lib.org/articles/wrapping-apis.html#user-supplied-key
notion_token <- function() {
  token <- Sys.getenv("NOTION_TOKEN", "")
  if (!identical(token, "")) {
    return(token)
  }
  if (is_testing()) {
    return(testing_token())
  }

  abort(
    c(
      "Can't find a Notion API token.",
      i = "Please set the `NOTION_TOKEN` environment variable."
    ),
    call = caller_env(),
    class = c("notion_error", "notion_error_token")
  )
}

is_testing <- function() {
  identical(Sys.getenv("TESTTHAT"), "true")
}

# TODO: Create a testing Notion and associated token for yourself
testing_token <- function() {
  # TODO: This is fake
  httr2::secret_decrypt("4Nx84VPa83dMt3X6bv0fNBlLbv3U4D1kHM76YisKEfpCarBm1UHJHARwJHCFXQSV", "HTTR2_KEY")
}
