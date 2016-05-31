class LabelController < ApplicationController
  include Labels
  skip_before_action :verify_authenticity_token

  def generate_labels
    @laboratories = Laboratory.out_of_date(params[:months].to_i)
    
    mailing_labels(@laboratories)
    send_data @labels, :filename => "test.pdf", :type => "application/pdf"
  end

end
