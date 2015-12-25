# encoding: utf-8
require 'natto'

def change_to_meu_with_natto( text )
  nm = Natto::MeCab.new #mecab用変数
  surface = Array.new #分かち書き部分を格納
  feature = Array.new #品詞情報を格納
  isIgnore = false

  puts nm.parse(text)

  nm.parse(text) do |n|
    surface << n.surface
    feature << n.feature
  end

  # 動詞、助動詞の並びなら、動詞めうに変換
  surface.each_with_index do |word, num|
    # 変換後に助動詞が続く場合は無視
    if isIgnore == true && feature[num].split(",")[0] == '助動詞'
      surface[num] = ""
      next
    else
      isIgnore = false
    end

    # 動詞、助動詞の並びの場合
    if feature[num-1].split(",")[0] == '動詞' && feature[num].split(",")[0] == '助動詞'
      isIgnore = true

      # 過去形への対応
      if ( surface[num] == 'た' )
        surface[num] << 'めう'
        next
      end

      # 語句の書き換え
      surface[num-1] = feature[num-1].split(",")[6]
      surface[num] = 'めう'
    end
  end

  # 生成語を文字列に変換
  str = ""
  surface.each do |n|
    str << n
  end
  return str
end
