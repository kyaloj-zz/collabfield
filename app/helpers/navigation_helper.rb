module NavigationHelper
  def navigation_links_partial
    if user_signed_in?
      'layouts/navigation/signed_in_links'
    else
      'layouts/navigation/signed_out_links'
    end
  end
end