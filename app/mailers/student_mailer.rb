class StudentMailer < ApplicationMailer
  default from: 'shreyamundra90@gmail.com'

  def welcome_email student
    @mail = Student.where(course:'MCA').pluck(:email)
    @student = student
    mail(to: @mail, subject: 'Welcome to Student Portal')
  end
end
