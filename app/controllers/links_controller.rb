class LinksController < ApplicationController
  before_action :authenticate_user, only: [:destroy]
  before_action :set_link, only: [:show, :update, :destroy]

  # GET /links
  def index
    @q = Link.ransack(params[:q])
    @links = @q.result(distinct: true).order("created_at DESC").paginate(page: params[:page], per_page: 5)

    render json: {
       links: @links,
       current_page: @links.current_page,
       total_pages: @links.total_pages
   }

  end

  # GET /links/1
  def show
    render json: @link
  end

  # POST /links
  def create
    @link = Link.new(link_params)

    if @link.save
      render json: @link, status: :created, location: @link
    else
      render json: @link.errors.messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def link_params
      params.require(:link).permit(:title, :link, :user_id, :user_name)
    end
end
