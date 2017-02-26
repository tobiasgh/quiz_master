def create_teacher
  teacher = User.new(
    email: "teacher@quizmaster.com",
    password: "quizmaster",
    role: I18n.t('user.roles.teacher')
  )

  teacher.save!
end

def create_student
  student = User.new(
    email: "student@quizmaster.com",
    password: "quizmaster",
    role: I18n.t('user.roles.student')
  )

  student.save!
end

def create_question_types
  QuestionType.create(
    question_type: I18n.t('question_type.types.select_one'),
    min_options: 2,
    min_answers: 1,
    max_answers: 1
  )

  QuestionType.create(
    question_type: I18n.t('question_type.types.multiple_choice'),
    min_options: 2,
    min_answers: 1
  )

  QuestionType.create(
    question_type: I18n.t('question_type.types.text'),
    min_options: 0,
    max_options: 0,
    min_answers: 0,
    max_answers: 0
  )
end

if Rails.env.development?
  create_teacher
  create_student
  create_question_types
end