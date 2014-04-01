class PaymentTransaction < ActiveRecord::Base

  serialize :response

  belongs_to :Payment
end
