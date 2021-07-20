class ApplicationController < ActionController::Base
  def home
    render({:template => "index.html.erb"})
  end
end
