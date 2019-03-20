require 'rails_helper'

RSpec.describe Site, type: :model do
  it 'joins first and last name' do
    @craig = create(:site, first_name: 'Craig', last_name: 'Wallace')
    expect(@craig.full_name).to eq("Craig Wallace") 
  end

  context 'validations' do
    it 'fails in absence of first name' do
      @craig = build(:site, last_name: 'Wallace')
      expect(@craig.persisted?).to be false
    end

    it 'fails in absence of last name' do
      @craig = build(:site, first_name: 'Craig')
      expect(@craig.persisted?).to be false
    end
  end
end
