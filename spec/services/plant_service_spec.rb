# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'plant service index', type: :request do
  before do
    get '/search', params: { 'search' => 'tomato' }
  end

  it 'returns status code 200', :vcr do
    expect(response).to have_http_status(:success)
  end
end

describe 'plant service show', type: :request do
  before do
    get '/search/details', params: { 'format' => 'tomato' }
  end

  it 'returns status code 200', :vcr do
    expect(response).to have_http_status(:success)
  end
end
