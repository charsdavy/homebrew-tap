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
      sha256 "1fe904d58a3d8de54c81ac1e310638591141bf3ab5871063271c478a319c3c61"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-darwin-x64.tar.gz"
      sha256 "8e6dec7c2d0404d9f4e7c719431edf6be52f6597d038898f8a767c9d7cfc709d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-linux-arm64.tar.gz"
      sha256 "b427f037d026a97721b9c991d9c18e578328bd841c7f35709880d9e905ad6c16"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.2/deepseek-v0.4.2-linux-x64.tar.gz"
      sha256 "9ad62ff57935d493af11eaaab90f57f1f57b2eb96d895726e49e12300443e60e"
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
