class Garden
  STUDENTS = %w(alice bob charlie david eve fred
                ginny harriet ileana joseph kincaid larry)
  SEED_NAMES = {
    'V' => :violets,
    'C' => :clover,
    'G' => :grass,
    'R' => :radishes
  }

  def initialize(diagram, students = STUDENTS)
    @students = students.sort.map(&:downcase)
    @row1, @row2 = diagram.split("\n")
    define_methods_for_students
  end

  private

  def define_methods_for_students
    @students.each do |student|
      define_singleton_method student.to_sym do
        get_plants(student)
      end
    end
  end

  def get_plants(student)
    position = @students.index(student) * 2
    seeds = "#{@row1.slice(position, 2)}#{@row2.slice(position, 2)}".chars
    seeds.map { |seed| SEED_NAMES[seed] }
  end
end
