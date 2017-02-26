module ControllerMacros
  def login_as(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user ||= FactoryGirl.create :user
    sign_in user, scope: :user
  end
end
