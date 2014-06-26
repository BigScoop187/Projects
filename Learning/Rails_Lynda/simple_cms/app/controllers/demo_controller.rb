class DemoController < ApplicationController
  
  layout false
  
  def index
    render('hello')
  end
  
  def hello
    render('index')
  end
  
  # Redirecting using a controller and action
  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end
  
  # Can redirect with a string url
  def derp
    redirect_to("http://www.espn.com")
  end
  
end
