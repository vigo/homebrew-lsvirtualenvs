class Lsvirtualenvs < Formula
  desc "Small command-line tool for `virtualenvwrapper`"
  homepage "https://github.com/vigo/lsvirtualenvs"
  url "https://github.com/vigo/lsvirtualenvs/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "545d55557845e4fce38f10f7f60878e915100826c2e7928bed20bc3927bb0249"
  license "MIT"

  bottle do
    root_url "https://github.com/vigo/homebrew-lsvirtualenvs/releases/download/lsvirtualenvs-0.3.2"
    sha256 cellar: :any_skip_relocation, big_sur:      "a5a37aa68169d6c8342e94d353273d00d2c787aca2e65d7a9104d15df4a94006"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "f2ada99fe1d6e487d40fa25211c377537c107e7ee93ec2f43bdb54cfa994f472"
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
