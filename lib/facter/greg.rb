# Fact: greg
#
# Notes:
#   None
require 'facter'
Facter.add('custom_fact_Registry') do
  confine :osfamily => :windows
  setcode do
    value = nil
    Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Microsoft\Windows NT\CurrentVersion') do |regkey|
      value = regkey['EditionID']
    end
    value
  end
end
