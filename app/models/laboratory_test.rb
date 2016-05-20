class LaboratoryTest < ActiveRecord::Base
  include Import
  include AlgoliaSearch
  belongs_to :laboratory

  algoliasearch do
    attribute :analyte_name
  end

  def self.import_laboratory_tests(file)
    CSV.foreach(file.path, headers: true) do |row|
      laboratory = Laboratory.where(lab_number: row['Lab Number']).first
      unless laboratory.nil?
        test_information = LaboratoryTest.new
        attributes = row.to_hash
        ## Set the test information
        set_test_information(laboratory, test_information, attributes)
        ## Set the laboratory specific stuff
        set_laboratory_information(laboratory, attributes)
        test_information.save
      end
    end
  end

  def self.set_test_information(laboratory, test_information, attributes)
    test_information.analyte_name = attributes['ANALYTE']
    test_information.eqa_status = attributes['Participation in EQA or other Inter-laboratory comparison scheme  ']
    test_information.turnaround_time = attributes['Turnaround Time']
    test_information.ukas_status = attributes['UKAS Accredited']
    test_information.methodology = attributes['Methodology/ Technology Used']
    test_information.reference_range = attributes['Reference Range']
    test_information.sample_type = attributes['Sample Type required']
    test_information.cost_of_test = attributes['Cost of Test (£)']
    test_information.uncertainty_of_measurement = attributes['Uncertainty of measurement']
    test_information.lab_number = attributes['Lab Number']
    test_information.eqa_provider = attributes['State EQA provider']
    test_information.eqa_performance = attributes['Acceptable EQA performance']
    test_information.sample_volume = attributes['Sample volume required']
    test_information.special_collection_requirements = attributes['Sample collection/ special requirements']
    test_information.ukas_reference_number = attributes['UKAS  Reference Number']
    test_information.laboratory_id = laboratory.id
  end

  def self.set_laboratory_information(laboratory, attributes)
    laboratory.cpa_status = attributes['CPA Accredited']
    laboratory.cpa_reference_number = attributes['CPA reference number']
    laboratory.contact_name = attributes['Contact']
    laboratory.selection_form_completed = true_or_false(attributes['Selection form completed'])
    laboratory.date_selection_form_completed = attributes['DATE COMPLETED / UPDATED']
    laboratory.website_updated = true_or_false(attributes['Website updated'])
  end

  def self.true_or_false(attribute)
    if attribute == 'Yes'
      return true
    elsif attribute == 'Yes'
      return true
    elsif attribute == 'Y'
      return true
    elsif attribute == 'GM.F161 completed July 2015'
      return true
    else
      return false
    end
  end
end
