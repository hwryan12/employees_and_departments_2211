require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:budget) { Budget.new("2023") }

  describe '#initialize' do
    it 'exists' do
      
      expect(budget).to be_a(Budget)
    end
  end
end