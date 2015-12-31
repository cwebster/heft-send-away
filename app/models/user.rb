class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
  :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role
  has_many :laboratories

  before_create :set_default_role

  # Is user an admin user?
  def admin?
    self.role == Role.find_by_name('admin')
  end

  private
  def set_default_role
    self.role ||= Role.find_by_name('registered')
  end


end
