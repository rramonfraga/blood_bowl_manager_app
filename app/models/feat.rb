class Feat < ActiveRecord::Base
  belongs_to :user_player
  belongs_to :match

  def self.host_feats
    where(hosts_feat: false).all
  end

  def self.visit_feats
    where(hosts_feat: true).all
  end

end
