class Card

  attr_reader :face_value, :face_up

  def initialize(face_value)
    @face_value = face_value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
    puts @face_value
  end

  def to_s
    @face_value.to_s
  end

  def equals(card)
    @face_value == card.face_value
  end
end
