# frozen_string_literal: true

PROJECT_PREFIX = "https://github.com/vigo/lsvirtualenvs/archive/refs/tags"

desc "update formula"
task :update_formula, [:version] do |_, args|
  abort "please provide released tag info\n\n\texample: rake update_formula[1.3.1]\n\n" unless args.version

  tag_hash_raw = `curl -sL #{PROJECT_PREFIX}/v#{args.version}.tar.gz | sha256sum`.chomp
  abort "invalid has #{tag_hash_raw}" if tag_hash_raw.empty?

  tag_hash = tag_hash_raw.split.first
  system %Q{
    gsed -i -r 's/v[0-9]+.[0-9]+.[0-9]+.tar.gz/v#{args.version}.tar.gz/' Formula/lsvirtualenvs.rb &&
    gsed -i -r 's/sha256 ".*"/sha256 "#{tag_hash}"/' Formula/lsvirtualenvs.rb &&
    gsed -i -r 's/assert_equal "[0-9]+.[0-9]+.[0-9]+"/assert_equal "#{args.version}"/' Formula/lsvirtualenvs.rb &&
    echo "formula is ready"
    echo "now, add, commit, push, pr, label: pr-pull"
    echo
    echo "git add ."
    echo "git ci -m 'lsvirtualenvs #{args.version} (update)'"
    echo "git push -u origin update"
    echo
  }
end
