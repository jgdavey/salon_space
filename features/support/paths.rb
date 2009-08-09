module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
    when /the new layout page/
      new_layout_path

    when /the new layout page/
      new_layout_path

    when /the signup page/
      signup_path
    when /the login page/
      login_path
    when /logout/
      logout_path
      
    when /the new client page/
      new_client_path
    when /the list of clients page/
      clients_path
    when /the edit page for the client named "([^\"]+)"$/
      edit_client_path(Client.find_by_name($1))

    when /^the list of appointments(?: page)$/
      appointments_path

    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
