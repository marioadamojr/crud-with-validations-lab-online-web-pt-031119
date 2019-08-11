class Song < ApplicationRecord
  validates :title, presence: true
  validate :release_year_exists
  validate :future_release
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
    message: "An Artist Cannot Release More Than One Song of the Same Title in the Same Year"
  }


  :same_title_same_year

  def same_title_same_year

  end

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
