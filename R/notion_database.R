# preamble ---------------------------------------------------------------------

# In Notion a "Database" is an object containing one or mode "Data Sources".
# A "Data Source" is the actual table, gallery, list, etc. that you view. A
# "property" of a "Data Source" is what's rendered as a column in Notion.

# Reference:
# - Database: https://developers.notion.com/reference/database
# - Data Source: https://developers.notion.com/reference/data-source
# - Property: https://developers.notion.com/reference/property-object

# TODO: We'll want classes for all of these objects
#
# So my database API might look like this. The notion_database() constructor
# creates a <notion_database> object in R, then the notion_database_create()
# can take such an object and realize it in Notion. Likewise, notion_database_get()
# returns a <notion_database>.
#
# We can do the same for `notion_datasource()`, although we'll probably call
# it a `notion_dataframe()` or `notion_dataset()`, instead.

# construct --------------------------------------------------------------------

# Create a Notion database (`<notion_database>`) in R
# This is inspired by the `httr2::request` model which creates a request object
# *before* sending.
notion_database <- function() {

}

# create -----------------------------------------------------------------------

notion_database_create <- function() {

}

# retrieve ---------------------------------------------------------------------

notion_database_get <- function(database_id) {
  check_string(database_id)
  notion_request(
    object = "database",
    action = "retrieve",
    database_id = database_id
  )
}

# update -----------------------------------------------------------------------

notion_database_update <- function(database_id, ...) {

}
