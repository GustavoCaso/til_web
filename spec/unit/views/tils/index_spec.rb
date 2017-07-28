require "db_spec_helper"
require "til_web/views/tils/index"
require "til_web/view/context"

RSpec.describe TilWeb::Views::Tils::Index, "#call", type: :view do
  subject(:view) { described_class.new }

  let(:context) {
    TilWeb::View::Context.new(
      fullpath: "/",
      csrf_metatag: -> { "" },
      csrf_tag: -> { "" },
      csrf_token: -> { "" },
      flash: {},
    )
  }

  let(:html) { view.(context: context) }
  let(:page) { Capybara.string(html) }

  before do
    Factory[:til, title: "What's up"]
    Factory[:til, title: "Hello"]
  end


  it "renders the til" do
    expect(page).to have_selector ".article:nth-of-type(1) h2", text: "What's up"
    expect(page).to have_selector ".article:nth-of-type(2) h2", text: "Hello"
  end
end
