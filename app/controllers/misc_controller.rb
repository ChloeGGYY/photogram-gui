class MiscController < ApplicationController
  def homepage
    redirect_to("/users")
  end
end
