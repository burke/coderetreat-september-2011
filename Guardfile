guard :rspec, :version => 2, :all_on_start => true, :all_after_pass => false, :keep_failed => false, :cli => '--format doc --color' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { "spec" } 
  watch('spec/spec_helper.rb')  { "spec" }
end
