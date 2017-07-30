require "db_spec_helper"
require "til_web/view/context"

RSpec.describe TilWeb::View::Context do
  subject {
    described_class.new(
      fullpath: "/",
      csrf_metatag: -> { "" },
      csrf_tag: -> { "" },
      csrf_token: -> { "" },
      flash: {},
    )
  }

  let(:author) { Factory[:author] }


  context 'without authorized' do
    it "#logged_in?" do
      expect(subject).to_not be_logged_in
    end

    it "do not respond to #current_user" do
      expect(subject.respond_to?(:current_user)).to eq false
    end
  end

  context 'with authorization' do
    let(:context) { subject.authorized(author) }

    it "#logged_in?" do
      expect(context).to be_logged_in
    end

    it "respond to #current_user" do
      expect(context.current_user).to eq author
    end
  end
end
