class JoueursController < ApplicationController

	before_action :set_joueur, only: [:update, :edit, :show, :destroy]
  after_action :set_argent, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  def index
  	@joueurs = Joueur.all.paginate(:page => params[:page], :per_page => 8)
    @equipes = Equipe.all
    @equipe_persos = EquipePerso.all
  end

  def show
    @equipe_persos = EquipePerso.all
    @joueurs = Joueur.all
  end

  def edit
    @equipe_persos = EquipePerso.all
    @joueurs = Joueur.all
  end

  def update
  	joueur_params = update_joueur_params
  	if @joueur.update(joueur_params)
  	 redirect_to joueurs_path, success: "Le joueur a bien été modifié !"
    else
      render 'edit'
    end
  end

  def new
  	@joueur = Joueur.new
    @equipe_persos = EquipePerso.all
    # @joueur = current_user.joueurs.build
  end

  def create
  	joueur = Joueur.create(create_joueur_params)
  	redirect_to joueurs_path(joueur.id), flash: {success: "Le joueur a bien été recruté !"}
    
  end

  def destroy
  	@joueur.destroy
  	redirect_to joueurs_path, flash: {success: "Le joueur a bien été licencié !"}
  end

  def acheter
    @joueur = Joueur.find(params[:id])
    @joueur.estAchete = true
    @joueur.save
    redirect_to joueurs_path
  end

  def vendre
    @joueur = Joueur.find(params[:type])
    @joueur.estAchete = false
    @joueur.save
    redirect_to equipe_perso_path
  end




  private

  def create_joueur_params
  	params.require(:joueur).permit(:name, :club, :nationalite, :prix, :poste, :statsgenerale, :pac, :dri, :tir, :def, :pas, :phy, :qualite, :image)
  end

  def update_joueur_params
  	params.require(:joueur).permit(:pac, :dri, :tir, :def, :pas, :phy, :qualite, :image, :prix)
  end

  def set_joueur
  	@joueur = Joueur.find(params[:id])
  end

  def set_argent
      @argentupdate = EquipePerso.first
      @argentupdate.argent += 100
      @argentupdate.save
    end
end
