require 'rails_helper'

RSpec.describe TagResource, type: :resource do
  describe 'serialization' do
    let!(:tag) { create(:tag) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(tag.id)
      expect(data.jsonapi_type).to eq('tags')
    end
  end

  describe 'filtering' do
    let!(:tag1) { create(:tag) }
    let!(:tag2) { create(:tag) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: tag2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([tag2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:tag1) { create(:tag) }
      let!(:tag2) { create(:tag) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            tag1.id,
            tag2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            tag2.id,
            tag1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
