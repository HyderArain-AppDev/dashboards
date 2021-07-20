class ForexController < ApplicationController
  def list_from
    render({:template => "list_from.html.erb"})
  end
  def list_to
    @from_curr = params.fetch("from_curr")
    require 'net/http'
    require 'json'

    url = "https://api.exchangerate.host/convert?from=USD&to=EUR"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)


    render({:template => "list_to.html.erb"})
  end
  def convert
    @from_curr = params.fetch("from_curr")
    @to_curr = params.fetch("to_curr")
    render({:template => "convert.html.erb"})
  end
end