module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin) # Using factory bot as an example
    end
  end

  def login_customer
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:customer]
      customer = FactoryBot.create(:customer)
      customer.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
      sign_in customer
    end
  end
end