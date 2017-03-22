class EquipesController < ApplicationController

	before_action :set_equipe, only: [:update, :show, :edit, :destroy]

  def index
    @search = Equipe.search(params[:q])
  	@equipes = @search.result.paginate(:page => params[:page], :per_page => 8)
    @equipe_persos = EquipePerso.all
  end

  def show
    @equipe_persos = EquipePerso.all
  end

  def edit
  end

  def update
  	equipe_params = update_equipe_params
  	@equipe.update(equipe_params)
  	redirect_to equipe_path, success: "L'équipe a bien été modifié !"
  end

  def new
  	@equipe = Equipe.new
  end

  def create
  	equipe = Equipe.create(create_equipe_params)
  	redirect_to equipe_path(equipe.id)
  end

  def destroy
  	@equipe.destroy
  	redirect_to equipes_path
  end

  # def defier
  #   @equipe = Equipe.find(params[:id])
  #   @mon_equipe = EquipePerso.first
  #   if @mon_equipe.statsgenerale > @equipe.statsgenerale
  #   end
  # end


  private
  def create_equipe_params
  	params.require(:equipe).permit(:name, :pays, :entraineur, :statsgenerale, :nombreJoueurs, :image)
  end

  def update_equipe_params
    params.require(:equipe).permit(:entraineur, :statsgenerale, :image)
  end

  def set_equipe
  	@equipe = Equipe.find(params[:id])
  end

  def set_argent
      @argentupdate = EquipePerso.first
      @argentupdate.argent += 100
      @argentupdate.save
    end
end
