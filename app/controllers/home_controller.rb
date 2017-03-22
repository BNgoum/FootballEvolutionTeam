class HomeController < ApplicationController

	def index
		@equipe_persos = EquipePerso.all
		@equipes = Equipe.all
	end

	def set_argent
      @argentupdate = EquipePerso.first
      @argentupdate.argent += 100
      @argentupdate.save
    end
end