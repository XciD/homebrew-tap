class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.4.3.tar.gz"
  sha256 "1e3ac27f4e59469ea46c82256b4508075f5906e770af7d8eee59b0dce587d35c"
  license "MIT"

  depends_on :macos

  def install
    system "make"
    prefix.install "build/ClaudeUsageBar.app"
  end

  def caveats
    <<~EOS
      Copy to /Applications (required for Launch at Login and app icon):
        cp -R #{opt_prefix}/ClaudeUsageBar.app /Applications/

      Then start it with:
        open /Applications/ClaudeUsageBar.app
    EOS
  end
end
