module FullCallsHelper
  def clean_oxford(term)
    term.gsub(/\[/, '').gsub(/\]/, '').split(/",/).each do |string|
      string.gsub(/"/, '')
    end
  end
end
