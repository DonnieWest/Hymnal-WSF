module SongsHelper
  def raw(stringish)
    stringish.to_s.html_safe
  end
end
