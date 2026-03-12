class ClaudeBar < Formula
  desc "macOS menu bar app for monitoring Claude API usage"
  homepage "https://github.com/XciD/claude-bar"
  url "https://github.com/XciD/claude-bar/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "9ea8a6470089df7e9a5bc7b7f6cbd3dcff175f649acd850c35aea8f74eb2b827"
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
