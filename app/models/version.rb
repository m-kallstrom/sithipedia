class Version < ApplicationRecord
  belongs_to :article
  belongs_to :editor, class_name: "User"
  belongs_to :category
  has_many :placements
  has_many :photos, through: :placements

end
