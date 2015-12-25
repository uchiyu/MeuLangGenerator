# encoding: utf-8
require 'natto'

def change_to_meu_with_natto( text )
  nm = Natto::MeCab.new #mecab用変数
  surface = Array.new #分かち書き部分を格納
  feature = Array.new #品詞情報を格納

  puts nm.parse(text)

  nm.parse(text) do |n|
    surface << n.surface
    feature << n.feature
  end

  # 動詞、助動詞の並びなら、動詞めうに変換
  surface.each_with_index do |word, num|
    if feature[num-1].split(",")[0] == '動詞' && feature[num].split(",")[0] == '助動詞'
      surface[num] = "めう"
      surface[num-1] = feature[num-1].split(",")[6]
    end
  end

  str = ""
  surface.each do |n|
    str << n
  end
  return str
end
