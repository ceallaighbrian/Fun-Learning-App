# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 1 | New Around Here    |              0 | 2015-03-11 12:18:16.651434 | 2015-03-11 12:18:16.651434
# 2 | Learning the ropes |             20 | 2015-03-11 12:18:49.821101 | 2015-03-11 12:18:49.821101
# 3 | Getting there      |             50 | 2015-03-11 12:19:55.947282 | 2015-03-11 12:19:55.947282
# 4 | Expert             |            100 |

Level.create(id: 1, name: 'New Around Here', required_score: 0)
Level.create(id: 2, name: 'Learning the ropes', required_score: 20)
Level.create(id: 3, name: 'Getting there', required_score: 50)
Level.create(id: 4, name: 'Expert', required_score: 100)


quiz1 = Quiz.create(name: 'Maths')

question1 = Question.create(name: 'What is 5 + 10?', quiz_id: quiz1.id)
question2 = Question.create(name: 'What is 50 + 50?', quiz_id: quiz1.id)
question3 = Question.create(name: 'What is 6 X 7?', quiz_id: quiz1.id)
question4 = Question.create(name: 'What is 3 X 9?', quiz_id: quiz1.id)
question5 = Question.create(name: 'What is 5 X 5?', quiz_id: quiz1.id)


Answer.create(name: '15', correct: true, question_id: question1.id)
Answer.create(name: '11', correct: false, question_id: question1.id)
Answer.create(name: '19', correct: false, question_id: question1.id)
Answer.create(name: '20', correct: false, question_id: question1.id)

Answer.create(name: '90', correct: false, question_id: question2.id)
Answer.create(name: '150', correct: false, question_id: question2.id)
Answer.create(name: '100', correct: true, question_id: question2.id)
Answer.create(name: '0', correct: false, question_id: question2.id)

Answer.create(name: '40', correct: false, question_id: question3.id)
Answer.create(name: '42', correct: true, question_id: question3.id)
Answer.create(name: '46', correct: false, question_id: question3.id)
Answer.create(name: '36', correct: false, question_id: question3.id)

Answer.create(name: '27', correct: true, question_id: question4.id)
Answer.create(name: '25', correct: false, question_id: question4.id)
Answer.create(name: '19', correct: false, question_id: question4.id)
Answer.create(name: '31', correct: false, question_id: question4.id)

Answer.create(name: '30', correct: false, question_id: question5.id)
Answer.create(name: '20', correct: false, question_id: question5.id)
Answer.create(name: '15', correct: false, question_id: question5.id)
Answer.create(name: '25', correct: true, question_id: question5.id)






