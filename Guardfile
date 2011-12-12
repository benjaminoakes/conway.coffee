# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard 'shell' do
  watch(%r{^lib/.+\.coffee}) { puts `make test` }
  watch(%r{^spec/.+\.spec\.coffee}) { puts `make test` }
end
