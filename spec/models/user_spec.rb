require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }
  subject { @user }
    
  it { should be_valid }
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
