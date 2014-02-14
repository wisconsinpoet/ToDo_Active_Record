require 'active_record'

class Task < ActiveRecord::Base
  has_many :task_tags
  has_many :tags, through: :task_tags

  def check_status(status)
    status ? "\033[3;31m_X_\033[0m" : "___"
  end

  def to_s
    "#{id.to_s.ljust(3)} |#{check_status(completed)}| #{task_name}"
  end

  def self.add(input)
    Task.create(task_name: input, completed: false)
  end

  def self.complete(id)
    Task.update(id, completed: true)
  end

end
