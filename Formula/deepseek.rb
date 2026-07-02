class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.3"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.3/deepseek-v0.4.3-darwin-arm64.tar.gz"
      sha256 "597b5ef24a2038ab4464a2e1d9b0be6c68a97b61512591cb743b24e03cf9d161"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.3/deepseek-v0.4.3-darwin-x64.tar.gz"
      sha256 "6f31628bdc20be36e4f80e7aafdeddc762fa550a968d69a4fc859d0f58606f54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.3/deepseek-v0.4.3-linux-arm64.tar.gz"
      sha256 "d89a8a88aaad7adb79972a12644a778479d0e11cd96fa00dcef70d63292313df"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.3/deepseek-v0.4.3-linux-x64.tar.gz"
      sha256 "33bac3b2b11b8c4c2f02623a2d189a60f38c1b5fa386cbacdc3a58c874ccfc7b"
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
