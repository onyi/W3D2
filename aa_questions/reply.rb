require 'sqlite3'
require_relative 'questions_database'
require_relative 'user'
require_relative 'reply'
require_relative 'question'
require_relative 'question_like'
require_relative 'question_follow'

class Reply

  attr_reader :id, :question_id, :parent, :body, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT * FROM replies
      WHERE ID = ?
    SQL
    Reply.new(reply.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT * FROM replies
      WHERE user_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT * FROM replies
      WHERE question_id = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent = options['parent']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent) unless @parent.nil?
  end

  def child_replies
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT * FROM replies
      WHERE parent = ?
    SQL
    data.map { |datum| Reply.new(datum) }
  end
end