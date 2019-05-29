require 'sqlite3'
require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'question_like'
require_relative 'question_follow'

class User

  attr_reader :fname, :lname, :id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM USERS
      WHERE ID = ?
    SQL
    User.new(user.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT * FROM USERS
      WHERE FNAME = ? AND LNAME = ?
    SQL
    data.map { |datum| User.new(datum) }
  end

  def initialize(options)
    @fname = options['fname']
    @lname = options['lname']
    @id = options['id']
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def average_karma
      # user 4

    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(question_likes.user_id) AS FLOAT)/COUNT(questions.id)
      FROM
        questions
      JOIN
        users ON questions.user_id = users.id
      LEFT OUTER JOIN
        question_likes ON questions.id = question_likes.question_id
      WHERE 
        questions.user_id = ?


    SQL
  end
end