class ChargesController < ApplicationController

  def create

    #creates a stripe customer object, for associating with the charge
	customer = Stripe::Customer.create(
	  email: current_user.email,
	  card: params[:stripeToken]
	)

	  #Where the real magic happens
	charge = Stripe::Charge.create(
	  customer: customer.id, #Note -- this is NOT the user_id in your app
	  amount: Amount.default,
	  description: "Sponsorship - #{current_user.email}",
	  currency: 'usd'
	)
	current_user.update_attribute(:role, 'sponsor')
	flash[:success] = "Thank you for your payment, #{current_user.email}! Please fill out this sponsor form!"
	redirect_to new_sponsor_path

	  #Stripes friendly error blocks

	rescue Stripe::CardError => e 
	  flash[:error] = e.message
	  redirect_to new_charge_path
  end

  def new
  	if current_user
      @stripe_btn_data = {
        key: "#{ Rails.configuration.stripe[:publishable_key] }",
        description: "Sponsorship - #{current_user.email}",
        amount: Amount.default
      }
    else
      flash[:alert] = "Please create a free account before purchasing a sponsor account."
      redirect_to new_user_registration_path
    end      
  end

private

  class Amount
  	@default_amount = 5000
  	  def self.default
  		@default_amount
  	  end
  end


end