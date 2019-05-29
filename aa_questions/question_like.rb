require 'sqlite3'
require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'question_like'
require_relative 'question_follow'

class QuestionLike

  attr_reader :id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM QUESTION_LIKE")
    data.map { |datum| QuestionLike.new(datum) }
  end

  def self.find_by_id(id)
    question_like = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM question_likes
      WHERE ID = ?
    SQL
    QuestionLike.new(question_like.first)
  end

  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT user_id FROM question_likes
      WHERE question_id = ?
    SQL
    likers.map { |res| User.find_by_id(res['user_id']) }
  end

  def self.num_likes_for_question_id(question_id)
    user_questions = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        COUNT(user_id) as user_count
      FROM 
        question_likes
      WHERE
        question_id = ?
    SQL

    user_questions['user_count']
  end

      # SELECT
      #   question_id
      # FROM
      #   question_likes
      # WHERE
      #   user_id = ?

  def self.liked_questions_for_user_id(user_id)
    liked_by_user_id = QuestionsDatabase.instance.execute(<<-SQL, user_id)

      SELECT
        questions.*
      FROM
        question_likes
      JOIN
        questions ON question_likes.question_id = questions.id
      WHERE
        question_likes.user_id = ?

    SQL
    # liked_by_user_id.map { |res| Question.find_by_id(res['question_id']) }

    liked_by_user_id.map { |res| Question.new(res) }
  end

  def self.most_liked_questions(n)
    ml_questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT 
        questions.id, COUNT(question_likes.user_id) as user_count
      FROM 
        question_likes
      JOIN
        questions on question_likes.question_id = questions.id
      GROUP BY
        questions.id
      ORDER BY
        user_count DESC
      LIMIT
        ?
    SQL
    ml_questions.map { |res| Question.find_by_id(res['id']) }      
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  

end