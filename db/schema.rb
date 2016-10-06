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

ActiveRecord::Schema.define(version: 20161005151734) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     :index=>{:name=>"index_active_admin_comments_on_namespace"}
    t.text     "body"
    t.string   "resource_id",   :null=>false
    t.string   "resource_type", :null=>false, :index=>{:name=>"index_active_admin_comments_on_resource_type_and_resource_id", :with=>["resource_id"]}
    t.integer  "author_id"
    t.string   "author_type",   :index=>{:name=>"index_active_admin_comments_on_author_type_and_author_id", :with=>["author_id"]}
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "laboratory_name"
    t.string   "cpa_status"
    t.string   "cpa_reference_number"
    t.string   "contact_name"
    t.date     "date_selection_form_completed"
    t.boolean  "selection_form_completed"
    t.boolean  "website_updated"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "postcode"
    t.string   "telephone"
    t.string   "website"
    t.string   "comments"
    t.integer  "user_id"
    t.datetime "created_at",                        :null=>false
    t.datetime "updated_at",                        :null=>false
    t.datetime "date_request_for_information_sent"
    t.datetime "date_information_updated"
    t.string   "lab_number"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "email"
  end

  create_table "laboratory_tests", force: :cascade do |t|
    t.string   "analyte_name"
    t.string   "comments"
    t.string   "eqa_status"
    t.string   "turnaround_time"
    t.string   "ukas_status"
    t.string   "methodology"
    t.string   "reference_range"
    t.string   "sample_type"
    t.string   "cost_of_test"
    t.string   "uncertainty_of_measurement"
    t.integer  "laboratory_id"
    t.datetime "created_at",                      :null=>false
    t.datetime "updated_at",                      :null=>false
    t.string   "lab_number"
    t.string   "eqa_provider"
    t.string   "eqa_performance"
    t.string   "sample_volume"
    t.string   "special_collection_requirements"
    t.string   "ukas_reference_number"
    t.date     "date_test_information_updated"
    t.string   "email"
  end

  create_table "local_departments", force: :cascade do |t|
    t.string   "department_name", :default=>"", :null=>false
    t.datetime "created_at",      :null=>false
    t.datetime "updated_at",      :null=>false
  end

  create_table "repertoires", force: :cascade do |t|
    t.integer  "laboratory_id"
    t.integer  "laboratory_test_id"
    t.datetime "created_at",                        :null=>false
    t.datetime "updated_at",                        :null=>false
    t.date     "date_selection_form_completed"
    t.boolean  "selection_form_completed"
    t.boolean  "website_updated"
    t.date     "date_request_for_information_sent"
    t.date     "date_information_updated"
    t.boolean  "record_complete"
    t.integer  "local_department_id",               :index=>{:name=>"fk__repertoires_local_department_id"}, :foreign_key=>{:references=>"local_departments", :name=>"fk_repertoires_local_department_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.integer  "local_departments_id",              :index=>{:name=>"index_repertoires_on_local_departments_id"}, :foreign_key=>{:references=>"local_departments", :name=>"fk_repertoires_local_departments_id", :on_update=>:no_action, :on_delete=>:no_action}
    t.boolean  "inactive"
    t.date     "date_inactive"
  end

  create_view "repertoire_lookups", <<-'END_VIEW_REPERTOIRE_LOOKUPS', :force => true
SELECT repertoires.id AS repertoire_id,
    repertoires.laboratory_test_id,
    repertoires.laboratory_id AS host_laboratory_id,
    laboratories.id AS referral_laboratory_id
   FROM repertoires,
    laboratory_tests,
    laboratories
  WHERE ((repertoires.laboratory_test_id = laboratory_tests.id) AND (laboratory_tests.laboratory_id = laboratories.id))
  END_VIEW_REPERTOIRE_LOOKUPS

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", :null=>false
    t.datetime "updated_at", :null=>false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               :default=>"", :null=>false
    t.string   "first_name",             :default=>"", :null=>false
    t.string   "surname",                :default=>"", :null=>false
    t.string   "title",                  :default=>"", :null=>false
    t.datetime "created_at",             :null=>false
    t.datetime "updated_at",             :null=>false
    t.string   "email",                  :default=>"", :null=>false, :index=>{:name=>"index_users_on_email", :unique=>true}
    t.string   "encrypted_password",     :default=>"", :null=>false
    t.string   "reset_password_token",   :index=>{:name=>"index_users_on_reset_password_token", :unique=>true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default=>0, :null=>false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role_id",                :index=>{:name=>"index_users_on_role_id"}, :foreign_key=>{:references=>"roles", :name=>"fk_rails_642f17018b", :on_update=>:no_action, :on_delete=>:no_action}
  end

end
