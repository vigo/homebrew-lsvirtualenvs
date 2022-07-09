class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "545d55557845e4fce38f10f7f60878e915100826c2e7928bed20bc3927bb0249"
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
      assert_equal "0.3.2", stdout.read.strip
    end
  end
end
