class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.4.4.tar.gz"
  sha256 "94f47ffd0c290b6152051a4b555bc16ebd7edff4fbb583b22b5388a1dade033d"
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
