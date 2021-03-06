class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_reader :raw_invitation_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:invitable
  enum role: [:user, :vip, :admin]
  
  # we set upa our User relation ship
  belongs_to :company
  # we tell User that we can take company attributes
  accepts_nested_attributes_for :company
  
  validates :email, presence: true, uniqueness: {scope: :company_id}

  #after_initialize :set_default_role, :if => :new_record?

  #  def set_default_role
  #   self.role ||= :admim
  # end
end