class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable
         # Include default devise modules. Others available are:
         # :lockable, :timeoutable and :omniauthable

  has_many :wikis
  has_many :collaborators

  after_initialize :assign_default_role

  def assign_default_role
    self.add_role(:standard) if self.roles.blank?
  end

end
