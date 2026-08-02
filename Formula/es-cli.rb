class EsCli < Formula
  desc "CLI tool for querying Elasticsearch"
  homepage "https://github.com/XciD/es-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v0.2.3/es-cli-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "95c134f3536e186796e648ead887db466181d13787989e12241154929044017e"
    else
      url "https://github.com/XciD/es-cli/releases/download/v0.2.3/es-cli-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "e0856a525916fc751f7b0c0b348b9a97fc9b7fa24e349999db72e5645ba6c009"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/XciD/es-cli/releases/download/v0.2.3/es-cli-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6467cffb203d8cf3ffc4aa644b1497c500f9a5f28f3a6ce3ce45de233488315"
    else
      url "https://github.com/XciD/es-cli/releases/download/v0.2.3/es-cli-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1033925b137b05e69365032f6a2c507eff05ec7a8a112a15b20b2edfb664c5ae"
    end
  end

  def install
    bin.install "es-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/es-cli --version")
  end
end
