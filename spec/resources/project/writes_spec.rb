require 'rails_helper'

RSpec.describe ProjectResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'projects',
          attributes: attributes_for(:project)
        }
      }
    end

    let(:instance) do
      ProjectResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Project.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:project) { create(:project) }

    let(:payload) do
      {
        data: {
          id: project.id.to_s,
          type: 'projects',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ProjectResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { project.reload.updated_at }
      # .and change { project.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:project) { create(:project) }

    let(:instance) do
      ProjectResource.find(id: project.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Project.count }.by(-1)
    end
  end
end
