# encoding: utf-8
require './change-to-meu-with-natto.rb'
require './meu-corpus.rb'

puts "文章を入力するめう"
text = gets()
text = change_to_meu_with_natto(text)
text = changeToMeu(text)

puts text
