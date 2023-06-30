require_relative '../teacher'

describe Teacher do
  context 'Testing Teacher' do
    it 'Should create a teacher' do
      teacher = Teacher.new(56, 'Computer ingeneering', 'James', parent_permission: true)
      expect(teacher).to be_a Teacher
    end

    it 'Should use services' do
      teacher = Teacher.new(56, 'Computer ingeneering', 'James', parent_permission: true)
      expect(teacher.can_use_services?).to be true
    end

  end
end
