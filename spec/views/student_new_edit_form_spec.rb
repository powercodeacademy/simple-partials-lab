 require "rails_helper"

RSpec.describe "create and edit form" do
  describe 'create form' do
    it "renders create student form from the new.html file" do
      view.lookup_context.prefixes = %w[students]
      student = Student.new
      assign(:student, student)
      render :template => "students/new"
      expect(rendered).to match /Create Student/
    end

    it "directly renders the form in a students/form partial" do
      view.lookup_context.prefixes = %w[students]
      student = Student.new
      assign(:student, student)
      render :template => "students/new"
      expect(rendered).to render_template(:partial => "students/_form")
    end

    it "displays the create form from the partial" do
      student = Student.new
      assign(:student, student)
      render :partial => "students/form"
      expect(rendered).to match /Create Student/
    end
  end

  describe 'edit form' do
    it "renders edit student form from the edit.html file" do
      view.lookup_context.prefixes = %w[students]
    student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
      assign(:student, student)
      render :template => "students/edit"
      expect(rendered).to match /Update Student/
      expect(rendered).to match /Bobby/
    end

    it "directly renders the form in a students/form partial" do
      view.lookup_context.prefixes = %w[students]
      student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
      assign(:student, student)
      render :template => "students/edit"
      expect(rendered).to render_template(:partial => "students/_form")
    end

    it "displays the edit form from the partial" do
      student = Student.create(name: 'Bobby', hometown: Faker::Address.city, birthday: Faker::Date.between(from: 25.years.ago, to: 18.years.ago))
      assign(:student, student)
      render :partial => "students/form"
      expect(rendered).to match /Update Student/
    end
  end
end
