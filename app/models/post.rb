class Post < ActiveRecord::Base
  attr_accessible :area, :email, :name, :avatar
  validates :name, :email, :area, :presence => true;
  validates :name, :area, length: { minimum: 2 }
  validates :email, uniqueness: true
  has_attached_file :avatar, :styles => { :medium => "200x250>", :thumb  => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\z/

end
