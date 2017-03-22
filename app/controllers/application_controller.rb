class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	@equipe_persos = EquipePerso.first
  end

  private

end
