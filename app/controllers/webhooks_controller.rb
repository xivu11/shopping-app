class WebhooksController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :verify_authenticity_token

    def create
        #redirected_to :page_pth, notice: 'ssus placed'
        payload = request.body.read
        sig_header = request.env['HTTP_STRIPE_SIGNATURE']
        event = nil

        begin
        event = Stripe::Webhook.construct_event(
            payload, sig_header, Rails.application.credentials[:stripe][:webhook]
        )
        rescue JSON::ParserError => e
        status 400
        return
        rescue Stripe::SignatureVerificationError => e
        # Invalid signature
        puts "Signature error"
        p e
        return
        end

        # Handle the event
        case event.type
            when 'checkout.session.completed'
                session = event.data.object
                session_with_expand = Stripe::Checkout::Session.retrieve({ id: session.id, expand: ["line_items"]})
                redirect_to orders_url, notice: "Order Placed Successfully!" 
        end

        render json: { message: 'success' }
    end
end
