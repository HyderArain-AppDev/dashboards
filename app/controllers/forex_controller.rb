class ForexController < ApplicationController
  def list_from
    url = "https://api.exchangerate.host/symbols"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)

    @sym_array = Array.new


      sym_hash = @response_obj.fetch("symbols")
      i = 0
        sym_hash.keys.each do
          @sym_array.push(sym_hash.keys[i])
          i = i+1
        end


    render({:template => "list_from.html.erb"})
  end
  def list_to
    @from_curr = params.fetch("from_curr")
    url = "https://api.exchangerate.host/symbols"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @response_obj = JSON.parse(response)

    @sym_array = Array.new


      sym_hash = @response_obj.fetch("symbols")
      i = 0
        sym_hash.keys.each do
          @sym_array.push(sym_hash.keys[i])
          i = i+1
        end
    render({:template => "list_to.html.erb"})
  end
  def convert
    @from_curr = params.fetch("from_curr")
    @to_curr = params.fetch("to_curr")

    require 'net/http'
    require 'json'

    url = "https://api.exchangerate.host/convert?from=" + @from_curr + "&to=" + @to_curr
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)

    @rate = response_obj.fetch("result")
    render({:template => "convert.html.erb"})
  end
end