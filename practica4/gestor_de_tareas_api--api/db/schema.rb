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

ActiveRecord::Schema[8.0].define(version: 2025_05_22_154853) do
  create_table "autors", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ejemplars", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.boolean "disponible"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["producto_id"], name: "index_ejemplars_on_producto_id"
  end

  create_table "prestamos", force: :cascade do |t|
    t.date "fecha_ini"
    t.date "fecha_fin"
    t.boolean "devuelto"
    t.integer "ejemplar_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ejemplar_id"], name: "index_prestamos_on_ejemplar_id"
    t.index ["user_id"], name: "index_prestamos_on_user_id"
  end

  create_table "producto_autors", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "autor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_producto_autors_on_autor_id"
    t.index ["producto_id"], name: "index_producto_autors_on_producto_id"
  end

  create_table "producto_ejemplars", force: :cascade do |t|
    t.integer "producto_id", null: false
    t.integer "ejemplar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ejemplar_id"], name: "index_producto_ejemplars_on_ejemplar_id"
    t.index ["producto_id"], name: "index_producto_ejemplars_on_producto_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "titulo"
    t.string "fecha"
    t.boolean "es_peli"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tareas", force: :cascade do |t|
    t.string "descripcion"
    t.boolean "completada"
    t.string "usuario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nombre"
    t.string "correo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["correo"], name: "index_usuarios_on_correo", unique: true
  end

  add_foreign_key "ejemplars", "productos"
  add_foreign_key "prestamos", "ejemplars"
  add_foreign_key "prestamos", "users"
  add_foreign_key "producto_autors", "autors"
  add_foreign_key "producto_autors", "productos"
  add_foreign_key "producto_ejemplars", "ejemplars"
  add_foreign_key "producto_ejemplars", "productos"
end
