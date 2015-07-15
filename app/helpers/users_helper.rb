module UsersHelper
  def gravatar_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mm&&s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "img-responsive center-block")
  end

  def gravatarques_for(user, size)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mm&&s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "img-responsive pull-left", style: "margin-right:10px;")
  end
end
