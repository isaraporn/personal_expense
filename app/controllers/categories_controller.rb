class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.xml

  def index
    @categories = Category.all
    @summary = 0

    for x in @categories
      total_item_in_category = Item.find_all_by_category_id(x.id)
      temp_total = 0
      for y in total_item_in_category
        temp_total = temp_total+y.expense
      end
      @categories[x.id-1].update_attributes(:total => temp_total)
      @summary = @summary + temp_total
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end

  end

  # GET /categories/1
  # GET /categories/1.xml
  def show
    @category = Category.find(params[:id])
    @itemlist = Item.find_all_by_category_id(@category)
    @summary = 0
    for a in @itemlist
      @summary = @summary+a.expense
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to(@category, :notice => 'Category was successfully created.') }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to(@category, :notice => 'Category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end
end
