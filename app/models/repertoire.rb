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
  
  
end
