class CategoriesController < ApplicationController
  def list
    @categories = Category.all

    render("category_templates/list.html.erb")
  end

  def details
    @category = Category.where({ :id => params.fetch("id_to_display") }).first

    render("category_templates/details.html.erb")
  end

  def blank_form
    @category = Category.new

    render("category_templates/blank_form.html.erb")
  end

  def save_new_info
    @category = Category.new

    @category.name = params.fetch("name")
    @category.frequency = params.fetch("frequency")
    @category.user_id = params.fetch("user_id")

    if @category.valid?
      @category.save

      redirect_to("/categories", { :notice => "Category created successfully." })
    else
      render("category_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @category = Category.where({ :id => params.fetch("id_to_prefill") }).first

    render("category_templates/prefilled_form.html.erb")
  end

  def save_edits
    @category = Category.where({ :id => params.fetch("id_to_modify") }).first

    @category.name = params.fetch("name")
    @category.frequency = params.fetch("frequency")
    @category.user_id = params.fetch("user_id")

    if @category.valid?
      @category.save

      redirect_to("/categories/" + @category.id.to_s, { :notice => "Category updated successfully." })
    else
      render("category_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @category = Category.where({ :id => params.fetch("id_to_remove") }).first

    @category.destroy

    redirect_to("/categories", { :notice => "Category deleted successfully." })
  end
end
