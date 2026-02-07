# check ------------------------------------------------------------------------


# stop -------------------------------------------------------------------------

# `object` and `action` have been pre-validated by `check_string()`
stop_invalid_endpoint <- function(
    object,
    action,
    ...,
    object_arg = caller_arg(object),
    action_arg = caller_arg(action),
    call = caller_env()
) {
  valid_objects <- .notion$valid_objects
  if (object %notin% valid_objects) {
    valid <- oxford_comma(str_encode(valid_objects))
    invalid <- str_encode(object)
    abort(
      glue::glue("`{object_arg}` must be one of {valid}, not {invalid}."),
      call = call,
      class = c("notion_error", "notion_error_input_type")
    )
  }

  valid_actions <- .notion$valid_actions[[object]]
  abort(
    glue::glue("`{object_arg}` must be one of {valid}, not {invalid}."),
    call = call,
    class = c("notion_error", "notion_error_input_type")
  )
}

# messages ---------------------------------------------------------------------

# - oxford_comma(chr, sep = ", ", final = "or") in "standalone-obj-type.R"
# - str_encode(x, width = 30, ...) from "standalone-obj-type.R"

str_encode <- function(x, width = 30, ...) {
  if (nchar(x) > width) {
    x <- substr(x, 1, width - 3)
    x <- paste0(x, "...")
  }
  encodeString(x, ...)
}
