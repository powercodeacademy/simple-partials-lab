require 'rails_helper'

describe "Student management", type: :request do
  let!(:student) { Student.create!(name: "Bobby", hometown: "Boston", birthday: Date.new(2000,1,1)) }

  it "shows the student info partial on the show page" do
    get student_path(student)
    expect(response.body).to include("Student Info")
    expect(response.body).to include("Bobby")
    expect(response.body).to include("Boston")
    expect(response.body).to include("01/01/2000")
  end

  it "renders the form partial on the new page" do
    get new_student_path
    expect(response.body).to include("Create Student")
    expect(response.body).to include("form")
  end

  it "renders the form partial on the edit page" do
    get edit_student_path(student)
    expect(response.body).to include("Update Student")
    expect(response.body).to include("form")
  end
end
