class HomeController < ApplicationController
	after_action :set_argent, only: [:show, :edit, :update, :destroy]
	
	def index
		@equipe_persos = EquipePerso.all
	end

	def set_argent
      @argentupdate = EquipePerso.first
      @argentupdate.argent += 100
      @argentupdate.save
    end
end