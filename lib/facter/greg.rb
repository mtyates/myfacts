# Fact: greg
#
# Notes:
#   None
require 'facter'
Facter.add('fact_Registry') do
  confine :osfamily => :windows
  setcode do
    value = nil
    Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Puppet Labs\Puppet\RememberInstallDir') do |regkey|
      value = regkey['RememberInstallDir']
    end
    value
  end
end
