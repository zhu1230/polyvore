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

ActiveRecord::Schema.define(:version => 20110328154206) do

  create_table "admin_users", :force => true do |t|
    t.string  "email"
    t.string  "password"
    t.date    "created_on"
    t.string  "status"
    t.string  "name"
    t.string  "last_name"
    t.date    "updated_on"
    t.integer "user_id",    :null => false
  end

  create_table "attachments", :force => true do |t|
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.integer  "product_id"
  end

  create_table "brand_master", :primary_key => "brand_id", :force => true do |t|
    t.string  "brand_name",   :limit => 200, :null => false
    t.integer "sorting",                     :null => false
    t.date    "updat_date",                  :null => false
    t.string  "brand_status", :limit => 0,   :null => false
    t.integer "user_id",                     :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "cat_name",   :limit => 200, :null => false
    t.string   "cat_url",    :limit => 250, :null => false
    t.string   "pages",      :limit => 100, :null => false
    t.integer  "sorting",                   :null => false
    t.string   "cat_status", :limit => 0,   :null => false
    t.string   "parent",     :limit => 11,  :null => false
    t.integer  "user_id",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cms", :primary_key => "cms_id", :force => true do |t|
    t.string  "cms_name",   :limit => 250, :null => false
    t.text    "cms_text",                  :null => false
    t.string  "cms_status", :limit => 0,   :null => false
    t.date    "cms_dt",                    :null => false
    t.integer "user_id",                   :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "title",            :limit => 50, :default => ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], :name => "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "faq", :primary_key => "faq_id", :force => true do |t|
    t.text    "faq",                     :null => false
    t.text    "answer",                  :null => false
    t.date    "faq_dt",                  :null => false
    t.string  "faq_status", :limit => 0, :null => false
    t.integer "user_id",                 :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "left"
    t.integer  "top"
    t.integer  "width"
    t.integer  "height"
    t.string   "angle"
    t.integer  "make_up_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "make_ups", :force => true do |t|
    t.string   "title"
    t.text     "notes"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "newsletter_subscriber", :force => true do |t|
    t.string  "email"
    t.string  "created_on"
    t.string  "status"
    t.integer "user_id",    :null => false
  end

  create_table "newsletters", :force => true do |t|
    t.string   "news_letter_title", :limit => 250,      :null => false
    t.text     "contact_detail",    :limit => 16777215, :null => false
    t.datetime "add_date",                              :null => false
    t.string   "status",            :limit => 0,        :null => false
  end

  create_table "order_det", :primary_key => "order_id", :force => true do |t|
    t.integer "product_id",                :null => false
    t.string  "prod_qty",   :limit => 100, :null => false
    t.string  "prod_price", :limit => 100, :null => false
    t.string  "prod_amt",   :limit => 100, :null => false
  end

  create_table "order_master", :primary_key => "order_id", :force => true do |t|
    t.date   "order_dt",                      :null => false
    t.string "user_id",        :limit => 100, :null => false
    t.string "total_qty",      :limit => 100, :null => false
    t.string "total_amt",      :limit => 100, :null => false
    t.string "payment_status", :limit => 0,   :null => false
    t.string "payment_made",   :limit => 100, :null => false
  end

  create_table "product", :primary_key => "product_id", :force => true do |t|
    t.integer "cate_id",                     :null => false
    t.integer "brand_id",                    :null => false
    t.string  "product_name", :limit => 250, :null => false
    t.string  "image_name",   :limit => 200, :null => false
    t.string  "prod_color",   :limit => 100, :null => false
    t.string  "price",        :limit => 250, :null => false
    t.string  "size",         :limit => 100, :null => false
    t.text    "description",                 :null => false
    t.string  "featured",     :limit => 0,   :null => false
    t.string  "popular",      :limit => 0,   :null => false
    t.integer "top_sales",                   :null => false
    t.date    "add_date",                    :null => false
    t.integer "user_id",                     :null => false
    t.string  "status",       :limit => 0,   :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "prod_name",        :limit => 250, :null => false
    t.string   "prod_url",         :limit => 250, :null => false
    t.string   "prod_img",         :limit => 250
    t.string   "prod_price",       :limit => 200, :null => false
    t.text     "prod_desc"
    t.text     "thumb_img"
    t.string   "prod_status",      :limit => 0
    t.integer  "category_id",                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
    t.string   "mini_infos"
  end

  create_table "testimonials", :primary_key => "test_id", :force => true do |t|
    t.text    "testimonial",                :null => false
    t.string  "test_name",   :limit => 200, :null => false
    t.string  "test_add",    :limit => 200, :null => false
    t.date    "test_date",                  :null => false
    t.string  "status",      :limit => 0,   :null => false
    t.integer "user_id",                    :null => false
  end

  create_table "user_master", :primary_key => "user_id", :force => true do |t|
    t.string   "email",                       :null => false
    t.string   "user_name",                   :null => false
    t.string   "first_name",                  :null => false
    t.string   "last_name",                   :null => false
    t.string   "image",                       :null => false
    t.string   "pwd",                         :null => false
    t.string   "pwd_change",   :limit => 250, :null => false
    t.string   "address",                     :null => false
    t.string   "country",      :limit => 50,  :null => false
    t.string   "state",        :limit => 50,  :null => false
    t.string   "city",                        :null => false
    t.integer  "post_code",                   :null => false
    t.integer  "phone",                       :null => false
    t.datetime "last_login",                  :null => false
    t.date     "member_since",                :null => false
    t.string   "verify",       :limit => 0,   :null => false
    t.string   "status",       :limit => 0,   :null => false
  end

  create_table "user_messages", :force => true do |t|
    t.string  "message", :null => false
    t.integer "user_id", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "roles_mask"
    t.string   "address"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zipcode"
    t.boolean  "active"
  end

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
