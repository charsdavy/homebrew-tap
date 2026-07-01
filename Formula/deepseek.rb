class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.2"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-darwin-arm64.tar.gz"
      sha256 "3b2c1d5b773f71654b705f638aaad8336c8b5461d99111874666306ea1d42f5f"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-darwin-x64.tar.gz"
      sha256 "bf22178210598cc4d27b988b81c3a70ff6477b86e2d19ddce9bc695c24f20497"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-linux-arm64.tar.gz"
      sha256 "7cc87c8f3ffff7c12398d64e54231f8fdd710727447f8bf734a82f53bbfbd8a9"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-linux-x64.tar.gz"
      sha256 "d388449abd0a13ce60b09b2e3a3af0cdaf155cd592562f5dccab33c5bc46d997"
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
