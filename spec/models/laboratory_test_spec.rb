require 'rails_helper'

describe LaboratoryTest do
  it 'it can open the test csv file' do
    File.open('/Users/webstec/send-away/spec/models/GMF110.csv', 'r')
  end

  it 'it can import tests' do
    file = File.open('/Users/webstec/send-away/spec/models/GMF110.csv', 'r')
    LaboratoryTest.import_laboratory_tests(file)
  end

  it 'expect Y to return true' do
    expect(LaboratoryTest.true_or_false('Y')).to be true
  end

  it 'expect Yes to return true' do
    expect(LaboratoryTest.true_or_false('Yes')).to be true
  end

  it 'expect GM.F161 completed July 2015to return true' do
    expect(LaboratoryTest.true_or_false('GM.F161 completed July 2015')).to be true
  end

  it 'expect N to return false' do
    expect(LaboratoryTest.true_or_false('N')).to be false
  end
end
