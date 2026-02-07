# todos ------------------------------------------------------------------------

# TODO: Properties workflow
# - Implement and test 1-2 full examples and then get AI to create copies of the
#   remainder, using my implementation for bolierplate

# TODO: Properties are the Notion columns and they'll be naturally representable
# as {vctrs} vectors. For each property, we'll define the appropriate vector and
# it's set of casts.
#
# - We only require a minimal set of methods: print, format, abbreviation, etc.
# - We don't need to implement every property right now
#
# TODO: Methods - do {pillar} and {vctrs}. We'll depend on both as imports.

# TODO: For the V1 (or V2) implement R -> Notion formulas, but not Notion -> R
# - For the Notion -> R, consider a parser ({rly} (https://github.com/systemincloud/rly))
#   or, for fun, write something in C/C++ ({cpp11}?) with a parsing library there

# TODO: Reactive formulas
# We can (in a `notion_data_source()` context) actually show the computed
# values of a formula. Something like this:
#
# Store the expression to compute the formula
# notion_formula <- function(expr, data) {
#   expr <- substitute(expr)
#   vctrs::new_vctr(data = logical(), expr = expr, class = "notion_formula")
# }
#
# vec_proxy.notion_formula <- function(x, ...) {
#   mask <- get_data_source_mask() # Like dplyr, ask if we're in a data-source
#   if (is.null(mask)) stop("Can't evaluate formulas outside of a Notion Data Source.")
#   eval_tidy(attr(x, "expr"), mask)
# }
#
# Obviously do better mask handling (steal from dplyr) and implementation. See
# what dbplyr and similar does for this sort of thing as well.
