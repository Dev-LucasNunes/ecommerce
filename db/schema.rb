# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_18_153921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carros", force: :cascade do |t|
    t.string "nome", limit: 100
    t.string "modelo", limit: 150
    t.integer "ano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro", limit: 255
    t.string "numero", limit: 50
    t.string "cep", limit: 11
    t.string "cidade", limit: 150
    t.string "estado", limit: 2
    t.string "complemento", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name", limit: 150
    t.string "cnpj", limit: 25
    t.text "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers_enderecos", force: :cascade do |t|
    t.bigint "endereco_id", null: false
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_suppliers_enderecos_on_endereco_id"
    t.index ["supplier_id"], name: "index_suppliers_enderecos_on_supplier_id"
  end

  add_foreign_key "suppliers_enderecos", "enderecos"
  add_foreign_key "suppliers_enderecos", "suppliers"
end
