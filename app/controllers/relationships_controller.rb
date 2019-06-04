class RelationshipsController < ApplicationController
  def list
    @relationships = Relationship.all

    render("relationship_templates/list.html.erb")
  end

  def details
    @relationship = Relationship.where({ :id => params.fetch("id_to_display") }).first

    render("relationship_templates/details.html.erb")
  end

  def blank_form
    @relationship = Relationship.new

    render("relationship_templates/blank_form.html.erb")
  end

  def save_new_info
    @relationship = Relationship.new

    @relationship.owner_id = params.fetch("owner_id")
    @relationship.relative_id = params.fetch("relative_id")
    @relationship.nature = params.fetch("nature")

    if @relationship.valid?
      @relationship.save

      redirect_to("/relationships", { :notice => "Relationship created successfully." })
    else
      render("relationship_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @relationship = Relationship.where({ :id => params.fetch("id_to_prefill") }).first

    render("relationship_templates/prefilled_form.html.erb")
  end

  def save_edits
    @relationship = Relationship.where({ :id => params.fetch("id_to_modify") }).first

    @relationship.owner_id = params.fetch("owner_id")
    @relationship.relative_id = params.fetch("relative_id")
    @relationship.nature = params.fetch("nature")

    if @relationship.valid?
      @relationship.save

      redirect_to("/relationships/" + @relationship.id.to_s, { :notice => "Relationship updated successfully." })
    else
      render("relationship_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @relationship = Relationship.where({ :id => params.fetch("id_to_remove") }).first

    @relationship.destroy

    redirect_to("/relationships", { :notice => "Relationship deleted successfully." })
  end
end
