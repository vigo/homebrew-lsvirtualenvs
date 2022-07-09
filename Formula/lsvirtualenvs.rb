class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "7a280d6a22f28a6a261a7ed71dedb60168c6bcc6bc42d1ec01ced8f9017981d7"
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
      assert_equal "0.2.3", stdout.read.strip
    end
  end
end
