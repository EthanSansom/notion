# Stores the Notion endpoint paths and methods
.endpoints <- rlang::new_environment()

.endpoints$oauth <- list(
  token = list(method = "POST", path = "/oauth/token"),
  introspect = list(method = "POST", path = "/oauth/introspect"),
  revoke = list(method = "POST", path = "/oauth/revoke"),
  refresh = list(method = "POST", path = "/oauth/token")
)

.endpoints$block <- list(
  retrieve = list(method = "GET", path = "/blocks/{block_id}"),
  update = list(method = "PATCH", path = "/blocks/{block_id}"),
  delete = list(method = "DELETE", path = "/blocks/{block_id}")
)

.endpoints$block_children <- list(
  list = list(method = "GET", path = "/blocks/{block_id}/children"),
  append = list(method = "PATCH", path = "/blocks/{block_id}/children")
)

.endpoints$page <- list(
  create = list(method = "POST", path = "/pages"),
  retrieve = list(method = "GET", path = "/pages/{page_id}"),
  update = list(method = "PATCH", path = "/pages/{page_id}"),
  move = list(method = "POST", path = "/pages/{page_id}/move")
)

.endpoints$page_property <- list(
  retrieve = list(method = "GET", path = "/pages/{page_id}/properties/{property_id}")
)

.endpoints$database <- list(
  create = list(method = "POST", path = "/databases"),
  retrieve = list(method = "GET", path = "/databases/{database_id}"),
  update = list(method = "PATCH", path = "/databases/{database_id}")
)

.endpoints$data_source <- list(
  create = list(method = "POST", path = "/data_sources"),
  retrieve = list(method = "GET", path = "/data_sources/{data_source_id}"),
  update = list(method = "PATCH", path = "/data_sources/{data_source_id}"),
  query = list(method = "POST", path = "/data_sources/{data_source_id}/query"),
  list_templates = list(method = "GET", path = "/data_sources/{data_source_id}/templates")
)

.endpoints$comment <- list(
  create = list(method = "POST", path = "/comments"),
  list = list(method = "GET", path = "/comments"),
  retrieve = list(method = "GET", path = "/comments/{comment_id}")
)

.endpoints$file_upload <- list(
  create = list(method = "POST", path = "/file_uploads"),
  send = list(method = "POST", path = "/file_uploads/{file_upload_id}/send"),
  complete = list(method = "POST", path = "/file_uploads/{file_upload_id}/complete"),
  retrieve = list(method = "GET", path = "/file_uploads/{file_upload_id}"),
  list = list(method = "GET", path = "/file_uploads")
)

.endpoints$search <- list(
  query = list(method = "POST", path = "/search")
)

.endpoints$user <- list(
  list = list(method = "GET", path = "/users"),
  retrieve = list(method = "GET", path = "/users/{user_id}"),
  me = list(method = "GET", path = "/users/me")
)

# Anything else we need to record
.notion <- rlang::new_environment()

.notion$valid_objects <- rlang::env_names(.endpoints)
.notion$valid_actions <- eapply(.endpoints, names)
