require 'rails_helper'

RSpec.describe 'Partial usage enforcement' do
  describe 'students/_student.html.erb partial' do
    let(:partial_path) { Rails.root.join('app/views/students/_student.html.erb') }
    let(:classroom_show_path) { Rails.root.join('app/views/classrooms/show.html.erb') }

    it 'exists and is not empty' do
      expect(File).to exist(partial_path)
      expect(File.read(partial_path).strip).not_to be_empty
    end

    it 'is rendered in classrooms/show.html.erb' do
      content = File.read(classroom_show_path)
      expect(content).to match(/render( |_partial:).*["']students\/student["']/)
    end
  end

  describe 'students/_form.html.erb partial' do
    let(:partial_path) { Rails.root.join('app/views/students/_form.html.erb') }
    let(:edit_path) { Rails.root.join('app/views/students/edit.html.erb') }
    let(:new_path) { Rails.root.join('app/views/students/new.html.erb') }

    it 'exists and is not empty' do
      expect(File).to exist(partial_path)
      expect(File.read(partial_path).strip).not_to be_empty
    end

    it 'is rendered in students/edit.html.erb' do
      content = File.read(edit_path)
      expect(content).to match(/render( |_partial:).*["'](students\/)?form["']/)
    end

    it 'is rendered in students/new.html.erb' do
      content = File.read(new_path)
      expect(content).to match(/render( |_partial:).*["'](students\/)?form["']/)
    end
  end
end
