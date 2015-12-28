# encoding: utf-8
require 'natto'

def change_to_meu_with_natto( text )
  nm = Natto::MeCab.new #mecab用変数
  surface = [] #分かち書き部分を格納
  feature = [] #品詞情報を格納
  is_ignore = false

  # 形態素解析結果のデバック出力
  #puts nm.parse(text)

  nm.parse(text) do |n|
    if n.feature.split(",")[0] == 'BOS/EOS'
      break
    end
    surface << n.surface
    feature << n.feature
  end

  # 動詞、助動詞の並びなら、動詞めうに変換
  for num in 1..surface.size-1
    # 変換後に助動詞が続く場合は無視
    if is_ignore == true && feature[num].split(",")[0] == '助動詞'
      surface.delete_at[surface.size-1]
      feature.delete_at[feature.size-1]
      next
    else
      is_ignore = false
    end

    # 動詞、助動詞の並びの場合
    if feature[num-1].split(",")[0] == '動詞' && feature[num].split(",")[0] == '助動詞'
      is_ignore = true

      # 過去形、否定形への対応
      if ( surface[num] == 'た' || surface[num] == 'ない' )
        surface << 'め'
        surface << 'う'
        next
      end

      # 語句の書き換え
      surface[num-1] = feature[num-1].split(",")[6] #動詞を基本形に
      surface[num] = 'め'
      surface.insert(num+1,  'う')
    end
  end

  #最後がめうでない場合はめうを挿入
  if feature[feature.size-1].split(",")[0] == '記号' || surface[surface.size-1] == '!' || surface[surface.size-1] == '!!'
    if !( surface[surface.size-3] == 'め' && surface[surface.size-2] == 'う')
      tmp = surface[surface.size-1]
      surface[surface.size-1] = 'め'
      surface << 'う'
      surface << tmp
    end
  elsif !( surface[surface.size-2] == 'め' && surface[surface.size-1] == 'う' )
    surface << 'め'
    surface << 'う'
  end


  # 生成語を文字列に変換
  str = ""
  surface.each do |n|
    str << n
  end
  return str
end
