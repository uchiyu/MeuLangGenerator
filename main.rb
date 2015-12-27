# encoding: utf-8
require './change-to-meu-with-natto.rb'
require './meu-corpus.rb'

puts "文章を入力するめう"
text = gets()
#text = "自転車で行きます!!"
text = change_to_meu_with_natto(text)
text = meu_corpus(text)

puts text
