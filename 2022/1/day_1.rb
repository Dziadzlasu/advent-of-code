class SnacksInput
  attr_accessor :calorie_list

  def initialize
    @calorie_list = File.foreach('day_1_input.txt').map { |line| line.chomp }
  end
end

class Elf
  attr_accessor :snacks, :calorie_sum

  def initialize(snacks:)
    @snacks = snacks
    @calorie_sum = snacks.sum
  end
end

class CalorieSumalizer
  attr_accessor :calorie_list, :elf_list

  def initialize
    @elf_list = []
    @calorie_list = SnacksInput.new.calorie_list
  end

  def biggest_sum
    elf_inventory
    @elf_list.max_by(&:calorie_sum).calorie_sum
  end

  private

  def elf_inventory
    group = []
    @calorie_list.each do |calorie|
      if calorie.empty?
        @elf_list << Elf.new(snacks: group)
        group = []
      else
        calorie = calorie.to_i
        group << calorie
      end
    end
  end

end

puts CalorieSumalizer.new.biggest_sum
