# frozen_string_literal: true

Gem.post_install do
  auto_refresh_file = Pathname('contrib/thyme.1s.sh')
  bitbar_folder = Pathname('~/.bitbar/').expand_path
  FileUtils.cp(auto_refresh_file, bitbar_folder)
end
