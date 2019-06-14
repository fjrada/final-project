class MembershipsController < ApplicationController
  def list
    @memberships = Membership.all

    render("membership_templates/list.html.erb")
  end

  def details
    @membership = Membership.where({ :id => params.fetch("id_to_display") }).first

    render("membership_templates/details.html.erb")
  end

  def blank_form
    @membership = Membership.new

    render("membership_templates/blank_form.html.erb")
  end

  def save_new_info
    @membership = Membership.new

    @membership.contact_id = params.fetch("contact_id")
    @membership.interest_id = params.fetch("interest_id")

    if @membership.valid?
      @membership.save

      redirect_to("/memberships", { :notice => "Membership created successfully." })
    else
      render("membership_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @membership = Membership.where({ :id => params.fetch("id_to_prefill") }).first

    render("membership_templates/prefilled_form.html.erb")
  end

  def save_edits
    @membership = Membership.where({ :id => params.fetch("id_to_modify") }).first

    @membership.contact_id = params.fetch("contact_id")
    @membership.interest_id = params.fetch("interest_id")

    if @membership.valid?
      @membership.save

      redirect_to("/memberships/" + @membership.id.to_s, { :notice => "Membership updated successfully." })
    else
      render("membership_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @membership = Membership.where({ :id => params.fetch("id_to_remove") }).first

    @membership.destroy

    redirect_to("/interests/" + @membership.interest_id.to_s, { :notice => "Membership deleted successfully." })
  end
end
