class Word < ActiveRecord::Base



  def word_count
    self.sentence.split.size
  end

  def char_count
    self.sentence.split(%r{\s*}).size
  end

  def noun_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    nouns = tgr.get_nouns(tagged)
    nouns.count
  end

  def sentence_count
    self.sentence.split(/(?<=[?.!])/).size
  end

  # def adj_count
  #   tgr = EngTagger.new
  #   tagged = tgr.add_tags(self.sentence)
  #   adj = tgr.get_adjectives(tagged)
  #   adj.count
  # end

  # def verb_count
  #   tgr = EngTagger.new
  #   tagged = tgr.add_tags(self.sentence)
  #   verbs = tgr.get_verbs(tagged)
  #   verbs.count
  # end

  def tags
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
  end

end
