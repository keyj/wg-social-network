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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110717170451) do

  create_table "invitations", :force => true do |t|
    t.string   "name"
    t.string   "facebookuid"
    t.string   "email"
    t.string   "secret"
    t.integer  "sent_by"
    t.string   "to_email"
    t.integer  "status"
    t.integer  "wg_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mietvertrags", :force => true do |t|
    t.integer  "user_id"
    t.integer  "wg_id"
    t.date     "start"
    t.date     "ende"
    t.float    "miete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "msns", :force => true do |t|
    t.string   "number"
    t.string   "msn_id"
    t.integer  "user_id"
    t.text     "bemerkungen"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "content"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  create_table "rechnungs", :force => true do |t|
    t.string   "rechnungsnummer"
    t.date     "rechnungsdatum"
    t.integer  "wg_id"
    t.integer  "status_id"
    t.integer  "provider_id"
    t.text     "logs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rechnungsmonat"
    t.string   "kundennummer"
    t.string   "jahr"
    t.string   "rechnungsdatei_file_name"
    t.string   "rechnungsdatei_content_type"
    t.integer  "rechnungsdatei_file_size"
    t.datetime "rechnungsdatei_updated_at"
    t.string   "verbindungendatei_file_name"
    t.string   "verbindungendatei_content_type"
    t.integer  "verbindungendatei_file_size"
    t.datetime "verbindungendatei_updated_at"
  end

  create_table "sharings", :force => true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "user_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.string   "slug"
    t.string   "rufname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "verbindungs", :force => true do |t|
    t.string   "msn_id"
    t.integer  "rechnung_id"
    t.integer  "verbindung_id"
    t.string   "datum_raw"
    t.date     "datum"
    t.string   "zeit_raw"
    t.time     "zeit"
    t.string   "laenge_raw"
    t.integer  "laenge"
    t.string   "nummer_raw"
    t.string   "nummer"
    t.string   "tarif_raw"
    t.integer  "tarif_id"
    t.string   "betrag_raw"
    t.decimal  "betrag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wgs", :force => true do |t|
    t.string   "name"
    t.text     "beschreibung"
    t.text     "adresse"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
