class ForexController < ApplicationController
  def list_from
    render({:template => "list_from.html.erb"})
  end
  def list_to
    @from_curr = params.fetch("from_curr")

    render({:template => "list_to.html.erb"})
  end
  def convert
    @from_curr = params.fetch("from_curr")
    @to_curr = params.fetch("to_curr")
    render({:template => "convert.html.erb"})
  end
end