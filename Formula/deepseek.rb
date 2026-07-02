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
      sha256 "4fd1f051ac14ff8ebee1ce21f58df529a5b4777e413ea6aec86925bd2c289f2f"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-darwin-x64.tar.gz"
      sha256 "57aaff30b607392266a2e3cf2a40d1b3d31dcfb59be1e9075fe00dfbad240a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-arm64.tar.gz"
      sha256 "9ea7478aa43b6708ed867b66de3101613628d1ce7ee171815de056ecef2f19ba"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-x64.tar.gz"
      sha256 "8977f0354b51ba05a9eceb68ffca3dd4375029c316b3eb142163843709c138a3"
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
