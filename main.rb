# encoding: utf-8
require './change-to-meu-with-natto.rb'
require './meu-corpus.rb'

puts "文章を入力するめう"
text = gets()
#text = "自転車で行きます!!"
<<<<<<< HEAD:test.rb
=======
text = meu_corpus(text)
>>>>>>> a98e4b37334ca57ad73f03f21a4820aa15f53650:main.rb
text = change_to_meu_with_natto(text)

puts text
