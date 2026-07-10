class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.5.0"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-darwin-arm64.tar.gz"
      sha256 "2244f2a1e0d82c50bc6f292e5ecd8c164860a05b6a2ca438f76012151751c55d"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-darwin-x64.tar.gz"
      sha256 "b4c683572ece5bb96ffd7c8b3df2ac61769a685ad9fa2414496771f94bd51a9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-linux-arm64.tar.gz"
      sha256 "10d4732b1a41570c2d9d808ba8aeef2442fcf3c51143496b7672d1218ed99554"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-linux-x64.tar.gz"
      sha256 "302a13681b88227d73e50eac91556fdf1878dcb61cdd63f0809bf2592c7c4fd9"
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
