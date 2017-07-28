class TilWeb::Application
  route 'tils' do |r|
    r.is do
      r.get do
        r.view 'tils.index'
      end

      r.post do
        r.resolve 'operations.tils.create' do |create_til|
          create_til.(r[:til]) do |m|
            m.success do
              r.redirect "tils"
            end

            m.failure do |validation|
              r.view 'tils.new', errors: validation.messages
            end
          end
        end
      end
    end

    r.get 'new' do
      r.view 'tils.new'
    end
  end
end