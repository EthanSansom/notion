# todos ------------------------------------------------------------------------

# TODO: Reading
# - Brush up on REST: https://aws.amazon.com/what-is/restful-api/
# - Read {httr2} for advice on writing wrappers
#   - Secrets: https://httr2.r-lib.org/articles/wrapping-apis.html#secret-management

# TODO: Base on {gh}
# - Their codebase is great: https://github.com/r-lib/gh/tree/main

# TODO: Consider {cli}
# - See if we actually need this
# - Most likely case is user-interaction for getting permissions / auth

# TODO: {vctrs} for the `property()` class
# - Notion properties are columns, so we'll use vctrs to manage casting
#   R objects into Notion properties

# TODO: Provide an "expert user" Notion request, which talks to Notion but
#       can be to any endpoint (even ones I don't support).

# notion_request ---------------------------------------------------------------

# TODO: This will be the low-level interface for power users. I'll also use
#       it to power my functions.

# TODO: Other concerns - I think {gh} covers all of this
# - Rate limiting
# - Size limiting
# - Retrying

# TODO: Work on this, follow `gh::gh()`
# - object : type of object (e.g. "database")
# - action : the endpoint action (e.g. "create", "update", "delete")
notion_request <- function(
    object,
    action,
    ...,
    .token = notion_token(),
    .call = caller_env()
) {
  check_string(object, call = .call)
  check_string(action, call = .call)
  check_string(.token, call = .call)

  endpoint <- get_endpoint(object, action)
  if (is.null(endpoint)) stop_invalid_endpoint(object, action, call = .call)

  params <- list2(...)

  path_params_loc <- names(params) %in% path_params(endpoint$path)
  path_params <- params[path_params_loc]
  remaining_params <- params[!path_params_loc]

  path <- glue::glue_data(path_params, endpoint$path)

  req <- httr2::request(paste0("https://api.notion.com/v1", path))
  req <- httr2::req_method(req, endpoint$method)
  req <- httr2::req_headers(
    req,
    `Notion-Version` = "2025-09-03",
    Authorization = paste("Bearer", .token)
  )

  if (!is_empty(remaining_params)) {
    if (endpoint$method %in% c("GET", "DELETE")) {
      req <- httr2::req_url_query(req, remaining_params, .multi = "explode")
    } else {
      req <- httr2::req_body_json(req, data = remaining_params)
    }
  }

  # TODO: Consider wrapping errors like in {gh}
  httr2::req_perform(req)
}

get_endpoint <- function(object, action) {
  .endpoints[[object]][[action]]
}

# helpers ----------------------------------------------------------------------

# Pulls expressions out of glue strings (as a character vector)
# E.g. `c("page_id", "property_id")` from "{page_id}/properties/{property_id}"
# Modified from: https://github.com/tidyverse/glue/issues/73
path_params <- function(path) {
  params <- character()
  glue::glue(
    path,
    .transformer = function(expr, envir) params <<- c(params, expr)
  )
  params
}
