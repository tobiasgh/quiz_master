def create_teacher
  teacher = User.new(
    email: "teacher@quizmaster.com",
    password: "quizmaster",
    role: I18n.t('user.roles.teacher')
  )

  teacher.save!
end

if Rails.env.development?
  create_teacher
end