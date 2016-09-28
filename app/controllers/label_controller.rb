class LabelController < ApplicationController
  include Labels
  skip_before_action :verify_authenticity_token

  def generate_labels    
    mailing_labels(laboratories)
    send_data @labels, :filename => "test.pdf", :type => "application/pdf"
  end

end
