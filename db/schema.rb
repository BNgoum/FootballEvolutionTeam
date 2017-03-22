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

ActiveRecord::Schema.define(version: 20170321180909) do

  create_table "equipe_persos", force: :cascade do |t|
    t.string   "nameteam"
    t.string   "nametrainer"
    t.integer  "effectif"
    t.string   "pays"
    t.integer  "statsgenerale"
    t.integer  "argent",             default: 1200
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "equipes", force: :cascade do |t|
    t.string   "name"
    t.string   "pays"
    t.string   "entraineur"
    t.integer  "statsgenerale"
    t.integer  "nombreJoueurs"
    t.integer  "joueurs_count",      default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "joueurs", force: :cascade do |t|
    t.integer  "statsgenerale"
    t.string   "poste"
    t.string   "club"
    t.string   "nationalite"
    t.string   "name"
    t.integer  "pac"
    t.integer  "dri"
    t.integer  "tir"
    t.integer  "def"
    t.integer  "pas"
    t.integer  "phy"
    t.string   "qualite"
    t.integer  "equipe_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.integer  "equipe_perso_id"
    t.integer  "prix"
    t.boolean  "estAchete",          default: false
    t.index ["equipe_id"], name: "index_joueurs_on_equipe_id"
    t.index ["equipe_perso_id"], name: "index_joueurs_on_equipe_perso_id"
  end

  create_table "models", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_models_on_email", unique: true
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true
  end

  create_table "players", force: :cascade do |t|
    t.integer "statsgenerale"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
