require 'spec_helper'

describe Metscola::Parser do
  describe 'parser' do
    it 'be success' do
      log = '2016-12-03T19:23:44+09:00	debug.test	{"messages":"Started HEAD \"/?p=9\" for ::1 at 2016-12-03 19:23:44 +0900\nProcessing by Rails::WelcomeController#index as */*\n  Parameters: {\"p\"=>\"9\", \"internal\"=>true}\n  Rendering /Users/koji/.rvm/gems/ruby-2.3.1/gems/railties-5.0.0.1/lib/rails/templates/rails/welcome/index.html.erb\n  Rendered /Users/koji/.rvm/gems/ruby-2.3.1/gems/railties-5.0.0.1/lib/rails/templates/rails/welcome/index.html.erb (3.2ms)\nCompleted 200 OK in 41ms (Views: 22.4ms | ActiveRecord: 0.0ms)\n\n","debug":"INFO","h":"localhost","mt":"HEAD","pt":"/?p=9","ip":"::1","ua":"curl/7.43.0","rf":null}'
      parser = Metscola::Parser.new(log)
      expect(parser.mss).to eq([
        ["Views", "22.4"], ["ActiveRecord", "0.0"]
      ])
      expect(parser.path).to eq('/?p=9')
    end
  end
end
