Rails.application.routes.draw do
  get '/', to: 'api#heartbeat'
  post '/', to: 'api#execute'

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/'
end
