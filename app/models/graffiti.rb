class Graffiti < ActiveRecord::Base

  validate :valid_drawing_size?

  private

  # Correct size is 31x15
  def valid_drawing_size?
    if drawing.length != 15 || drawing.any? {|b| b.length != 31 }
      errors.add(:base, "drawing dimensions are incorrect")
      return false
    end
  end

end
