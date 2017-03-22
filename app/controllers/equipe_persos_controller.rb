class EquipePersosController < ApplicationController
  before_action :set_equipe_perso, only: [:show, :edit, :update, :destroy]

  # GET /equipe_persos
  # GET /equipe_persos.json
  def index
    @equipe_persos = EquipePerso.all
    @joueurs = Joueur.all
  end

  # GET /equipe_persos/1
  # GET /equipe_persos/1.json
  def show
    @equipe_persos = EquipePerso.all
    @joueurs = Joueur.all
  end

  # GET /equipe_persos/new
  def new
    @equipe_perso = EquipePerso.new
  end

  # GET /equipe_persos/1/edit
  def edit
    @equipe_persos = EquipePerso.all
  end

  # POST /equipe_persos
  # POST /equipe_persos.json
  def create
    @equipe_perso = EquipePerso.new(equipe_perso_params)

    respond_to do |format|
      if @equipe_perso.save
        format.html { redirect_to @equipe_perso }
        flash[:success] = "Ton équipe a bien été crée ! Tu viens de recevoir une prime de 1200€ !"
        format.json { render :show, status: :created, location: @equipe_perso }
      else
        format.html { render :new }
        format.json { render json: @equipe_perso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipe_persos/1
  # PATCH/PUT /equipe_persos/1.json
  def update
    respond_to do |format|
      if @equipe_perso.update(equipe_perso_params)
        format.html { redirect_to @equipe_perso }
        flash[:success] = "Ton équipe a bien été modifié !"
        format.json { render :show, status: :ok, location: @equipe_perso }
      else
        format.html { render :edit }
        format.json { render json: @equipe_perso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipe_persos/1
  # DELETE /equipe_persos/1.json
  def destroy
    @equipe_perso.destroy
    respond_to do |format|
      format.html { redirect_to equipe_persos_url, success: "Ton équipe a bien été supprimé !" }
      format.json { head :no_content }
      @joueurs = Joueur.all
      @joueurs.each do |joueur|
        if joueur.estAchete?
          joueur.estAchete = false
          joueur.save
        end
      end
    end
  end

  def vendre
    @joueur = Joueur.find(params[:type])
    @joueur.estAchete = false
    @joueur.save
    redirect_to @equipe_perso
  end

  def entrainer
    @equipe_perso = EquipePerso.find(params[:id])
    bonus = 1 + rand(6)
    @equipe_perso.statsgenerale += bonus
    @equipe_perso.save
    flash[:success] = "Entraînement réussi ! Tu viens d'améliorer tes statistiques générales : +#{bonus}"
    redirect_to @equipe_perso
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipe_perso
      @equipe_perso = EquipePerso.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipe_perso_params
      params.require(:equipe_perso).permit(:nameteam, :nametrainer, :pays, :image)
    end

    def set_argent
      if EquipePerso.first
        @argentupdate = EquipePerso.first
        @argentupdate.argent += 100
        @argentupdate.save
      end
    end
end
