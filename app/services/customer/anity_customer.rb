class Customer::AnityCustomer
  def self.call(user)
    return false if user.customer.present?

    customer = Stripe::Customer.create(email: user.email.to_s)
    user.build_customer(
      email: user.email,
      stripe_customer_id: customer.id
    )
    user.save!
  end
end
