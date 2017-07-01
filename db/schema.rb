# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170701055329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "owner_id",                          null: false
    t.decimal "balance",  precision: 12, scale: 2, null: false
    t.index ["owner_id"], name: "index_accounts_on_owner_id", unique: true, using: :btree
  end

  create_table "charges_tables", force: :cascade do |t|
    t.integer  "maker_id",                                                  null: false
    t.integer  "recipient_id",                                              null: false
    t.decimal  "amount",       precision: 12, scale: 2
    t.text     "memo",                                                      null: false
    t.string   "status",                                default: "pending", null: false
    t.string   "visibility",                            default: "public",  null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "requester_id",                     null: false
    t.integer  "responder_id",                     null: false
    t.string   "status",       default: "pending", null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["requester_id", "responder_id"], name: "index_friendships_on_requester_id_and_responder_id", unique: true, using: :btree
    t.index ["requester_id"], name: "index_friendships_on_requester_id", using: :btree
    t.index ["responder_id"], name: "index_friendships_on_responder_id", using: :btree
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "transaction_id",                null: false
    t.integer  "user_id",                       null: false
    t.boolean  "active",         default: true, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["transaction_id"], name: "index_likes_on_transaction_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "payments_tables", force: :cascade do |t|
    t.integer  "maker_id",                                                 null: false
    t.integer  "recipient_id",                                             null: false
    t.decimal  "amount",       precision: 12, scale: 2
    t.text     "memo",                                                     null: false
    t.string   "visibility",                            default: "public", null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "maker_id",                                                  null: false
    t.integer  "recipient_id",                                              null: false
    t.decimal  "amount",       precision: 12, scale: 2,                     null: false
    t.text     "memo",                                                      null: false
    t.string   "status",                                default: "pending", null: false
    t.string   "visibility",                            default: "public",  null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.index ["maker_id"], name: "index_transactions_on_maker_id", using: :btree
    t.index ["recipient_id"], name: "index_transactions_on_recipient_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["first_name"], name: "index_users_on_first_name", using: :btree
    t.index ["last_name"], name: "index_users_on_last_name", using: :btree
    t.index ["username"], name: "index_users_on_username", using: :btree
  end

end
