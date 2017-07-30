class TilWeb::Application
  route 'login' do |r|
    r.is do
      r.get do
        r.view 'sessions.new'
      end

      r.post do
        r.resolve 'operations.authentication.authenticate' do |authenticate|
          authenticate.(r[:login]["email"], r[:login]["password"]) do |m|
            m.success do |author|
              flash[:success] = "You have logged in successfuly"
              session[:author_id] = author.id
              r.redirect "tils"
            end

            m.failure do
              flash[:error] = "Invalid credentials please check you have correct values"
              r.redirect "login"
            end
          end
        end
      end
    end
  end
end
