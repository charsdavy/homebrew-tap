class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.0"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.0/deepseek-v0.4.0-darwin-arm64.tar.gz"
      sha256 "be8c57e22af70ca1307474c1e9f0b5f8c3f692a8399bb7e95a611cf96e7a75dd"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.0/deepseek-v0.4.0-darwin-x64.tar.gz"
      sha256 "d9b8102e163bed64e06f103b4d126f586957a732d61a712084e9d5ff673e77c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.0/deepseek-v0.4.0-linux-arm64.tar.gz"
      sha256 "4d09e03cd2e51abf3f6b112f44b12a53132bafb4c700238c7d2b873fdf4e307d"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.0/deepseek-v0.4.0-linux-x64.tar.gz"
      sha256 "05a3b0d2a00cb03f17071b649935a816fca1b47c3817d692fd9e1e40a5bbb83d"
    end
  end

  # Each tarball unpacks a single `deepseek` binary (Bun --compile output,
  # 60–80 MB self-contained). Rename-less bin.install keeps things simple.
  def install
    bin.install "deepseek"
  end

  def caveats
    <<~EOS
      Run `deepseek auth` once to configure your DeepSeek API key.
      Then `deepseek` starts an interactive agentic session.
    EOS
  end

  test do
    assert_match "deepseek #{version}", shell_output("#{bin}/deepseek --version")
  end
end
