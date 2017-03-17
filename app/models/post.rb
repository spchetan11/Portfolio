class Post < ActiveRecord::Base
	
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true

# --paperclip --
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
# --paperclip--
end
