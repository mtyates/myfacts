#!/usr/bin/ruby
#
#

Facter.add('fact_registry') do
  confine :kernel => :windows
  
  fact_registry = 'broke_code'
  begin
    
    if RUBY_PLATFORM.downcase.include?('mswin') or RUBY_PLATFORM.downcase.include?('mingw32')
      require 'win32/registry'
      Win32::Registry::HKEY_LOCAL_MACHINE.open('SOFTWARE\Microsoft\Windows NT\CurrentVersion') do |regkey|
         fact_registry = regkey['ProductName']
      end
    end
  rescue
  end

  setcode do
    fact_registry
  end
end
