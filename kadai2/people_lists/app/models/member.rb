class Member < ApplicationRecord
  # 名前のバリデーション
  validates :name, presence: { message: "名前は空であってはなりません" },
                   length: { minimum: 1, maximum: 20, 
                             too_short: "名前は1文字以上でなければなりません",
                             too_long: "名前は20文字以内でなければなりません" },
                   uniqueness: { message: "名前はユニークでなければなりません" }

  # 身長のバリデーション (カスタムメッセージ)
  validates :height, presence: { message: "身長は必須です" },
                     numericality: { greater_than_or_equal_to: 1, message: "身長は1以上で入力してください" }

  # 体重のバリデーション (カスタムメッセージ)
  validates :weight, presence: { message: "体重は必須です" },
                     numericality: { greater_than_or_equal_to: 1, message: "体重は1以上で入力してください" }
end
