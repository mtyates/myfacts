# Fact: greg
#
# Notes:
#   None
require 'facter'
Facter.add('greg') do
  uname_result = nil
  setcode do
    if Facter::Util::Resolution.which('uname')
      uname_cmd = '/bin/uname -o'
      uname_result = Facter::Util::Resolution.exec(uname_cmd)
    end
    uname_result
  end
end
