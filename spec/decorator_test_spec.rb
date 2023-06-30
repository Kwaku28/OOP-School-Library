require_relative '../person'
require_relative '../capitalize'
require_relative '../trimmer'

describe CapitalizeDecorator do
  it 'should capitalize the first letter' do
    person = Person.new(22, 'lawrence')
    capitalize_person = CapitalizeDecorator.new(person).correct_name
    expect(capitalize_person).to eq 'Lawrence'
  end
end

describe TrimmerDecorator do
  it 'should trim the name if longer than 10' do
    person = Person.new(22, 'Maximilianus')
    trim_person = TrimmerDecorator.new(person).correct_name
    expect(trim_person).to eq 'Maximilian'
  end
end

describe Decorator do
  context 'Create an instance of capitalize and trimmer' do
    it 'should capitalize and trim name' do
      person = Person.new(22, 'maximilianus')
      capitalize_person = CapitalizeDecorator.new(person)
      trim_person = TrimmerDecorator.new(capitalize_person).correct_name
      expect(trim_person).to eq 'Maximilian'
    end
  end
end
