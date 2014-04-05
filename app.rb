require 'sinatra'
require 'git_fame'

get '/' do
  repository = GitFame::Base.new({
    sort: "loc",
    repository: ".",
    progressbar: false,
    whitespace: false,
    bytype: false,
    exclude: "vendor, public/assets"
  })
end
