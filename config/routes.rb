Rails.application.routes.draw do
  # Routes for the Category resource:

  # CREATE
  match("/new_category_form", { :controller => "categories", :action => "blank_form", :via => "get" })
  match("/insert_category_record", { :controller => "categories", :action => "save_new_info", :via => "post" })

  # READ
  match("/categories", { :controller => "categories", :action => "list", :via => "get" })
  match("/categories/:id_to_display", { :controller => "categories", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_category_form/:id_to_prefill", { :controller => "categories", :action => "prefilled_form", :via => "get" })
  match("/update_category_record/:id_to_modify", { :controller => "categories", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_category/:id_to_remove", { :controller => "categories", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Interest resource:

  # CREATE
  match("/new_interest_form", { :controller => "interests", :action => "blank_form", :via => "get" })
  match("/insert_interest_record", { :controller => "interests", :action => "save_new_info", :via => "post" })

  # READ
  match("/interests", { :controller => "interests", :action => "list", :via => "get" })
  match("/interests/:id_to_display", { :controller => "interests", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_interest_form/:id_to_prefill", { :controller => "interests", :action => "prefilled_form", :via => "get" })
  match("/update_interest_record/:id_to_modify", { :controller => "interests", :action => "save_edits", :via => "post" })
  
  match("/add_contact_to_interest/:interest_id", { :controller => "interests", :action => "add_contact_to_interest", :via => "get"})
  match("/insert_contact_to_interest/:interest_id", { :controller => "interests", :action => "insert_contact_to_interest", :via => "post"})


  # DELETE
  match("/delete_interest/:id_to_remove", { :controller => "interests", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Membership resource:

  # CREATE
  match("/new_membership_form", { :controller => "memberships", :action => "blank_form", :via => "get" })
  match("/insert_membership_record", { :controller => "memberships", :action => "save_new_info", :via => "post" })

  # READ
  match("/memberships", { :controller => "memberships", :action => "list", :via => "get" })
  match("/memberships/:id_to_display", { :controller => "memberships", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_membership_form/:id_to_prefill", { :controller => "memberships", :action => "prefilled_form", :via => "get" })
  match("/update_membership_record/:id_to_modify", { :controller => "memberships", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_membership/:id_to_remove", { :controller => "memberships", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Interaction resource:

  # CREATE
  match("/new_interaction_form/:contact_id", { :controller => "interactions", :action => "blank_form", :via => "get" })
  match("/insert_interaction_record/:contact_id", { :controller => "interactions", :action => "save_new_info", :via => "post" })

  # READ
  match("/interactions", { :controller => "interactions", :action => "list", :via => "get" })
  match("/interactions/:id_to_display", { :controller => "interactions", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_interaction_form/:id_to_prefill", { :controller => "interactions", :action => "prefilled_form", :via => "get" })
  match("/update_interaction_record/:id_to_modify", { :controller => "interactions", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_interaction/:id_to_remove", { :controller => "interactions", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Relationship resource:

  # CREATE
  match("/new_relationship_form", { :controller => "relationships", :action => "blank_form", :via => "get" })
  match("/insert_relationship_record", { :controller => "relationships", :action => "save_new_info", :via => "post" })

  # READ
  match("/relationships", { :controller => "relationships", :action => "list", :via => "get" })
  match("/relationships/:id_to_display", { :controller => "relationships", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_relationship_form/:id_to_prefill", { :controller => "relationships", :action => "prefilled_form", :via => "get" })
  match("/update_relationship_record/:id_to_modify", { :controller => "relationships", :action => "save_edits", :via => "post" })

  # DELETE
  match("/delete_relationship/:id_to_remove", { :controller => "relationships", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Contact resource:

  # CREATE
  match("/new_contact_form", { :controller => "contacts", :action => "blank_form", :via => "get" })
  match("/insert_contact_record", { :controller => "contacts", :action => "save_new_info", :via => "post" })

  # READ
  match("/contacts", { :controller => "contacts", :action => "list", :via => "get" })
  match("/contacts/:id_to_display", { :controller => "contacts", :action => "details", :via => "get" })

  # UPDATE
  match("/existing_contact_form/:id_to_prefill", { :controller => "contacts", :action => "prefilled_form", :via => "get" })
  match("/update_contact_record/:id_to_modify", { :controller => "contacts", :action => "save_edits", :via => "post" })

  match("/add_interest_to_contact/:contact_id", { :controller => "contacts", :action => "add_interest_to_contact", :via => "get"})
  match("/insert_interest_to_contact/:contact_id", { :controller => "contacts", :action => "insert_interest_to_contact", :via => "post"})


  # DELETE
  match("/delete_contact/:id_to_remove", { :controller => "contacts", :action => "remove_row", :via => "get" })

  #------------------------------

  # Routes for the Navigation resource:

  match("/", { :controller => "navigation", :action => "home", :via => "get" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
