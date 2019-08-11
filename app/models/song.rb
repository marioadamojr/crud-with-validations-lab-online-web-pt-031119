class Song < ApplicationRecord
  validates :title, presence: true
  validate :release_year_exists
  validate :future_release

  def release_year_exists
    if self.released == true && !self.release_year
      errors.add(:release_year, "Release Year Required")
    end
  end

  def future_release
    if self.release_year
      if self.release_year > Date.current.year
        errors.add(:release_year, "Release Year Cannot Exceed Current Year")
      end
    end
  end
end
