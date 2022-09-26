
# usersテーブル(ユーザー管理)
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name(kanji)  | string   | null: false               |
| last_name(kanji)   | string   | null: false               |
| first_name(kana)   | string   | null: false               |
| last_name(kana)    | string   | null: false               |
| birthday           | date     | null: false               |

# association
- has_many :products
- has_many :purchase_records


# productsテーブル(商品情報)
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| explanation        | text     | null: false               |
| category_id        | string   | null: false               |
| situation_id       | string   | null: false               |
| delivery_charge_id | string   | null: false               |
| area_id            | string   | null: false               |
| number_of_days_id  | string   | null: false               |
| price              | integer  | null: false               |

# association
- belongs_to :user
- belongs_to :purchase_record


# shipping_addressesテーブル(発送先情報)
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| post_cod           | integer  | null: false               |
| prefectures        | string   | null: false               |
| municipality       | string   | null: false               |
| address            | integer  | null: false               |
| building_name      | string   | null: false               |
| phone_number       | integer  | null: false               |

# association
- belongs_to :user


# purchase_recordsテーブル(購入記録)
| Column             | Type     | Options                                      |
| ------------------ | -------- | -------------------------------------------- |
| name               | string   | null: false, foreign_key: true               |               
| email              | string   | null: false, unique: true, foreign_key: true |
| encrypted_password | string   | null: false, foreign_key: true               |

# association
- belongs_to :user
- belongs_to :shipping_address
- belongs_to :product