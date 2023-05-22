class WebhooksController < ApplicationController
  post '/webhook' do
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, Rails.application.credentials[:stripe][:signing_secret]
      )
    rescue JSON::ParserError => e
      status 400
      return
    rescue Stripe::SignatureVerificationError => e
      status 400
      return
    end

    case event.type
    when 'payment_intent.succeeded'
      intent = event['data']['object']
      puts "Succeeded:", intent['id']
      # Fulfill the customer's purchase
    when 'payment_intent.payment_failed'
      intent = event['data']['object']
      error_message = intent['last_payment_error'] && intent['last_payment_error']['message']
      puts "Failed:", intent['id'], error_message
      # Notify the customer that payment failed
    end

    status 200
  end
end
