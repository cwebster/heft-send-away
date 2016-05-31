module Labels
  extend ActiveSupport::Concern

  def mailing_labels(addresses)
    set_label_type
    set_un_image

    @labels = Prawn::Labels.render( addresses, type: "967") do |pdf, laboratory|
      pdf.stroke_bounds
      address(pdf, laboratory)
    end
  end

  def get_meter_details_for_user(user_id, pdf)
    meters = Meter.meters_for_user(user_id)
    meter_type(meters, pdf)
  end

  def address(pdf, name)
    pdf.font "Helvetica"
    pdf.font_size 10

    pdf.bounding_box([8, pdf.cursor - 20], :width => 200, :height => 150) do
      pdf.text 'Quality Lead'
      pdf.text name.laboratory_name
      pdf.text name.address1
      pdf.text name.address2
      pdf.text name.address3
      pdf.text name.city
      pdf.text name.postcode
    end
  end

  def from_address(pdf)
    pdf.font "Helvetica"
    pdf.font_size 12

    pdf.bounding_box([350, pdf.cursor - 20], :width => 200, :height => 150) do
      pdf.text "BQAS"
    end

  end

  def meter_type(meters, pdf)
    pdf.fill_color "#1aad31"
    spacer = 5
    meters.each_with_index do |(key, value), index|
      pdf.draw_text "#{Manufacturer.find(key).manufacturer_name} count: #{value}" , at:
      [pdf.bounds.left , pdf.bounds.bottom + (spacer * (index*5))+ 5]
    end

    pdf.fill_color "000000"
  end

  def number_of_meters(pdf, name)
    pdf.font "Courier"
    pdf.font_size 10
    pdf.fill_color "ff0000"
    str = "Number of Meters: #{name[:num_meters]}"
    pdf.draw_text str , at:
    [pdf.bounds.right - 120, pdf.bounds.bottom + 5]
    pdf.fill_color "000000"
    pdf.font "Helvetica"
  end

  def postal_regs_image(pdf)
    pdf.image @image,
    at: [pdf.bounds.right - @image_size, pdf.bounds.top - 10 ], :height => 100
  end

  def set_label_type
    Prawn::Labels.types = {
      "967" => {
        "paper_size"    => "A4",
        "columns"       => 3,
        "rows"          => 7,
        "top_margin"    => 25,
        "bottom_margin" => 25,
        "left_margin"   => 10,
        "right_margin"  => 6,
        "column_gutter" => 2,
        "row_gutter"    => 0
        }}
      end

      def set_un_image
        @image = open("https://s3.amazonaws.com/bqas-us-std/assets/un3373.jpg")
        @image_size = 100
      end
    end
