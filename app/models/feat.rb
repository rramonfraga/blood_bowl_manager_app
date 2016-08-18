class Feat < ActiveRecord::Base
  belongs_to :player
  belongs_to :match

  validates :kind, :player, :match, presence: true

  FEATS = %i(injury complentions touchdowns interceptions mpv).freeze
  POINTS = {"injury" => 2, "complentions" => 1, "touchdowns" => 3, "interceptions" => 2, "mpv" => 5}
  CASUALITIES = [
    '11-38 Badly Hurt (No long term effect)',
    '41 Broken Ribs (Miss next game)',
    '42 Groin Strain (Miss next game)',
    '43 Gouged Eye (Miss next game)',
    '44 Broken Jaw (Miss next game)',
    '45 Fractured Arm (Miss next game)',
    '46 Fractured Leg (Miss next game)',
    '47 Smashed Hand (Miss next game)',
    '48 Pinched Nerve (Miss next game)',
    '51 Damaged Back (Niggling Injury)',
    '52 Smashed Knee (Niggling Injury)',
    '53 Smashed Hip (-1 MA)',
    '54 Smashed Ankle (-1 MA)',
    '55 Serious Concussion (-1 AV)',
    '56 Fractured Skull (-1 AV)',
    '57 Broken Neck (-1 AG)',
    '58 Smashed Collar Bone (-1 ST)',
    '61-68 DEAD (Dead!)'
  ]

  def assign_touchdown(number = 1)
    if touchdown?
      host_team? ? match.host_result += number : match.visit_result += number
      match.save!
    end
  end

  def touchdown?
    kind == "touchdowns"
  end

  def host_team?
    player.team_id == match.host_team_id
  end

  def assign_experience
    player.add_points(POINTS[kind])
  end
end
