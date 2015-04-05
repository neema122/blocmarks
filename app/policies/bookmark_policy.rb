class BookmarkPolicy < ApplicationPolicy
  def update?
    user.present? && (record.topic.user == user)
  end

  def destroy?
    update?
  end
end