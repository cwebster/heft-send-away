class Repertoire < ActiveRecord::Base
  belongs_to :laboratory_test
  belongs_to :laboratory
  belongs_to :local_department

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

  def self.information_out_of_date_since(months: 12, laboratory_ids: )
    Repertoire
    .where(['date_information_updated < ? OR date_information_updated IS NULL', months.months.ago])
    .where(laboratory_id: laboratory_ids)
    .order(:date_information_updated)
  end

  def self.information_out_of_date_since_and_update_letter_sent_now(months: 12, laboratory_id: )
    Repertoire
    .where(['date_information_updated < ? OR date_information_updated IS NULL AND laboratory_id = ?', months.months.ago, laboratory_id])
    .update_all(:date_request_for_information_sent => Date.today)
  end

  def self.waiting_for_updated_information(laboratory_ids: )
    Repertoire
    .where(['date_information_updated < date_request_for_information_sent OR date_information_updated IS NULL AND laboratory_id = ? AND record_complete = false', laboratory_ids])
    .order(:date_information_updated)
  end

  def self.information_updated_but_not_complete_for_laboratory(laboratory_ids: )
    Repertoire
    .where(['date_information_updated > date_request_for_information_sent AND laboratory_id = ? AND record_complete = false', laboratory_ids])
  end

  def self.send_away_records_complete(laboratory_id: )
    Repertoire.where(laboratory_id: laboratory_id, record_complete: true)
  end

  def self.tests_for_laboratory(laboratory_id:)
    Repertoire.where(laboratory_id: laboratory_id)
  end


  def self.get_laboratories_for_repertoire(repertoires: ) 

    laboratories_array =[]

      laboratory_tests = LaboratoryTest.where("id IN (?)", repertoires.pluck(:laboratory_test_id))
      laboratories_array << Laboratory.where("id IN (?)", laboratory_tests.pluck(:laboratory_id))
  
    return laboratories_array
  end


  ### Refactor to display by laboratory

  def self.repertoires_search(laboratory_ids:, type: )
    case type
    when :out_of_date
      self.information_out_of_date_since(months: 6, laboratory_ids: laboratory_ids)
    when :updated_but_not_complete
      self.information_updated_but_not_complete_for_laboratory(laboratory_ids: laboratory_ids)
    when :waiting_for_update
      self.waiting_for_updated_information(laboratory_ids: laboratory_ids)
    end
  end



end
