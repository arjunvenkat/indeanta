Rails.application.routes.draw do



  resources :photos
  resources :comments
  # Routes for the Post resource:

  root to: "posts#index"

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
  get("/posts/new", { :controller => "posts", :action => "new" })

  # READ
  get("/posts", { :controller => "posts", :action => "index", as: "posts"})

  get("/posts/:path_id", { :controller => "posts", :action => "show", as: "post" })

  # UPDATE

  get("/posts/:path_id/edit", { :controller => "posts", :action => "edit" })
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })

  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Comment category resource:

  # CREATE
  post("/insert_comment_category", { :controller => "comment_categories", :action => "create" })

  # READ
  get("/comment_categories", { :controller => "comment_categories", :action => "index" })

  get("/comment_categories/:path_id", { :controller => "comment_categories", :action => "show" })

  # UPDATE

  post("/modify_comment_category/:path_id", { :controller => "comment_categories", :action => "update" })

  # DELETE
  get("/delete_comment_category/:path_id", { :controller => "comment_categories", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:

  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
  post("/comments", { :controller => "comments", :action => "create" })

  # READ
  get("/comments", { :controller => "comments", :action => "index" })

  get("/comments/:path_id", { :controller => "comments", :action => "show" })

  # UPDATE

  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })

  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Reaction category resource:

  # CREATE
  post("/insert_reaction_category", { :controller => "reaction_categories", :action => "create" })

  # READ
  get("/reaction_categories", { :controller => "reaction_categories", :action => "index" })

  get("/reaction_categories/:path_id", { :controller => "reaction_categories", :action => "show" })

  # UPDATE

  post("/modify_reaction_category/:path_id", { :controller => "reaction_categories", :action => "update" })

  # DELETE
  get("/delete_reaction_category/:path_id", { :controller => "reaction_categories", :action => "destroy" })

  #------------------------------

  # Routes for the Reaction resource:

  # CREATE
  post("/insert_reaction", { :controller => "reactions", :action => "create" })
  post("/reactions", { :controller => "reactions", :action => "create", as: "reactions" })

  # READ
  get("/reactions", { :controller => "reactions", :action => "index" })

  get("/reactions/:path_id", { :controller => "reactions", :action => "show" })

  # UPDATE

  post("/modify_reaction/:path_id", { :controller => "reactions", :action => "update" })

  # DELETE
  get("/delete_reaction/:path_id", { :controller => "reactions", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
