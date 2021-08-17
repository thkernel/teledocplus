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

ActiveRecord::Schema.define(version: 2021_11_22_114030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activity_fields", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_activity_fields_on_user_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "uid"
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "address_1"
    t.string "address_2"
    t.string "phone_1"
    t.string "phone_2"
    t.string "neighborhood"
    t.string "state"
    t.string "country"
    t.string "city"
    t.string "zip_code"
    t.string "po_box"
    t.string "street"
    t.string "door"
    t.float "latitude"
    t.float "longitude"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "api_keys", force: :cascade do |t|
    t.string "access_token", null: false
    t.integer "user_id", null: false
    t.boolean "active", default: true, null: false
    t.datetime "expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["access_token"], name: "index_api_keys_on_access_token", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.string "reason"
    t.string "day"
    t.time "start_time"
    t.time "end_time"
    t.text "content"
    t.boolean "validated"
    t.datetime "validation_date"
    t.boolean "canceled"
    t.datetime "canceled_date"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "countries", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_countries_on_user_id"
  end

  create_table "diabete_monitorings", force: :cascade do |t|
    t.string "uid"
    t.bigint "patient_id"
    t.string "glycemie_a_jeun"
    t.boolean "sueurs"
    t.boolean "sensation_de_faim"
    t.boolean "tremblement"
    t.boolean "vertige"
    t.boolean "irritabilite"
    t.boolean "polyurie_majoree"
    t.boolean "fatigue_majoree"
    t.boolean "amaigrissement"
    t.text "comments"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_diabete_monitorings_on_patient_id"
    t.index ["user_id"], name: "index_diabete_monitorings_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.bigint "speciality_id"
    t.string "address"
    t.string "phone"
    t.bigint "country_id"
    t.string "locality"
    t.string "email"
    t.text "description"
    t.float "consultation_price", default: 0.0
    t.float "general_consultation_price", default: 0.0
    t.float "specialized_consultation_price", default: 0.0
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_doctors_on_country_id"
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.string "subject_class"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heart_failure_monitorings", force: :cascade do |t|
    t.string "uid"
    t.bigint "patient_id"
    t.float "weight"
    t.float "cardiac_frequency"
    t.boolean "breathlessness"
    t.boolean "feet_swelling"
    t.string "status"
    t.text "comments"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_heart_failure_monitorings_on_patient_id"
    t.index ["user_id"], name: "index_heart_failure_monitorings_on_user_id"
  end

  create_table "hta_monitorings", force: :cascade do |t|
    t.string "uid"
    t.bigint "patient_id"
    t.string "tas"
    t.string "tad"
    t.string "status"
    t.text "comments"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_hta_monitorings_on_patient_id"
    t.index ["user_id"], name: "index_hta_monitorings_on_user_id"
  end

  create_table "localities", force: :cascade do |t|
    t.string "uid"
    t.bigint "country_id"
    t.string "region"
    t.string "cercle"
    t.string "commune"
    t.string "city"
    t.string "neighbourhood"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_localities_on_country_id"
    t.index ["user_id"], name: "index_localities_on_user_id"
  end

  create_table "medication_schedules", force: :cascade do |t|
    t.string "uid"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.string "morning_number"
    t.string "noo_number"
    t.string "evening_number"
    t.string "status"
    t.text "comments"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_medication_schedules_on_doctor_id"
    t.index ["patient_id"], name: "index_medication_schedules_on_patient_id"
    t.index ["user_id"], name: "index_medication_schedules_on_user_id"
  end

  create_table "organization_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_organization_types_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.bigint "organization_type_id"
    t.bigint "activity_field_id"
    t.string "slogan"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.string "fax"
    t.string "zip_code"
    t.string "web_site"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_field_id"], name: "index_organizations_on_activity_field_id"
    t.index ["organization_type_id"], name: "index_organizations_on_organization_type_id"
    t.index ["user_id"], name: "index_organizations_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "uid"
    t.string "first_name"
    t.string "last_name"
    t.string "civility"
    t.string "age"
    t.string "address"
    t.string "phone"
    t.bigint "country_id"
    t.string "locality"
    t.string "email"
    t.string "pathology"
    t.string "monitoring_frequency"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_patients_on_country_id"
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "permission_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "permission_id"
    t.string "action_name"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_permission_items_on_permission_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "uid"
    t.bigint "feature_id"
    t.bigint "role_id"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["feature_id"], name: "index_permissions_on_feature_id"
    t.index ["role_id"], name: "index_permissions_on_role_id"
  end

  create_table "prescription_items", force: :cascade do |t|
    t.string "uid"
    t.bigint "prescription_id", null: false
    t.string "medicament"
    t.string "posologie"
    t.text "comments"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prescription_id"], name: "index_prescription_items_on_prescription_id"
    t.index ["user_id"], name: "index_prescription_items_on_user_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "uid"
    t.bigint "doctor_id"
    t.bigint "patient_id"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_prescriptions_on_doctor_id"
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id"
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "uid"
    t.string "profile_type"
    t.string "company_name"
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.text "describe"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "smtp_configs", force: :cascade do |t|
    t.string "smtp_host"
    t.string "smtp_user_name"
    t.string "smtp_user_password"
    t.string "smtp_domain"
    t.string "smtp_address"
    t.integer "smtp_port"
    t.string "smtp_authentification"
    t.boolean "smtp_enable_starttls_auto"
    t.boolean "smtp_ssl"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_smtp_configs_on_user_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_specialities_on_user_id"
  end

  create_table "structure_types", force: :cascade do |t|
    t.string "uid"
    t.string "name"
    t.text "description"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_structure_types_on_user_id"
  end

  create_table "structures", force: :cascade do |t|
    t.string "uid"
    t.bigint "structure_type_id"
    t.string "name"
    t.string "slogan"
    t.string "address"
    t.string "full_address"
    t.string "street"
    t.string "phone"
    t.bigint "country_id"
    t.string "locality"
    t.string "email"
    t.string "web"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.float "consultation_price", default: 0.0
    t.float "general_consultation_price", default: 0.0
    t.float "specialized_consultation_price", default: 0.0
    t.bigint "views", default: 0
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_structures_on_country_id"
    t.index ["structure_type_id"], name: "index_structures_on_structure_type_id"
    t.index ["user_id"], name: "index_structures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.string "login"
    t.bigint "role_id"
    t.string "status"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activity_fields", "users"
  add_foreign_key "countries", "users"
  add_foreign_key "diabete_monitorings", "users"
  add_foreign_key "doctors", "countries"
  add_foreign_key "doctors", "specialities"
  add_foreign_key "doctors", "users"
  add_foreign_key "heart_failure_monitorings", "users"
  add_foreign_key "hta_monitorings", "users"
  add_foreign_key "localities", "countries"
  add_foreign_key "localities", "users"
  add_foreign_key "medication_schedules", "users"
  add_foreign_key "organization_types", "users"
  add_foreign_key "organizations", "activity_fields"
  add_foreign_key "organizations", "organization_types"
  add_foreign_key "organizations", "users"
  add_foreign_key "patients", "countries"
  add_foreign_key "patients", "users"
  add_foreign_key "permission_items", "permissions"
  add_foreign_key "permissions", "features"
  add_foreign_key "permissions", "roles"
  add_foreign_key "prescription_items", "prescriptions"
  add_foreign_key "prescription_items", "users"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "profiles", "users"
  add_foreign_key "smtp_configs", "users"
  add_foreign_key "specialities", "users"
  add_foreign_key "structure_types", "users"
  add_foreign_key "structures", "countries"
  add_foreign_key "structures", "structure_types"
  add_foreign_key "structures", "users"
  add_foreign_key "users", "roles"
end
