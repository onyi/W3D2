require 'sqlite3'
require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'question_like'
require_relative 'question_follow'

class QuestionFollow

  attr_reader :id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM QUESTION_FOLLOWS")
    data.map { |datum| QuestionFollow.new(datum) }
  end

  def self.find_by_id(id)
    question_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM QUESTION_FOLLOWS
      WHERE ID = ?
    SQL
    QuestionFollow.new(question_follow.first)
  end

  def self.followers_for_question_id(question_id)
    question_users = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT user_id FROM QUESTION_FOLLOWS
      WHERE question_id = ?
    SQL
    question_users.map { |res| User.find_by_id(res['user_id']) }
  end

  def self.followed_questions_for_user_id(user_id)
    user_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT question_id FROM QUESTION_FOLLOWS
      WHERE user_id = ?
    SQL
    user_questions.map { |res| Question.find_by_id(res['question_id']) }
  end

  def self.most_followed_questions(n)
    mf_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        questions.id, COUNT(question_follows.user_id) as user_count
      FROM 
        question_follows
      JOIN
        questions on question_follows.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        user_count DESC
      LIMIT
        ?
    SQL
    mf_questions.map { |res| Question.find_by_id(res['id']) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  

end