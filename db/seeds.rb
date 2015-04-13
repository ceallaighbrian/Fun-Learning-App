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
Level.create(id: 3, name: 'Getting there', required_score: 40)
Level.create(id: 4, name: 'Expert', required_score: 70)


quiz1 = Quiz.create(name: 'Quiz 1')

question1 = Question.create(name: "9 + 2 is less than I am.\n 8 + 5 is greater than I am.\nWho am I?", quiz_id: quiz1.id)
question2 = Question.create(name: "I am fourth in line and three more animals are after me in line.\nHow many animals are there?", quiz_id: quiz1.id)
question3 = Question.create(name: "Peter has seven apples.\nJohn has one apple less than Peter.\nHow many apples do the children have in total?", quiz_id: quiz1.id)
question4 = Question.create(name: "Anna bought 27 jellybeans.\nEight of them are red and the rest are green.\nHow many green jellybeans did she buy?", quiz_id: quiz1.id)
question5 = Question.create(name: "A girl is 50cm taller than her dog.\nHer dogs height is 80cm.\nHow tall is she?", quiz_id: quiz1.id)


Answer.create(name: '13', correct: false, question_id: question1.id)
Answer.create(name: '12', correct: true, question_id: question1.id)
Answer.create(name: '10', correct: false, question_id: question1.id)
Answer.create(name: '14', correct: false, question_id: question1.id)

Answer.create(name: '6', correct: false, question_id: question2.id)
Answer.create(name: '8', correct: false, question_id: question2.id)
Answer.create(name: '7', correct: true, question_id: question2.id)
Answer.create(name: '5', correct: false, question_id: question2.id)

Answer.create(name: '14 apples', correct: false, question_id: question3.id)
Answer.create(name: '13 apples', correct: true, question_id: question3.id)
Answer.create(name: '15 apples', correct: false, question_id: question3.id)
Answer.create(name: '12 apples', correct: false, question_id: question3.id)

Answer.create(name: '19', correct: true, question_id: question4.id)
Answer.create(name: '18', correct: false, question_id: question4.id)
Answer.create(name: '21', correct: false, question_id: question4.id)
Answer.create(name: '20', correct: false, question_id: question4.id)

Answer.create(name: '1 meter 30 cm', correct: true, question_id: question5.id)
Answer.create(name: '140 cm', correct: false, question_id: question5.id)
Answer.create(name: '150 cm', correct: false, question_id: question5.id)
Answer.create(name: '1 meter 60 cm', correct: false, question_id: question5.id)


quiz2 = Quiz.create(name: 'Quiz 2')

question5 = Question.create(name: "One pack of pencils has 4 pencils.\nTwo other packs have 11 pencils each.\nWhat is the total number of pencils in the three packs total?", quiz_id: quiz2.id)
question6 = Question.create(name: "At the next stop, 3 students get off while 5 get on.\nIf initially there were 4 students in the bus, how many students are there in the bus now?", quiz_id: quiz2.id)
question7 = Question.create(name: "Eugenia turned 9 in 2007. In what year was she born?", quiz_id: quiz2.id)
question8 = Question.create(name: "How many letters are there in the correct answer to this question?", quiz_id: quiz2.id)
question9 = Question.create(name: "How many 3-digit numbers can you make using 1 and 2 ?", quiz_id: quiz2.id)


Answer.create(name: '22', correct: false, question_id: question5.id)
Answer.create(name: '26', correct: true, question_id: question5.id)
Answer.create(name: '30', correct: false, question_id: question5.id)
Answer.create(name: '31', correct: false, question_id: question5.id)

Answer.create(name: '7', correct: false, question_id: question6.id)
Answer.create(name: '6', correct: true, question_id: question6.id)
Answer.create(name: '5', correct: false, question_id: question6.id)
Answer.create(name: '8', correct: false, question_id: question6.id)

Answer.create(name: '1999', correct: false, question_id: question7.id)
Answer.create(name: '1997', correct: false, question_id: question7.id)
Answer.create(name: '1996', correct: false, question_id: question7.id)
Answer.create(name: '1998', correct: true, question_id: question7.id)

Answer.create(name: 'three', correct: false, question_id: question8.id)
Answer.create(name: 'two', correct: false, question_id: question8.id)
Answer.create(name: 'four', correct: true, question_id: question8.id)
Answer.create(name: 'five', correct: false, question_id: question8.id)

Answer.create(name: '8', correct: true, question_id: question9.id)
Answer.create(name: '6', correct: false, question_id: question9.id)
Answer.create(name: '6', correct: false, question_id: question9.id)
Answer.create(name: '10', correct: false, question_id: question9.id)



quiz3 = Quiz.create(name: 'Quiz 3')

question10 = Question.create(name: "American president Franklin D. Roosevelt died in 1945 at the age of 63. In what year was he born?", quiz_id: quiz3.id)
question11 = Question.create(name: "Christmas week has a Wednesday in it. This statement is . . .", quiz_id: quiz3.id)
question12 = Question.create(name: "Rebecca has 81 coins to share between 9 children.\nHow many coins will each child get if they are divided equally?", quiz_id: quiz3.id)
question13 = Question.create(name: "On a trip, there are 11 children and 1 adult per boat.\nIf a total of 96 people went on this boat trip, how many were children?", quiz_id: quiz3.id)
question14 = Question.create(name: "There are two more girls than boys in a class.\nThere are twenty students in all.\nHow many boys are in the class?", quiz_id: quiz3.id)


Answer.create(name: '1882', correct: true, question_id: question10.id)
Answer.create(name: '1908', correct: false, question_id: question10.id)
Answer.create(name: '1892', correct: false, question_id: question10.id)
Answer.create(name: '1902', correct: false, question_id: question10.id)

Answer.create(name: 'unlikely', correct: false, question_id: question11.id)
Answer.create(name: 'impossible', correct: false, question_id: question11.id)
Answer.create(name: 'certain', correct: true, question_id: question11.id)
Answer.create(name: 'likely', correct: false, question_id: question11.id)

Answer.create(name: '8', correct: false, question_id: question12.id)
Answer.create(name: '9', correct: true, question_id: question12.id)
Answer.create(name: '19', correct: false, question_id: question12.id)
Answer.create(name: '7', correct: false, question_id: question12.id)

Answer.create(name: '85', correct: false, question_id: question13.id)
Answer.create(name: '90', correct: false, question_id: question13.id)
Answer.create(name: '88', correct: true, question_id: question13.id)
Answer.create(name: '86', correct: false, question_id: question13.id)

Answer.create(name: '9', correct: true, question_id: question14.id)
Answer.create(name: '11', correct: false, question_id: question14.id)
Answer.create(name: '8', correct: false, question_id: question14.id)
Answer.create(name: '7', correct: false, question_id: question14.id)


quiz4 = Quiz.create(name: 'Quiz 4')

question15 = Question.create(name: "John works from nine o'clock in the morning until half past six in the evening.\nHow many hours is that?", quiz_id: quiz4.id)
question16 = Question.create(name: "Dan has 75 eggs to pack into boxes. Each box can hold 6 eggs.\nHow many boxes will Dan need?", quiz_id: quiz4.id)
question17 = Question.create(name: "With the cash in her pocket, Mrs. Smith can either exactly afford\nice cream cones for all her family including the baby and animals\nOR one huge cigar for her husband John.\nThe cigar is worth €14. Find the price of an ice cream cone.", quiz_id: quiz4.id)
question18 = Question.create(name: "If I delete a letter in a word, then only one is left. Find the word.", quiz_id: quiz4.id)
question19 = Question.create(name: "The total weight of Bob and his sister Anna is 155 kilograms.\nBob's weight is 2 kilograms more than twice Anna's weight.\nWhat is Anna's weight?", quiz_id: quiz4.id)


Answer.create(name: '8 hours', correct: false, question_id: question15.id)
Answer.create(name: '8 hours 30 minutes', correct: false, question_id: question15.id)
Answer.create(name: '7 hours 30 minutes', correct: false, question_id: question15.id)
Answer.create(name: '9 hours and 30 minutes', correct: true, question_id: question15.id)

Answer.create(name: '12', correct: false, question_id: question16.id)
Answer.create(name: '11', correct: false, question_id: question16.id)
Answer.create(name: '13', correct: true, question_id: question16.id)
Answer.create(name: '14', correct: false, question_id: question16.id)

Answer.create(name: '€2', correct: false, question_id: question17.id)
Answer.create(name: '€1', correct: true, question_id: question17.id)
Answer.create(name: '€7', correct: false, question_id: question17.id)
Answer.create(name: '€3.5', correct: false, question_id: question17.id)

Answer.create(name: 'rock', correct: true, question_id: question18.id)
Answer.create(name: 'note', correct: false, question_id: question18.id)
Answer.create(name: 'tone', correct: false, question_id: question18.id)
Answer.create(name: 'hey', correct: false, question_id: question18.id)

Answer.create(name: '50 Kilograms', correct: false, question_id: question19.id)
Answer.create(name: '33 Kilograms', correct: false, question_id: question19.id)
Answer.create(name: '52 Kilograms', correct: false, question_id: question19.id)
Answer.create(name: '51 Kilograms', correct: true, question_id: question19.id)





