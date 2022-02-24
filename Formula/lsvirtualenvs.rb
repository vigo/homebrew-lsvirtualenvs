class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "678654034a9369880c37b5be7ac7fc746413d5cbb5231f6e7ac7d85beb19cd7d"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    require "open3"
    Open3.popen3("#{bin}/lsvirtualenvs", "-version") do |stdin, stdout, _|
      stdin.close
      assert_equal "0.2.0", stdout.read.strip
    end
  end
end
