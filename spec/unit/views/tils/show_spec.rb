require "db_spec_helper"
require "til_web/views/tils/show"
require "til_web/view/context"

RSpec.describe TilWeb::Views::Tils::Show, "#call", type: :view do
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

  let(:til) { Factory[:til, title: "What's up", id: 1] }

  let(:html) { view.(context: context, id: til.id) }
  let(:page) { Capybara.string(html) }


  it "renders the til" do
    expect(page).to have_selector ".article:nth-of-type(1) h1", text: "What's up"
  end
end
