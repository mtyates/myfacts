#!/usr/bin/ruby
#
#
# Written to work out the version of windows that the client is currently being run on.
#
Facter.add('fact_registry') do
  confine :osfamily => :windows
  setcode do
    value = nil
    Win32::Registry::HKEY_LOCAL_MACHINE.open('Software\Puppet Labs\Puppet') do |regkey|
      value = regkey['RememberInstallDir']
    end
    value
  end
end

