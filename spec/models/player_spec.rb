require 'rails_helper'

RSpec.describe Player, type: :model do
  before { @user = FactoryGirl.build(:player) }
  subject { @user }
  
  it { should be_valid }
  it { should respond_to(:first)}
  it { should respond_to(:last)}
  it { should respond_to(:position)}
  it { should respond_to(:avg)}
  it { should respond_to(:hr)}
  it { should respond_to(:rbi)}
  it { should respond_to(:runs)}
  it { should respond_to(:sb)}
  it { should respond_to(:ops)}
  it { should respond_to(:hits)}
  it { should respond_to(:bats)}
  
  describe "invalid objects" do
    it "it is an invalid object" do
      subject.first = nil
      subject.last = nil
      subject.position = nil
      subject.avg = nil
      subject.hr = nil
      subject.rbi = nil
      subject.runs = nil
      subject.sb = nil
      subject.ops = nil
      subject.hits = nil
      subject.bats = nil
      expect(subject).to_not be_valid
    end
  end
  
  describe "validations" do
    it { is_expected.to validate_presence_of(:first) }
    it { is_expected.to validate_presence_of(:last) }
    it { is_expected.to validate_presence_of(:position) }
    it { is_expected.to validate_presence_of(:avg) }
    it { is_expected.to validate_presence_of(:hr) }
    it { is_expected.to validate_presence_of(:rbi) }
    it { is_expected.to validate_presence_of(:runs) }
    it { is_expected.to validate_presence_of(:sb) }
    it { is_expected.to validate_presence_of(:ops) }
    it { is_expected.to validate_presence_of(:hits) }
    it { is_expected.to validate_presence_of(:bats) }
  end
end
