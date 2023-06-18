class CheckoutController < ApplicationController
  def create
    job = Job.find_by_id(params[:id])
    @session = Stripe::Checkout::Session.create({
                                                  customer: current_user&.customer&.stripe_customer_id,
                                                  payment_method_types: ["card"],
                                                  line_items: [{
                                                    name: job.title,
                                                    amount: caculate_price(job),
                                                    currency: "usd",
                                                    quantity: 1
                                                  }],
                                                  allow_promotion_codes: true,
                                                  mode: "payment",
                                                  # discounts: [{
                                                  #   coupon: '{{COUPON_ID}}',
                                                  # }],
                                                  # success_url: "#{success_url}?session_id={CHECKOUT_SESSION_ID}",
                                                  success_url: root_url,
                                                  cancel_url: cancel_url
                                                })

    redirect_to @session.url, allow_other_host: true
  end

  def success
    if params[:session_id].present?
      session[:cart] = []
    #   @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ['line_items'] })
    #   @session_with_expand.line_items.data.each do |line_item|
    #     item = Item.find_by(stripe_product_id: line_item.price.product)
    #     item.increment!(:sales_count)
    #   end
    else
      redirect_to cancel_path, alert: "Transaction was cancelled"
    end
  end

  protected

  def caculate_price(job)
    case job.company.package.package_type
    when "basic"
      100
    when "premium"
      200
    when "ultimate"
      300
    end
  end

  def cancel
  end
end
