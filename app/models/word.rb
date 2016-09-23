class Word < ActiveRecord::Base

  def word_count
    self.sentence.split.size
  end

  def char_count
    self.sentence.split(%r{\s*}).size
  end

  def sentence_count
    self.sentence.split(/(?<=[?.!])/).size
  end

  def noun_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    sent_arr = tagged.split("> <")
    sent_scan = sent_arr.flat_map { |s| s.scan(/nn|nnp|nnps|nns/) }
    occ_count = sent_scan.count
    final_count = occ_count / 2
    final_count
  end

  def adj_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    sent_arr = tagged.split("> <")
    sent_scan = sent_arr.flat_map { |s| s.scan(/jj|cd|jjr|jjs/) }
    occ_count = sent_scan.count
    final_count = occ_count / 2
    final_count
  end

  def verb_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    sent_arr = tagged.split("> <")
    sent_scan = sent_arr.flat_map { |s| s.scan(/md|vb|vbd|vbg|vbn|vbp|vbz/) }
    occ_count = sent_scan.count
    final_count = occ_count / 2
    final_count
  end

  def punct_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    sent_arr = tagged.split("> <")
    sent_scan = sent_arr.flat_map { |s| s.scan(/pp|ppc|ppd|ppl|ppr|pps|lrb|rrb/) }
    occ_count = sent_scan.count
    final_count = occ_count / 2
    final_count
  end

  def det_count
    tgr = EngTagger.new
    tagged = tgr.add_tags(self.sentence)
    sent_arr = tagged.split("> <")
    sent_scan = sent_arr.flat_map { |s| s.scan(/det/) }
    occ_count = sent_scan.count
    final_count = occ_count / 2
    final_count
  end

  def most_common_char
    str = self.sentence
    no_ws = str.gsub(/\s+/, "")
    arr = no_ws.split('')
    freq = arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h}
    letter = arr.max_by { |v| freq[v] }
  end
end
