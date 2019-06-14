class ContactsController < ApplicationController
  def list
    @contacts = Contact.where({ :user_id => current_user.id})

    render("contact_templates/list.html.erb")
  end

  def details
    @contact = Contact.where({ :id => params.fetch("id_to_display") }).where({ :user_id => current_user.id}).first
    @interactions = Interaction.all.where({ :contact_id => params.fetch("id_to_display")})
    @interests = Interest.all.where({:id => Membership.where({ :contact_id => params.fetch("id_to_display")}).pluck(:interest_id)})
    @interests_user = Interest.all.where({ :user_id => current_user.id})
    @interaction = Interaction.new


    
    if @contact.nil?
      redirect_to("/interests")
    else
      render("contact_templates/details.html.erb")
    end
  end

  def blank_form
    @contact = Contact.new

    render("contact_templates/blank_form.html.erb")
  end

  def save_new_info
    @contact = Contact.new

    @contact.user_id = params.fetch("user_id")
    @contact.city = params.fetch("city")
    @contact.job = params.fetch("job")
    @contact.birthday = params.fetch("birthday")
    @contact.note = params.fetch("note")
    @contact.name = params.fetch("name")
    @contact.last_name = params.fetch("last_name")
    @contact.nickname = params.fetch("nickname")
    @contact.country_of_origin = params.fetch("country_of_origin")

    if @contact.valid?
      @contact.save

      redirect_to("/contacts/" + @contact.id.to_s, { :notice => "Contact created successfully." })
    else
      render("contact_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @contact = Contact.where({ :id => params.fetch("id_to_prefill") }).where({ :user_id => current_user.id}).first

    render("contact_templates/prefilled_form.html.erb")
  end

  def save_edits
    @contact = Contact.where({ :id => params.fetch("id_to_modify") }).first

    @contact.user_id = params.fetch("user_id")
    @contact.city = params.fetch("city")
    @contact.job = params.fetch("job")
    @contact.birthday = params.fetch("birthday")
    @contact.note = params.fetch("note")
    @contact.name = params.fetch("name")
    @contact.last_name = params.fetch("last_name")
    @contact.nickname = params.fetch("nickname")
    @contact.country_of_origin = params.fetch("country_of_origin")

    if @contact.valid?
      @contact.save

      redirect_to("/contacts/" + @contact.id.to_s, { :notice => "Contact updated successfully." })
    else
      render("contact_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @contact = Contact.where({ :id => params.fetch("id_to_remove") }).first

    @contact.destroy

    redirect_to("/contacts", { :notice => "Contact deleted successfully." })
  end

  def add_interest_to_contact
    
    @interests = Interest.all.where({ :user_id => current_user.id})
    @contact = Contact.where({ :id => params.fetch("contact_id") }).first
    

    render("contact_templates/add_interest.html.erb")
  end

  def insert_interest_to_contact
    
    @contact = Contact.where({ :id => params.fetch("contact_id") }).first
    
    @interests = Interest.where({ :user_id => current_user.id})
    
    @membership = Membership.new

    @membership.contact_id = @contact.id
    @membership.interest_id = params.fetch("interest_id")

    @membership.save

    redirect_to("/contacts/" + @contact.id.to_s, { :notice => "Interest added successfully." })
  end

  
end
