class JoueursController < ApplicationController

	before_action :set_joueur, only: [:update, :edit, :show, :destroy]
  # before_action :authenticate_user!

  def index
    @search = Joueur.search(params[:q])
    @joueurs = @search.result.paginate(:page => params[:page], :per_page => 12)
  	# @joueurs = Joueur.all.paginate(:page => params[:page], :per_page => 8)
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
    if @joueur.present?
      @equipe_perso = EquipePerso.first
      if @equipe_perso.argent >= @joueur.prix
        @equipe_perso.argent -= @joueur.prix
        @equipe_perso.effectif += 1
        @equipe_perso.save
        @joueur.estAchete = true
        @joueur.save
        flash[:success] = "#{@joueur.name} a bien été acheté !"
        redirect_to joueurs_path
      else
        flash[:danger] = "Vous n'avez pas assez d'argent !"
        redirect_to joueurs_path
      end
      
    end
  end

  def vendre
    @joueur = Joueur.find(params[:type])
    @equipe_perso = EquipePerso.first
    @equipe_perso.argent += @joueur.prix/2
    @equipe_perso.effectif -= 1
    @equipe_perso.save
    @joueur.estAchete = false
    @joueur.save
    flash[:success] = "#{@joueur.name} a bien été vendu et tu obtiens la somme de #{@joueur.prix/2}€ !"
    redirect_to equipe_perso_path
  end

  def defier
    @equipe = Equipe.find(params[:id])
    @mon_equipe = EquipePerso.first
    if @mon_equipe.statsgenerale > @equipe.statsgenerale
      @mon_equipe.argent += 2000
      flash[:success] = "Bravo ! Tu as gagné contre #{@equipe.name} ! Tu remportes une récompense de 2000€ !"
    elsif @mon_equipe.statsgenerale == @equipe.statsgenerale
      flash[:warning] = "Match nul ! Aucune des deux équipes n'a su prendre l'avantage. Entraîne-toi et reviens défier #{@equipe.name}"
    else
      @mon_equipe.argent -= 1000
      flash[:danger] = "Dommage... #{@equipe.name} est beaucoup trop fort pour toi ! Entraîne-toi et revient défier #{@equipe.name}. Tu viens de perdre 1000€."
    end
    @mon_equipe.save
    redirect_to equipes_path
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
