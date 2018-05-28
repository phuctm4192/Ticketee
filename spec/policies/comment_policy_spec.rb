require 'rails_helper'

RSpec.describe CommentPolicy do
  context "permissions" do
    subject { CommentPolicy.new(user, comment) }

    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) { FactoryGirl.create(:ticket, project: project, author: User.new) }
    let(:comment) { FactoryGirl.create(:comment, ticket: ticket, author: User.new) }

    context "for anonymous users" do
      let(:user) { nil }
      it { should_not permit_action :create }
    end

    context "for viewers of the projects" do
      before { assign_role!(user, :viewer, project) }
      it { should_not permit_action :create }
    end

    context "for editors of the projects" do
      before { assign_role!(user, :editor, project) }
      it { should permit_action :create }
    end

    context "for managers of the projects" do
      before { assign_role!(user, :manager, project) }
      it { should permit_action :create }
    end

    context "for managers of the other projects" do
      before do
        assign_role!(user, :manager, FactoryGirl.create(:project))
      end
      it { should_not permit_action :create }
    end

    context "for administrators" do
      let(:user) { FactoryGirl.create(:user, :admin) }
      it { should permit_action :create }
    end
  end

end
