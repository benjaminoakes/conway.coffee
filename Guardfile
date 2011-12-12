# A sample Guardfile
# More info at https://github.com/guard/guard#readme
guard 'shell' do
  watch(%r{^lib/.+\.coffee}) { puts `node_modules/.bin/cake spec` }
  watch(%r{^spec/.+\.spec\.coffee}) { puts `node_modules/.bin/cake spec` }
end
