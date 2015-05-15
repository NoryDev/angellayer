class TeamMember < ActiveRecord::Base
  belongs_to :investor_profile

  validates :investor_profile, :first_name, :last_name, presence: true

  def name
    [first_name, last_name].reject(&:blank?).join(' ')
  end
end
