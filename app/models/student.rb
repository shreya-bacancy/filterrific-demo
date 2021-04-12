class Student < ApplicationRecord

  COURSES = ['MCA','BED','BCA']

  def self.options_for_sorted_by
    [
      ["Name (a-z)", "name_asc"],
      ["Name (z-a)", "name_desc"],
      ["Course","course_asc"]
    ]
  end

  filterrific(
    available_filters: [
      :search_by_name,
      :sorted_by,
      :filter_by_course
    ]
  )

  scope :search_by_name, ->(name){
    where(name: name)
  }

  scope :filter_by_course, ->(course){
    where(course: course)
  }

  scope :sorted_by, ->(sort_option){
    direction = /desc$/.match?(sort_option) ? "desc" : "asc"
    case sort_option.to_s
    when /^course/
      order("UPPER(students.course) #{direction}")
    when /^name_/
      order("LOWER(students.name) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

end
