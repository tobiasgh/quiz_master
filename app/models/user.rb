class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = [
    I18n.t('user.roles.teacher'),
    I18n.t('user.roles.student')
  ].freeze
end
