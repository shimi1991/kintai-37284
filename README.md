# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| number   | string | null: false |
| password | string | null: false |

### Association

- has_many :kintais

## kintais テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_time | string     | null: false                    |
| end_time   | string     | null: false                    |
| total_time | string     |                                |
| over_time  | string     |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user