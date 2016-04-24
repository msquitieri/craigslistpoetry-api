require 'rails_helper'

RSpec.describe Poem, :type => :model do
  describe 'structure and validations' do
    it 'has its structure' do
      is_expected.to have_db_column(:id)
      is_expected.to have_db_column(:updated_at)
      is_expected.to have_db_column(:created_at)
    end

    it 'has its relationships' do
      is_expected.to have_many(:poem_lines)
      is_expected.to have_many(:lines)
    end
  end

  describe '#generate_poem!' do
    it 'creates a new poem' do
      expect { Poem.generate_poem! }.to change { Poem.count }.from(0).to(1)
    end

    it 'takes 10 random lines with count 0' do
      create_list(:line, 10, count: 0)
      create_list(:line, 30, count: 10)

      poem = Poem.generate_poem!

      expect(poem.lines.count).to eq(10)
      expect(poem.lines.all? { |line| line.count.zero? }).to eq(true)
    end

    it 'takes lines without count = 0 if none are left' do
      Line.destroy_all

      create_list(:line, 7, count: 0)
      create_list(:line, 30, count: 5)

      poem = Poem.generate_poem!

      lines_with_zero_count = poem.lines.where(count: 0)
      lines_without_zero_count = poem.lines.where.not(count: 0)

      expect(lines_with_zero_count.count).to eq(7)
      expect(lines_without_zero_count.count).to eq(3)
    end

    it 'takes the lines in random order' do
      create_list(:line, 30)

      poem = Poem.generate_poem!

      line_ids = poem.lines.pluck(:id).sort

      sequential_order = []
      line_ids.each_with_index do |id, index|
        unless index == line_ids.count - 1
          in_sequential_order = (line_ids[index+1] - id != 1)

          sequential_order.push(in_sequential_order)
        end
      end

      expect(sequential_order.all? { |order| order == true}).to eq(false)
    end
  end

end
