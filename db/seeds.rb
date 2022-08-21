# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'admintest'
)

MakerGenre.create!(
  [
    { mname: 'いすゞ' }, { mname: 'スズキ' }, { mname: 'スバル' }, { mname: 'ダイハツ' }, { mname: 'トヨタ' }, { mname: '日産' }, { mname: 'ホンダ' }, { mname: 'マツダ' }, { mname: '三菱' }, { mname: '光岡自動車' }, { mname: 'レクサス' }, { mname: '国産/その他' },
    { mname: 'メルセデス・ベンツ' }, { mname: 'フォルクスワーゲン' }, { mname: 'BMW' }, { mname: 'アウディ' }, { mname: 'ポルシェ' }, { mname: 'ミニ' },
    { mname: 'シボレー' }, { mname: 'フォード' }, { mname: 'キャデラック' }, { mname: 'GMC' }, { mname: 'ダッジ' }, { mname: 'ジープ' }, { mname: 'ハマー' },
    { mname: 'ランドローバー' }, { mname: 'ジャガー' }, { mname: 'ロータス' }, { mname: 'ケータハム' }, { mname: 'プジョー' }, { mname: 'ルノー' },
    { mname: 'アルファロメオ' }, { mname: 'フィアット' }, { mname: 'アバルト' }, { mname: 'ヒュンダイ' }, { mname: '海外/その他' }
  ]
)

PartsGenre.create!(
  [
    { pname: '外装' }, { pname: '内装' }, { pname: '吸気' }, { pname: '排気' }, { pname: 'エンジン' }, { pname: '過給機' }, { pname: 'ECU' }, { pname: 'ホイール/タイヤ' }, { pname: '足回り' }, { pname: '剛性' }, { pname: '故障' }, { pname: '点検' }, { pname: '日記' }
  ]
)
