class Dice
  class << self
    def six
      dice.rand(6) + 1
    end

    def two_six
      [six, six]
    end

    def eight
      dice.rand(8) + 1
    end

    def twelve
      dice.rand(12) + 1
    end

    def twenty
      dice.rand(20) + 1
    end

    private
    def dice
      @dice ||= Random.new
    end
  end
end