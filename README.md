# Project description:

During this project, you will build a question and answer platform with Ruby on Rails. After three days, your platform will allow people to ask questions, receive answers, and mark an answer as valid.

### On the first day, your application should:

* Allow a user to create a question. That question should allow for several paragraphs of text as well as code samples. We recommend
* allowing users to use Markdown for authoring questions. Redcarpet is a good gem for rendering Markdown as HTML. This blog post may help as well.
* Be styled with Bootstrap or another CSS framework.
* Paginate the index of questions with Kaminari

### On the second day, your application should:

* Have registration and login. Every question and answer will be associated with a user.
* Allow questions to have answers.
* Allow the original author of the question to mark an answer as correct.

### On the third day, your application should have a JSON API that:

* Allows an unauthenticated user to view questions and answers.
* Allows an authenticated user to create a question or answer an existing question.
* Allows the author of a question to mark an answer as valid.
* Allows the author of a question to delete that question, removing all answers.
* Allows the author of an answer to delete that answer.
