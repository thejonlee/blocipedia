class WikiPolicy < ApplicationPolicy
  def destroy?
    wiki.user == user || (user.has_role? :admin)
  end
end
