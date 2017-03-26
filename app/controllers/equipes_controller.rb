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

  def acheter
    @joueur = Joueur.find(params[:id])
    if @joueur.present?
      @equipe_perso = EquipePerso.first
      if @equipe_perso.argent >= @joueur.prix
        @equipe_perso.argent -= @joueur.prix
        @equipe_perso.effectif += 1
        @equipe_perso.save
        @joueur.estAchete = true
        @joueur.save
        flash[:success] = "#{@joueur.name} a bien été acheté !"
        redirect_to equipe_path(@joueur.equipe_id)
      else
        flash[:danger] = "Vous n'avez pas assez d'argent !"
        redirect_to equipe_path(@joueur.equipe_id)
      end
    end
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
