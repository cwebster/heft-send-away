require 'rails_helper'
require 'database_cleaner'

describe Laboratory do
  it 'it can open the test sql file' do
    File.read('/Users/webstec/send-away/spec/models/laboratories.sql')
  end

  it 'it can import laboratories from sql file' do
    Laboratory.import_laboratories('/Users/webstec/send-away/spec/models/laboratories.sql')
  end
end
