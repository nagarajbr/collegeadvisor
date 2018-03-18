class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else 
        scope.where("created_by = ?", current_user.id)
      end
    end
  end

  def update?
    user.admin? #or not post.published?
  end
end