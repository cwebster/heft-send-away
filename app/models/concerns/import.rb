module Import
  extend ActiveSupport::Concern
  module ClassMethods
    def import_csv(file)
      CSV.foreach(file.path, headers: true) do |row|
        document = find_by_id(row['id']) || new
        document.attributes = row.to_hash
        document.save!
      end
    end
  end
end
