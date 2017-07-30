class TilWeb::Application
  route 'authors' do |r|
    r.is do
      r.post do
        r.resolve 'operations.authors.create' do |create_til|
          create_til.(r[:author]) do |m|
            m.success do
              flash[:success] = "Your account has been created successfully"
              r.redirect "tils"
            end

            m.failure do |validation|
              r.view 'authors.new', errors: validation.messages
            end
          end
        end
      end
    end

    r.get 'new' do
      r.view 'authors.new'
    end
  end
end
