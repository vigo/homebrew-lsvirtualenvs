class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "678654034a9369880c37b5be7ac7fc746413d5cbb5231f6e7ac7d85beb19cd7d"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-lsvirtualenvs/releases/download/lsvirtualenvs-0.2.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "786f590351eec9e6322bfcf6b757628c25d7fb88f7d28a6b22418b0c719e02e8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "3b13bacf6f645b19fac3ec483057b67b8678e40a21bcdecf943b09830ccbc39d"
  end

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
