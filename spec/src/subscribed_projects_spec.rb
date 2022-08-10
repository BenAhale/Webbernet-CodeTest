require "rails_helper"

RSpec.describe SubscribedProjects do
  subject                   { described_class.new(project) }
  let(:project)             { create(:project, :with_team) }
  let(:prompt_subscription) { create(:prompt_subscription, project: subscribed_project) }
  let(:subscribed_project)  { create(:project, :with_team) }

  describe '.run' do
    before do
      create(:internal_prompt_subscription,
             :with_invitation_token,
             project: project,
             prompt_subscription: prompt_subscription
            )
    end

    context "when the prompt subscription is deleted" do
      before do
        prompt_subscription.update(deleted: true)
      end
      it "returns subscribed projects" do
        expect(subject.run).to eq([])
      end
    end

    context "when the prompt subscription is NOT deleted" do
      it "returns subscribed projects" do
        expect(subject.run).to eq([subscribed_project])
      end

    end

    context 'when the associated project is not active anymore' do
      before do
        create(:internal_prompt_subscription,
               :with_invitation_token,
               project: project,
               prompt_subscription: prompt_subscription
              )
        subscribed_project.update(active: false)
      end

      it "does not return the projects" do
        expect(subject.run).to eq([])
      end
    end
  end
end
