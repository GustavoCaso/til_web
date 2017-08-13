class TilWeb::Application
  route 'authors' do |r|
    r.get 'new' do
      r.view 'authors.new'
    end

    r.is do
      r.post do
        r.resolve 'operations.authors.create' do |create_til|
          create_til.call(r[:author]) do |m|
            m.success do |author|
              flash[:success] = 'Your account has been created successfully'
              session[:author_id] = author[:id]
              r.redirect 'tils'
            end

            m.failure do |errors|
              r.view 'authors.new', errors: errors
            end
          end
        end
      end
    end

    r.logged do
      r.on ':id' do |id|
        r.is do
          r.get do
            r.view 'authors.show', id: id
          end

          r.put do
            r.resolve('operations.authors.update') do |update|
              update.call(id, r[:author]) do |m|
                m.success do
                  r.redirect id.to_s
                end

                m.failure do |errors|
                  r.view 'authors.edit', id: id, errors: errors
                end
              end
            end
          end
        end

        r.get 'edit' do
          r.view 'authors.edit', id: id
        end
      end
    end
  end
end
