class Word < ActiveRecord::Base

  def word_count
    self.sentence.split.size
  end

  def char_count
    self.sentence.split(%r{\s*}).size
  end

end
