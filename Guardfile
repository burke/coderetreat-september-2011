guard :rspec, :version => 2, :all_on_start => false, :all_after_pass => false, :keep_failed => false, :cli => '--format doc --color' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end
