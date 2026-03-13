class EsCli < Formula
  desc "CLI tool for querying Elasticsearch"
  homepage "https://github.com/XciD/es-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v#{version}/es-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b2dda17c6de78a5c844439e638155685c7e81eaac9fce9e0c9cd67e8cab6a158"
    else
      url "https://github.com/XciD/es-cli/releases/download/v#{version}/es-cli-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8e9a9f3e9955155392f9327919774c303925f48a165919a92fb4e39bf26bd3a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v#{version}/es-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "700d358e68dd88daffbcd022db8998fc8c7cf9445fe46fae44c313f531804f68"
    else
      url "https://github.com/XciD/es-cli/releases/download/v#{version}/es-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6388223506ca02442864ce7ca16501d014907dcdeb0dcee24604052ee3d2128a"
    end
  end

  def install
    bin.install "es-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/es-cli --version")
  end
end
