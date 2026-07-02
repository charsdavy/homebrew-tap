class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.4"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-darwin-arm64.tar.gz"
      sha256 "460c889e0f6bca22cbf6d2886c8b2838aa4824e8aeae0bdec49c712b1fdb578c"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-darwin-x64.tar.gz"
      sha256 "102b249ccf0ae2c2e789e468932ec7d66824e0f9eb073fc5c78e474e46c0c6a0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-arm64.tar.gz"
      sha256 "f05ff1ff24bfa3afb2c0fd343dbd7849b7ea652d25a277dc63e93b30f4550dd2"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-x64.tar.gz"
      sha256 "d868e0501cfdf058088752cf3160fda2786a63bfd56396d7fededbac13abd2ff"
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
