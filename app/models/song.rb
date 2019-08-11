class Song < ApplicationRecord
  validates :title, presence: true
  validate :release_year_exists


  def release_year_exists
    if self.released == true && !self.release_year
      errors.add(:release_year, "Release Year Required")
    end
  end
end
