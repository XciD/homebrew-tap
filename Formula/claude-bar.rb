class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.4.5.tar.gz"
  sha256 "99591380d5eace3abc6d00f74af47571f10979ce47246d97db084272b0b2789f"
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
