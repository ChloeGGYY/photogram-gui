class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames[0]

   # if the_user == nil
   #   redirect_to("/users")
  #  else
    render({ :template => "user_templates/show" })
   # end
  end

  def create
    input_username = params.fetch("query_username")
    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save

    redirect_to("/users")
    #render({ :template => "photo_templates/create"})
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users = User.where({ :id => the_id })
    the_user = matching_users[0]

    input_username = params.fetch("query_username")
   the_user.username = input_username
   the_user.save

   redirect_to("/users/" + the_user.id.to_s)
    #render({ :template => "photo_templates/update"})
  end

end
