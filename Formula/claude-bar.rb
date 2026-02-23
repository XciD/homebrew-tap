class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "b59e3bbb773863ee5c9ec62d1fc5f0992de592f32e6207d7b863a1c94126ee5c"
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
