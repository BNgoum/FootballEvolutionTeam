class Joueur < ActiveRecord::Base
	# validates :name, :club, :nationalite, :poste, :statsgenerale, :pac, :dri, :tir, :def, :pas, :phy, :qualite, presence: { message: ': ce champs ne doit pas être vide !'}
	# belongs_to :user
	# belongs_to :equipe
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	has_many :equipe_persos

	
	
end