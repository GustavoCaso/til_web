require "db_spec_helper"
require "til_web/views/authors/new"
require "til_web/view/context"

RSpec.describe TilWeb::Views::Authors::New, "#call", type: :view do
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

  let(:html) { view.(context: context, **dependecies) }
  let(:page) { Capybara.string(html) }


  context 'without errors' do
    let(:dependecies) { {} }
    it "renders the form" do
      expect(page).to_not have_selector('.error')
      expect(page).to have_selector "form"
    end
  end

  context 'with errors' do
    let(:dependecies) { {errors: ['I fail at university']} }
    it "renders the form and display the errors" do
      expect(page).to have_selector('.error', text: 'I fail at university')
      expect(page).to have_selector "form"
    end
  end
end
