AlgoliaSearch.configuration = {
  application_id: ENV['algolia_application_id'],
  api_key: ENV['algolia_api_key'],
  connect_timeout: 2,
  receive_timeout: 30,
  send_timeout: 30,
  batch_timeout: 120,
  search_timeout: 5
}
