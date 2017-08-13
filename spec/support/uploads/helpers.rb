module Test
  module UploadsHelpers
    module_function

    def uploader
      TilWeb::Container['uploads.uploader']
    end

    def upload_image(file_name)
      u = uploader.new(:store)
      attacher = uploader::Attacher.new(OpenStruct.new, :avatar)
      attacher.assign(File.open(fixture_path(file_name)))
      result = u.upload(attacher.get, action: :store)
      data = result.each_with_object({}) do |(key, value), r|
        r[key] = value.data
      end
      data.to_json
    end
  end
end
