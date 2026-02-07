# todo -------------------------------------------------------------------------

# A Data Source is basically a data.frame that can only support Notion properties
# as columns and contains some other meta-data. We'll extend the `tibble` class
# and allow a tibble-like interface, while always limiting columns to being
# <notion_property> vectors.
#
# - Extending tibble: https://tibble.tidyverse.org/articles/extending.html
# - Compatibility with dplyr: https://dplyr.tidyverse.org/reference/dplyr_extending.html

# constructor ------------------------------------------------------------------

# A "tbl_df" extension, arguments to dots are columns which *must* be
# <notion_property> vectors. Add other arguments as needed.
notion_data_source <- function(...) {

}

new_notion_data_source <- function(...) {

}

# get --------------------------------------------------------------------------

notion_data_source_get <- function(data_source_id) {

}
