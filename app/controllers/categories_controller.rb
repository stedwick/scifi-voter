class CategoriesController < ApplicationController
  def index
    list
    render :action => 'list'
  end

  def list
    @header2 = "Vote on things!"
  end

  def show
    @category = Category.find(params[:id])

    if @category.parent
      @header2 = @category.parent.name
      @header3 = @category.name
    else
      @header2 = @category.name
    end
  end
end
