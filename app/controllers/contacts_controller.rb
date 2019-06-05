class ContactsController < ApplicationController
  def list
    @contacts = Contact.all

    render("contact_templates/list.html.erb")
  end

  def details
    @contact = Contact.where({ :id => params.fetch("id_to_display") }).first
    @interactions = Interaction.all.where({ :contact_id => params.fetch("id_to_display")})
    @interests = Interest.all.where({:id => Membership.where({ :contact_id => params.fetch("id_to_display")}).pluck(:interest_id)})
    
    render("contact_templates/details.html.erb")
  end

  def blank_form
    @contact = Contact.new

    render("contact_templates/blank_form.html.erb")
  end

  def save_new_info
    @contact = Contact.new

    @contact.user_id = params.fetch("user_id")
    @contact.main_contact = params.fetch("main_contact")
    @contact.city = params.fetch("city")
    @contact.job = params.fetch("job")
    @contact.birthday = params.fetch("birthday")
    @contact.note = params.fetch("note")
    @contact.name = params.fetch("name")
    @contact.last_name = params.fetch("last_name")
    @contact.nickname = params.fetch("nickname")
    @contact.country_of_origin = params.fetch("country_of_origin")
    @contact.category_id = params.fetch("category_id")

    if @contact.valid?
      @contact.save

      redirect_to("/contacts", { :notice => "Contact created successfully." })
    else
      render("contact_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @contact = Contact.where({ :id => params.fetch("id_to_prefill") }).first

    render("contact_templates/prefilled_form.html.erb")
  end

  def save_edits
    @contact = Contact.where({ :id => params.fetch("id_to_modify") }).first

    @contact.user_id = params.fetch("user_id")
    @contact.main_contact = params.fetch("main_contact")
    @contact.city = params.fetch("city")
    @contact.job = params.fetch("job")
    @contact.birthday = params.fetch("birthday")
    @contact.note = params.fetch("note")
    @contact.name = params.fetch("name")
    @contact.last_name = params.fetch("last_name")
    @contact.nickname = params.fetch("nickname")
    @contact.country_of_origin = params.fetch("country_of_origin")
    @contact.category_id = params.fetch("category_id")

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
  
end
