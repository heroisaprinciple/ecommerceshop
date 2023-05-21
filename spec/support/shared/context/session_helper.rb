RSpec.shared_context :authorize_user do
  let(:current_user) { create(:user) }

  before { sign_in current_user }
end