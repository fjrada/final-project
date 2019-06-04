class InteractionsController < ApplicationController
  def list
    @interactions = Interaction.all

    render("interaction_templates/list.html.erb")
  end

  def details
    @interaction = Interaction.where({ :id => params.fetch("id_to_display") }).first

    render("interaction_templates/details.html.erb")
  end

  def blank_form
    @interaction = Interaction.new

    render("interaction_templates/blank_form.html.erb")
  end

  def save_new_info
    @interaction = Interaction.new

    @interaction.contact_id = params.fetch("contact_id")
    @interaction.details = params.fetch("details")
    @interaction.date = params.fetch("date")

    if @interaction.valid?
      @interaction.save

      redirect_to("/interactions", { :notice => "Interaction created successfully." })
    else
      render("interaction_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @interaction = Interaction.where({ :id => params.fetch("id_to_prefill") }).first

    render("interaction_templates/prefilled_form.html.erb")
  end

  def save_edits
    @interaction = Interaction.where({ :id => params.fetch("id_to_modify") }).first

    @interaction.contact_id = params.fetch("contact_id")
    @interaction.details = params.fetch("details")
    @interaction.date = params.fetch("date")

    if @interaction.valid?
      @interaction.save

      redirect_to("/interactions/" + @interaction.id.to_s, { :notice => "Interaction updated successfully." })
    else
      render("interaction_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @interaction = Interaction.where({ :id => params.fetch("id_to_remove") }).first

    @interaction.destroy

    redirect_to("/interactions", { :notice => "Interaction deleted successfully." })
  end
end
