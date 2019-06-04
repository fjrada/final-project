class InterestsController < ApplicationController
  def list
    @interests = Interest.all

    render("interest_templates/list.html.erb")
  end

  def details
    @interest = Interest.where({ :id => params.fetch("id_to_display") }).first

    render("interest_templates/details.html.erb")
  end

  def blank_form
    @interest = Interest.new

    render("interest_templates/blank_form.html.erb")
  end

  def save_new_info
    @interest = Interest.new

    @interest.name = params.fetch("name")
    @interest.user_id = params.fetch("user_id")

    if @interest.valid?
      @interest.save

      redirect_to("/interests", { :notice => "Interest created successfully." })
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
    @interest.user_id = params.fetch("user_id")

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
end
