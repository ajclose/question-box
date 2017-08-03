json.id @question.id
json.user_id @question.user_id
json.title @question.title
json.body @question.body
json.answers @question.answers do |answer|
  json.id answer.id
  json.user_id answer.user_id
  json.body answer.body
  json.correct answer.correct
end
