class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :estAchete, -> { where(estAchete: 1) }

  
end
