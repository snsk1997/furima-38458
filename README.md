# usersテーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| name(kanji)        | string   | null: false               |
| name(kana)         | string   | null: false               |
| birthday           | date     | null: false               |

# association
- has_many :products
- belongs_to :shipping_address
- belongs_to :credit_cards

# productsテーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| explanation        | text     | null: false               |
| category           | string   | null: false               |
| situation          | string   | null: false               |
| delivery_charge    | string   | null: false               |
| area               | string   | null: false               |
| number_of_days     | string   | null: false               |
| price              | integer  | null: false               |

# association
- belongs_to :users

# shipping_addressテーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| name               | string   | null: false               |
| explanation        | text     | null: false               |
| category           | string   | null: false               |
| situation          | string   | null: false               |
| delivery_charge    | string   | null: false               |
| area               | string   | null: false               |
| number_of_days     | string   | null: false               |
| price              | integer  | null: false               |

# association
- belongs_to :users

# credit_cardsテーブル
| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| number             | integer  | null: false               |
| deadline           | date     | null: false               |
| security_code      | integer  | null: false               |

# association
- belongs_to :users