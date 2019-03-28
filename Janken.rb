=begin
じゃんけん問題をつくってくる
puts “じゃんけん・・・・”
puts “[0]グー[1]チョキ[2]パー”
この続きを完成させてください。
自分の手を0、1、2で入力し、グー、チョキ、パーを判定。また自分の手をplayer_hand、相手の手をprogram_handとし、相手の手はランダムで決定される
=end

class Player
  attr_accessor :hand

  def initialize(player_hand)
    @hand = player_hand
    print "あなたの出した手: " + "[" + hand.to_s + "]"
    printHandName
  end

  #出した手の日本語名を出力する
  def printHandName
    if hand == 0
      puts "グー"
    elsif hand == 1
      puts "チョキ"
    else
      puts "パー"
    end
  end
end


class ProgramPlayer < Player
  def initialize(program_hand)
    @hand = program_hand
    print "相手の出した手: " + "[" + hand.to_s + "]"
    printHandName
  end
end


puts "じゃんけん・・・・"
puts "[0]グー[1]チョキ[2]パー"

error = 1
#errorフラグが1のとき繰り返す
while error == 1 do
  print "自分が出す手を0,1,2の番号で入力してください: "
  player_hand = gets.chomp.to_i

  #入力値が0,1,2以外の時にerrorフラグを1にする
  if player_hand == 0 || player_hand == 1 || player_hand == 2
    error = 0
  else
    puts "0,1,2の数字で入力してください"
    error = 1
  end
end

#結果を出力する
puts ""
puts "結果・・・・"

player = Player.new(player_hand)
program_hand = rand(3)
programPlayer = ProgramPlayer.new(program_hand)

puts ""

#勝敗を出力する
if player_hand - program_hand == -1 || player_hand - program_hand == 2
  puts "あなたの勝ちです"
elsif program_hand - player_hand == -1 || program_hand - player_hand == 2
  puts "相手の勝ちです"
else
  puts "引き分けです"
end
