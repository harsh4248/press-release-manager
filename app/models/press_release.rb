class PressRelease < ApplicationRecord
  belongs_to :user
  belongs_to :publisher
  belongs_to :organization

  # after_create_commit -> { broadcast_append_to "press_releases" }
  after_create_commit -> {
  broadcast_prepend_to "press_releases", partial: "press_releases/press_release", locals: { press_release: self }
}
  after_update_commit -> { broadcast_replace_to "press_releases", partial: "press_releases/press_release", locals: { press_release: self } }
  after_destroy_commit -> { broadcast_remove_to "press_releases" }

  validates :title, presence: true
  validates :content, presence: true
end
