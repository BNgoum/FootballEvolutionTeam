class EquipesController < ApplicationController

	before_action :set_equipe, only: [:update, :show, :edit, :destroy]
  after_action :set_argent, only: [:show, :edit, :update, :destroy]

  def index
  	@equipes = Equipe.all
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
