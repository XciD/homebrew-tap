class EsCli < Formula
  desc "CLI tool for querying Elasticsearch"
  homepage "https://github.com/XciD/es-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v0.2.2/es-cli-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "103068fcb69ccf278c3582b10cfe14869dd40e7dd95d60161d5b6399c263056e"
    else
      url "https://github.com/XciD/es-cli/releases/download/v0.2.2/es-cli-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "fe6e7a5fd3585f7de4c1fc6d5c76c9fe3b36ab57a9b224f9f850298533cab4d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v0.2.2/es-cli-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba4fa6af8940e00b8f40095225dff267b60c1bfb1a3797419576ebdeef6abb0d"
    else
      url "https://github.com/XciD/es-cli/releases/download/v0.2.2/es-cli-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b5690b21cfc23be77383253a2b1c1e37c1ef0ad420bf4c5dbfe8b8961a321ff"
    end
  end

  def install
    bin.install "es-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/es-cli --version")
  end
end
