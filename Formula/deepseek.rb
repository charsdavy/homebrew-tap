class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.5"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.5/deepseek-v0.4.5-darwin-arm64.tar.gz"
      sha256 "ce3a852cfbe56373822f96626c2b6920d61083116ea75170222b3814b5c5d268"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.5/deepseek-v0.4.5-darwin-x64.tar.gz"
      sha256 "610c708bb86a9dffb259cef3ad6d1c30c70026c43c3f9530265ebed8cb633e2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.5/deepseek-v0.4.5-linux-arm64.tar.gz"
      sha256 "0630a2753cc78c67ced9544450f50b0c37b9be3bcb8938688b35d8bcbaabc250"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.5/deepseek-v0.4.5-linux-x64.tar.gz"
      sha256 "a4574e415523d8d872195a04a6891475254de89743bfe06e37e2052962f8d13f"
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
