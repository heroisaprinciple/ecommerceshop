class User < ApplicationRecord
  def initialize(name)
    @name = name
  end

  def intro
    @name
  end
end
