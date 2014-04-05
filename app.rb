require 'sinatra'
require 'git_fame'
require 'pry'
require 'json'

get '/' do
  "Set your Github webhook to POST here."
end

post '/' do
  repository = GitFame::Base.new({
    sort: 'loc',
    repository: `pwd`.strip,
    progressbar: false,
    whitespace: false,
    bytype: false,
    exclude: 'vendor, public/assets'
  })
  html = "<ul>"
  repository.authors.each do |author|
    html += "<li>#{author.name}: LOC: #{author.loc} Commits: #{author.commits} Files: #{author.files}</li>"
  end
  html += "</ul>"

  push = JSON.parse(params.to_json)
  html =  "I got some JSON: #{push.inspect}"

  html
end
