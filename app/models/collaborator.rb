class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :wiki

  def self.available(wiki, current_user)
    possible_collaborators = User.all.where.not(id: current_user.id)
    already_taken = wiki.collaborators.map{ |collaborator| User.find_by_id(collaborator.user_id)}
    possible_collaborators - already_taken
  end
end
