module Support
  module TestHelpers
    module LoginHelper
      def login_user(user)
        fill_login_form(user.email, 'password')
      end

      private

      def fill_login_form(email, password)
        visit login_path
        begin
          fill_in 'email',    with: email
          fill_in 'password', with: password
          click_button 'Login'
        rescue StandardError
          puts 'Error logging in path ' + (current_path.nil? ? '' : current_path)
          begin
            click_link 'Logout'
            fill_login_form(email, password)
          rescue StandardError
            puts 'Could not perform login error fallback!'
          end
        end
      end
    end
  end
end
