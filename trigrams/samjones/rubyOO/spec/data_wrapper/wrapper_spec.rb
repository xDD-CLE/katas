require 'data_wrapper/hash_wrapper'
require 'data_wrapper/dbm_wrapper'

[
	HashWrapper,
	DBMWrapper
].each do |clazz|
	describe "#{clazz.name}" do
		it "should store an Array value" do
			key = "key"
			value = ["foo", "bar"]

			wrapper = clazz.new
			wrapper[key] = value

			expect(wrapper[key]).to eq(value)
		end

		it "should return keys" do
			wrapper = clazz.new

			keys = ['foo', 'bar'].each do |key|
				wrapper[key] = Random.rand(10)
			end

			expect(wrapper.keys).to eq(keys)
		end

		it "should tell me if it has a key" do
			key = 'foo'

			wrapper = clazz.new

			wrapper[key] = 'bar'

			expect(wrapper.has_key?(key)).to eq(true)
			expect(wrapper.has_key?('bar')).to eq(false)
		end
	end
end
