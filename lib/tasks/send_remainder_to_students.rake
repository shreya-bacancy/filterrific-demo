task :send_remainder_to_students => :environment do
  Student.where(course:'MCA').each do |student|
    StudentMailer.welcome_email(student).deliver!
  end
end

