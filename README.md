
# usersテーブル(ユーザー管理)
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name_kanji   | string   | null: false               |
| last_name_kanji    | string   | null: false               |
| first_name_kana    | string   | null: false               |
| last_name_kana     | string   | null: false               |
| birthday           | date     | null: false               |

# association
- has_many :products
- has_many :purchase_records


# productsテーブル(商品情報)
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    | 
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| number_of_day_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

# association
- belongs_to :user
- has_one :purchase_record


# shipping_addressesテーブル(発送先情報) 
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| municipality       | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchase_record    | references | null: false, foreign_key: true |

# association
- belongs_to :purchase_record


# purchase_recordsテーブル(購入記録)
| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| user               | references   | null: false, foreign_key: true |               
| product            | references   | null: false, foreign_key: true |

# association
- belongs_to :user
- has_one :shipping_address
- belongs_to :product