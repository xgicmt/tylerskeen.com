# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150819185104) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "token",      limit: 255
    t.string   "secret",     limit: 255
    t.string   "username",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.string   "file",        limit: 255
    t.string   "filename",    limit: 255
    t.string   "category",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "documents", ["property_id"], name: "index_documents_on_property_id", using: :btree

  create_table "extras", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "extras", ["property_id"], name: "index_extras_on_property_id", using: :btree

  create_table "leadership_team_members", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "picture",    limit: 255
    t.text     "synopsis",   limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "sponsor_id", limit: 4
  end

  add_index "leadership_team_members", ["sponsor_id"], name: "index_leadership_team_members_on_sponsor_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.integer  "purchase_price",       limit: 4
    t.integer  "min_investment",       limit: 4
    t.text     "overview",             limit: 65535
    t.integer  "targeted_irr",         limit: 4
    t.integer  "targeted_hold_period", limit: 4
    t.integer  "targeted_yield",       limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "address_street",       limit: 255
    t.string   "address_city",         limit: 255
    t.string   "address_state",        limit: 255
    t.string   "address_zipcode",      limit: 255
    t.integer  "sponsor_id",           limit: 4
  end

  add_index "properties", ["sponsor_id"], name: "index_properties_on_sponsor_id", using: :btree

  create_table "propimages", force: :cascade do |t|
    t.integer  "property_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "image_name",  limit: 255
  end

  add_index "propimages", ["property_id"], name: "index_propimages_on_property_id", using: :btree

  create_table "sponsors", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo",            limit: 255
    t.string   "name",            limit: 255
    t.text     "synopsis",        limit: 65535
    t.string   "address_street",  limit: 255
    t.string   "address_city",    limit: 255
    t.string   "address_state",   limit: 255
    t.string   "address_zipcode", limit: 255
    t.string   "phone_number",    limit: 255
    t.string   "website",         limit: 255
    t.integer  "user_id",         limit: 4
  end

  add_index "sponsors", ["user_id"], name: "index_sponsors_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "role",                   limit: 255, default: "visitor", null: false
    t.string   "email",                  limit: 255, default: "",        null: false
    t.string   "encrypted_password",     limit: 255, default: "",        null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",                 limit: 255
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.integer  "sponsor_id",             limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
