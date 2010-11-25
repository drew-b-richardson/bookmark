class LinksController < ApplicationController
  # GET /links
  # GET /links.xml
  def index
    @categories = Category.find(:all,  :order => "position ASC")
    #@links = Link.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @links }
    end
  end

  # GET /links/1
  # GET /links/1.xml
  def show
    @link = Link.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/new
  # GET /links/new.xml
  def new
    @link = Link.new

    @categories = Category.find(:all)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @link }
    end
  end

  # GET /links/1/edit
  def edit
    @link = Link.find(params[:id])
    @categories = Category.find(:all)
  end

  # POST /links
  # POST /links.xml
  def create
    @link = Link.new(params[:link])

    respond_to do |format|
      if @link.save
        format.html { redirect_to(@link, :notice => 'Link was successfully created.') }
        format.xml  { render :xml => @link, :status => :created, :location => @link }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /links/1
  # PUT /links/1.xml
  def update
    @link = Link.find(params[:id])
    respond_to do |format|
      if @link.update_attributes(params[:link])
        format.html { redirect_to(@link, :notice => 'Link was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @link.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.xml
  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    respond_to do |format|
      format.html { redirect_to(links_url) }
      format.xml  { head :ok }
    end
  end


  def move_up

    @link = Link.find(params[:link_id])
    @category = Category.find(params[:cat_id])

    #get all links for chosen category and determine index of current
    links = Link.where("category_id = #{@category.id}", :order => "position ASC")
    logger.info('number of links = ' + links.length.to_s)
    index = links.index(@link)
    logger.info('index =' + index.to_s)

    #delete current, and then reinsert one above current (unless current is 0)
    links.delete_at(index)
    logger.info('after delete numb links = '+ links.length.to_s)
    if index != 0
      index = index - 1
    end 
    logger.info('links class = ' + links.class.to_s)
    links.to_a.insert(index, @link)

    logger.info('after add numb links = '+ links.length.to_s)
    #reset position of all based on array index
    i = 0
    links.each do |link|
      link.position = i
      link.save
      i += 1
    end

    redirect_to :action => :index
  end

end
