class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9d14a9d2089c93de10fd2c88be77cea0daaa4d9c90b59e3e9640a5ea08950e97"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    prefix.install "build/ClaudeUsageBar.app"
  end

  def post_install
    mkdir_p "#{Dir.home}/Applications"
    ln_sf "#{prefix}/ClaudeUsageBar.app", "#{Dir.home}/Applications/ClaudeUsageBar.app"
  end

  def caveats
    <<~EOS
      ClaudeUsageBar.app has been linked to ~/Applications.

      To start it, run:
        open ~/Applications/ClaudeUsageBar.app

      For Launch at Login support, also link to /Applications:
        ln -sf #{prefix}/ClaudeUsageBar.app /Applications/
    EOS
  end
end
