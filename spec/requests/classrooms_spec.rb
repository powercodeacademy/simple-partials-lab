require 'rails_helper'

describe "Classroom show page", type: :request do
  let!(:student) { Student.create!(name: "Grandpa", hometown: "Chicago", birthday: Date.new(1980,1,1)) }
  let!(:classroom) { Classroom.create!(course_name: "Math", semester: "Spring 2025") }
  let!(:classroom_student) { ClassroomStudent.create!(classroom: classroom, student: student) }

  it "shows the oldest student info partial on the classroom show page" do
    get classroom_path(classroom)
    expect(response.body).to include("Classroom Info")
    expect(response.body).to include("Math")
    expect(response.body).to include("Spring 2025")
    expect(response.body).to include("Grandpa")
    expect(response.body).to include("Chicago")
    expect(response.body).to include("01/01/1980")
  end
end
