class InterestsController < ApplicationController
  def list
    @interests = Interest.all.where({ :user_id => current_user.id})

    render("interest_templates/list.html.erb")
  end

  def details
    @interest = Interest.where({ :id => params.fetch("id_to_display") }).where({ :user_id => current_user.id}).first
    @contacts = Contact.where({ :id => Membership.where({ :interest_id => params.fetch("id_to_display")}).pluck(:contact_id)})
    
    if @interest.nil?
        redirect_to("/interests")
    else  
        @memberships = Membership.where({ :interest_id => @interest.id})

        render("interest_templates/details.html.erb")
    end
    
  end

  def blank_form
    @interest = Interest.new
    @membership = Membership.new

    render("interest_templates/blank_form.html.erb")
  end

  def save_new_info
    @interest = Interest.new

    @interest.name = params.fetch("name")
    @interest.user_id = params.fetch("user_id")

    if @interest.valid?
      @interest.save
      
      redirect_to("/interests/" + @interest.id.to_s, { :notice => "Interest created successfully." })
    else
      render("interest_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @interest = Interest.where({ :id => params.fetch("id_to_prefill") }).first

    render("interest_templates/prefilled_form.html.erb")
  end

  def save_edits
    @interest = Interest.where({ :id => params.fetch("id_to_modify") }).first

    @interest.name = params.fetch("name")

    if @interest.valid?
      @interest.save

      redirect_to("/interests/" + @interest.id.to_s, { :notice => "Interest updated successfully." })
    else
      render("interest_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @interest = Interest.where({ :id => params.fetch("id_to_remove") }).first

    @interest.destroy

    redirect_to("/interests", { :notice => "Interest deleted successfully." })
  end
  
  def add_contact_to_interest
    
    @interest = Interest.where({ :id => params.fetch("interest_id") }).first
    @contacts = Contact.all.where({ :user_id => current_user.id})
    
    render("interest_templates/add_contact.html.erb")
  end

  def insert_contact_to_interest
    
    @interest = Interest.where({ :id => params.fetch("interest_id") }).first
    
    @contacts = Contact.all.where({ :user_id => current_user.id})
    
    @membership = Membership.new

    @membership.contact_id = params.fetch("contact_id")
    @membership.interest_id = @interest.id

    @membership.save

    redirect_to("/interests/" + @interest.id.to_s, { :notice => "Contact added successfully." })
  end

end
