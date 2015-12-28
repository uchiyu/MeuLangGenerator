require './spec_helper.rb'

RSpec.describe '#change-to-meu-with-natto' do
  it '一般形' do
    expect(change_to_meu_with_natto('行く')).to eq '行くめう'
  end
  it '動詞、助詞' do
    expect(change_to_meu_with_natto('行きます')).to eq '行くめう'
  end
  it '過去形' do
    expect(change_to_meu_with_natto('行った')).to eq '行っためう'
  end
  it '末尾にめうを挿入' do
    expect(change_to_meu_with_natto('腹パン')).to eq '腹パンめう'
  end
end
