class Photo < ApplicationRecord
  has_many :placements
  has_many :versions, through: :placements


#   has_attached_file :picture, styles: {
#     thumb: '100x100',
#     medium: '300x300'
#   }

# validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/


  # has_attached_file :download,
  #                   :storage => :s3,
  #                   :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  # def s3_credentials
  #   {:bucket => ENV['BUCKET'], :access_key_id => ENV['SITH_KEY'], :secret_access_key => ENV['SECRET_SITH_KEY']}
  # end

  # :s3_permissions => {
  #   :original => :"public-read"
  # }
end
