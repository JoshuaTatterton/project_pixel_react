class Graffiti < ActiveRecord::Base

  validate :valid_drawing?

  private

  def valid_drawing?

  end

end
