class TeamMember < ActiveRecord::Base
  belongs_to :investor_profile

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
