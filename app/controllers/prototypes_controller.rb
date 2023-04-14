class PrototypesController < ApplicationController
    before_action :authenticate_user!, onry: [:edit, :destroy]
    before_action :move_to_index, except: [:index, :prototype_show, :user_show, :login, :User_new, :show, :new, :create, :edit, :destroy, :update]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  
  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
  end
    end

    def show
      @comment = Comment.new
      @prototype = Prototype.find(params[:id])
      @comments = @prototype.comments
    end

    def edit
      @prototype = Prototype.find(params[:id])
    end

    def update
      @prototype = Prototype.find(params[:id])
      if @prototype.update(prototype_params)
        redirect_to @prototype
      else
        render :edit
      end
  end

def destroy
  @prototype = Prototype.find(params[:id])
  @prototype.comments.destroy_all 
  if @prototype.destroy
    redirect_to @prototype
  end
end

    private

    def prototype_params
      params.require(:prototype).permit(:title, :concept, :catch_copy, :image).merge(user_id: current_user.id)
  end
 end

 def move_to_index
  @prototype = Prototype.find(params[:prototype_id])
  unless user_signed_in? && current_user.id == @prototype.user_id
    redirect_to action: :index
  end

end