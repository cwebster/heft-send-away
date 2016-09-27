class Repertoire < ActiveRecord::Base
  belongs_to :laboratory_test
  belongs_to :laboratory

  def self.in_repertoire?(laboratory_id: ,laboratory_test_id: )
    if Repertoire.where(laboratory_id: laboratory_id, laboratory_test_id: laboratory_test_id).empty?
      return false
    else
      return true
    end
  end

  def self.delete_from_repertoire(lab_id:, tests_to_delete:)
    Repertoire.destroy_all(laboratory_id: lab_id, laboratory_test_id: tests_to_delete)
  end

  def self.add_to_repertoire_func(checkboxes:, current_repertoire_arr:)
    checkboxes.each_key do |repertoire_test|
      lab_id = repertoire_test.split('_')[0].strip.to_i
      test_id = repertoire_test.split('_')[1].strip.to_i

      # Unless already in repertoire add a new test
      unless Repertoire.in_repertoire?(laboratory_id: lab_id ,laboratory_test_id: test_id )
        rep = Repertoire.new
        rep.laboratory_id = lab_id
        rep.laboratory_test_id = test_id
        rep.save
      end
      # delete test from current repertoire array
      current_repertoire_arr.delete(test_id)
    end

    return current_repertoire_arr
  end

  def self.information_out_of_date_since(months: 6, laboratory_id: )
    Repertoire
    .where(['date_information_updated < ? OR date_information_updated IS NULL AND laboratory_id = ?', months.months.ago, laboratory_id])
    .order(:date_information_updated)
  end

  def self.information_out_of_date_since_and_update_letter_sent_now(months: 6, laboratory_id: )
    Repertoire
    .where(['date_information_updated < ? OR date_information_updated IS NULL AND laboratory_id = ?', months.months.ago, laboratory_id])
    .update_all(:date_request_for_information_sent => Date.today)
  end

  def self.waiting_for_updated_information(laboratory_id: )
    Repertoire
    .where(['date_information_updated < date_request_for_information_sent OR date_information_updated IS NULL AND laboratory_id = ?', laboratory_id])
    .order(:date_information_updated)
  end

  def self.information_updated_but_not_complete_for_laboratory(laboratory_id: )
    Repertoire
    .where(['date_information_updated > date_request_for_information_sent AND laboratory_id = ? AND record_complete = false', laboratory_id])
  end

  def self.send_away_records_complete(laboratory_id: )
    Repertoire.where(laboratory_id: laboratory_id, record_complete: true)
  end

  def self.tests_for_laboratory(laboratory_id:)
    Repertoire.where(laboratory_id: laboratory_id)
  end

  def self.build_laboratories_array(laboratories: )
    laboratories_array = []
    laboratories.each do |laboratory|
      laboratory_tests_ids = Repertoire.information_out_of_date_since(months: 12, laboratory_id: laboratory).pluck("laboratory_test_id")
      laboratories_array << LaboratoryTest.where(id: laboratory_tests_ids).joins(:laboratory).references(:laboratories).group(:laboratory_id).count
    end
    return laboratories_array    
  end

  def self.build_out_of_data_array(laboratories: )
    out_of_data_array =[]
    laboratories.each do |laboratory|
      out_of_data_array << Repertoire.information_out_of_date_since(months: 12, laboratory_id: laboratory)
    end
    return out_of_data_array
  end

  def self.build_waiting_for_updated_information_array(laboratories: )
    waiting_for_update_array =[]
    laboratories.each do |laboratory|
      waiting_for_update_array << Repertoire.waiting_for_updated_information(laboratory_id: laboratory)
    end
    return waiting_for_update_array
  end

  def self.build_updated_but_not_complete_array(laboratories: )
    updated_but_not_complete_array =[]
    laboratories.each do |laboratory|
      updated_but_not_complete_array << Repertoire.information_updated_but_not_complete_for_laboratory(laboratory_id: laboratory)
    end
    return updated_but_not_complete_array
  end

  def self.get_laboratories_for_repertoire(repertoires: )
    laboratories_array =[]
    repertoires.each do |repertoire|
      laboratory_tests = LaboratoryTest.where("id IN (?)", repertoire.select(:laboratory_test_id))
      laboratories_array << Laboratory.where("id IN (?)", laboratory_tests.select(:laboratory_id))
    end
    return laboratories_array
  end



end
