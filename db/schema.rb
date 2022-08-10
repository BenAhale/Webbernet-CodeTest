# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_14_080117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_key", null: false
    t.index ["project_id"], name: "index_categories_on_project_id"
    t.index ["public_key"], name: "index_categories_on_public_key", unique: true
  end

  create_table "commits", force: :cascade do |t|
    t.string "sha", null: false
    t.string "branch", null: false
    t.string "pusher_username"
    t.string "pusher_avatar"
    t.string "link"
    t.bigint "prompt_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_commits_on_prompt_id"
  end

  create_table "customer_user_reference_releases", force: :cascade do |t|
    t.bigint "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "uref_id", null: false
    t.index ["release_id"], name: "index_customer_user_reference_releases_on_release_id"
    t.index ["uref_id"], name: "index_customer_user_reference_releases_on_uref_id"
  end

  create_table "email_prompt_details", force: :cascade do |t|
    t.bigint "prompt_id", null: false
    t.string "to", null: false
    t.string "from", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_id"], name: "index_email_prompt_details_on_prompt_id"
  end

  create_table "email_prompt_subscriptions", force: :cascade do |t|
    t.bigint "prompt_subscription_id", null: false
    t.string "email_prefix_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_prefix_token"], name: "index_email_prompt_subscriptions_on_email_prefix_token", unique: true
    t.index ["prompt_subscription_id"], name: "index_email_prompt_subscriptions_on_prompt_subscription_id"
  end

  create_table "email_subscription_releases", force: :cascade do |t|
    t.bigint "email_subscription_id"
    t.bigint "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_subscription_id"], name: "index_email_subscription_releases_on_email_subscription_id"
    t.index ["release_id"], name: "index_email_subscription_releases_on_release_id"
  end

  create_table "email_subscriptions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "email", null: false
    t.integer "start_from_release_id", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "next_run"
    t.integer "interval_type"
    t.integer "interval_value"
    t.integer "kind", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.index ["next_run"], name: "index_email_subscriptions_on_next_run"
    t.index ["project_id"], name: "index_email_subscriptions_on_project_id"
  end

  create_table "form_prompt_subscription_reminders", force: :cascade do |t|
    t.uuid "form_prompt_subscription_id"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "public_key", null: false
    t.index ["form_prompt_subscription_id"], name: "form_sub_reminders"
    t.index ["public_key"], name: "index_form_prompt_subscription_reminders_on_public_key", unique: true
  end

  create_table "form_prompt_subscriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.bigint "prompt_subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "interval_type"
    t.integer "interval_value"
    t.integer "next_run"
    t.index ["prompt_subscription_id"], name: "index_form_prompt_subscriptions_on_prompt_subscription_id"
  end

  create_table "github_prompt_subscriptions", force: :cascade do |t|
    t.bigint "prompt_subscription_id", null: false
    t.string "branch", null: false
    t.string "hook_url_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prompt_subscription_id"], name: "index_github_prompt_subscriptions_on_prompt_subscription_id"
  end

  create_table "internal_prompt_subscriptions", force: :cascade do |t|
    t.bigint "prompt_subscription_id", null: false
    t.bigint "project_id", null: false
    t.bigint "project_prompt_invitation_token_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_internal_prompt_subscriptions_on_project_id"
    t.index ["project_prompt_invitation_token_id"], name: "index_invitation_prompt_project"
    t.index ["prompt_subscription_id"], name: "index_internal_prompt_subscriptions_on_prompt_subscription_id"
  end

  create_table "project_prompt_invitation_tokens", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "expiry", null: false
    t.boolean "used", default: false, null: false
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_prompt_invitation_tokens_on_project_id"
    t.index ["token"], name: "index_project_prompt_invitation_tokens_on_token", unique: true
  end

  create_table "project_users", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "emails"
    t.string "branch", default: "master", null: false
    t.string "public_key"
    t.boolean "active", default: true, null: false
    t.bigint "team_id"
    t.boolean "public_feed", default: false, null: false
    t.boolean "hide_author", default: false, null: false
    t.index ["public_key"], name: "index_projects_on_public_key", unique: true
    t.index ["team_id"], name: "index_projects_on_team_id"
  end

  create_table "prompt_subscriptions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "kind", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted", default: false, null: false
    t.index ["project_id"], name: "index_prompt_subscriptions_on_project_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.bigint "project_id"
    t.text "body"
    t.text "title", null: false
    t.integer "kind", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "internal_prompt_release_id"
    t.bigint "prompt_subscription_id"
    t.bigint "form_prompt_subscription_reminder_id"
    t.index ["form_prompt_subscription_reminder_id"], name: "index_prompts_on_form_prompt_subscription_reminder_id"
    t.index ["internal_prompt_release_id"], name: "index_prompts_on_internal_prompt_release_id"
    t.index ["project_id"], name: "index_prompts_on_project_id"
    t.index ["prompt_subscription_id"], name: "index_prompts_on_prompt_subscription_id"
  end

  create_table "pull_requests", force: :cascade do |t|
    t.bigint "project_id"
    t.string "sha"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "title"
    t.text "body"
    t.index ["project_id"], name: "index_pull_requests_on_project_id"
  end

  create_table "pushes", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "message", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sha", null: false
    t.string "branch", null: false
    t.integer "status", default: 0, null: false
    t.string "release_title"
    t.text "release_body"
    t.string "pusher_username"
    t.string "pusher_avatar"
    t.integer "released_at"
    t.bigint "release_set_id"
    t.index ["project_id"], name: "index_pushes_on_project_id"
    t.index ["release_set_id"], name: "index_pushes_on_release_set_id"
  end

  create_table "release_reads", force: :cascade do |t|
    t.bigint "release_id", null: false
    t.bigint "uref_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_release_reads_on_release_id"
    t.index ["uref_id"], name: "index_release_reads_on_uref_id"
  end

  create_table "release_sets", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_release_sets_on_project_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title", null: false
    t.integer "status", default: 0, null: false
    t.text "body"
    t.integer "released_at"
    t.bigint "release_set_id"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "push_id"
    t.string "html_body"
    t.bigint "category_id"
    t.boolean "active", default: true, null: false
    t.bigint "user_id", null: false
    t.bigint "prompt_id"
    t.uuid "public_key", default: -> { "gen_random_uuid()" }, null: false
    t.index ["category_id"], name: "index_releases_on_category_id"
    t.index ["project_id"], name: "index_releases_on_project_id"
    t.index ["prompt_id"], name: "index_releases_on_prompt_id"
    t.index ["public_key"], name: "index_releases_on_public_key", unique: true
    t.index ["push_id"], name: "index_releases_on_push_id"
    t.index ["release_set_id"], name: "index_releases_on_release_set_id"
    t.index ["user_id"], name: "index_releases_on_user_id"
  end

  create_table "summaries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "email_subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_subscription_id"], name: "index_summaries_on_email_subscription_id"
  end

  create_table "summary_releases", force: :cascade do |t|
    t.uuid "summary_id", null: false
    t.bigint "release_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_summary_releases_on_release_id"
    t.index ["summary_id"], name: "index_summary_releases_on_summary_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "api_key"
  end

  create_table "urefs", force: :cascade do |t|
    t.string "token", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_urefs_on_project_id"
    t.index ["token", "project_id"], name: "index_urefs_on_token_and_project_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.bigint "team_id"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.boolean "super_user", default: false, null: false
    t.boolean "deleted", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
    t.index ["team_id"], name: "index_users_on_team_id"
  end

  add_foreign_key "categories", "projects"
  add_foreign_key "commits", "prompts"
  add_foreign_key "customer_user_reference_releases", "releases"
  add_foreign_key "email_prompt_details", "prompts"
  add_foreign_key "email_subscription_releases", "email_subscriptions"
  add_foreign_key "email_subscription_releases", "releases"
  add_foreign_key "email_subscriptions", "projects"
  add_foreign_key "form_prompt_subscription_reminders", "form_prompt_subscriptions"
  add_foreign_key "form_prompt_subscriptions", "prompt_subscriptions"
  add_foreign_key "github_prompt_subscriptions", "prompt_subscriptions"
  add_foreign_key "internal_prompt_subscriptions", "project_prompt_invitation_tokens"
  add_foreign_key "internal_prompt_subscriptions", "projects"
  add_foreign_key "internal_prompt_subscriptions", "prompt_subscriptions"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "prompt_subscriptions", "projects"
  add_foreign_key "prompts", "form_prompt_subscription_reminders"
  add_foreign_key "prompts", "releases", column: "internal_prompt_release_id"
  add_foreign_key "pull_requests", "projects"
  add_foreign_key "pushes", "projects"
  add_foreign_key "pushes", "release_sets"
  add_foreign_key "release_reads", "releases"
  add_foreign_key "release_reads", "urefs"
  add_foreign_key "releases", "categories"
  add_foreign_key "releases", "prompts"
  add_foreign_key "releases", "pushes"
  add_foreign_key "releases", "users"
  add_foreign_key "summaries", "email_subscriptions"
  add_foreign_key "summary_releases", "releases"
  add_foreign_key "summary_releases", "summaries"
  add_foreign_key "urefs", "projects"
  add_foreign_key "users", "teams"
end
