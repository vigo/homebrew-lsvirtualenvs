class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a59e1b428ba5c6f88b14f42d8621dd016b4c08de7d9e7b82b3b78debbd97e0e6"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/lsvirtualenvs -version 2>&1", 2)
  end
end
