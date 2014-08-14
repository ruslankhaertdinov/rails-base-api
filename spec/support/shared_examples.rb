shared_examples 'a correct error' do
  it 'returns correct message error' do
    expect(error.message).to eq message
  end
end
