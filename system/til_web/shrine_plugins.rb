module Shrine::Plugins::Rom
  def self.configure(uploader, opts = {})
    uploader.opts[:rom_repository] = opts.fetch(:repository)
  end

  module AttacherClassMethods
    def find_record(record_class, record_id)
      rom_repository(record_class)[record_id]
    end

    def rom_repository(record_class)
      repo_name = record_class.to_s.split('::').last.downcase
      shrine_class.opts[:rom_repository].call("#{repo_name}s")
    end
  end

  module AttacherMethods
    private

    def update(uploaded_file)
      super
      context[:record] = rom_repository.update(record.id, "#{name}_data": read)
    end

    def rom_repository
      self.class.rom_repository(record.class)
    end
  end
end
