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
      sha256 "9e0d5223d336d7154bc5c9ffa8ed5da1f4aef54acc12a0d0e19aec4d104ee90d"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-darwin-x64.tar.gz"
      sha256 "2d69d3e6b64c0cfbece6ad220315e80854727cc4477213747f4481e71a724201"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-linux-arm64.tar.gz"
      sha256 "5db234c538858af730a15f0c82e8a727fa3e8ff19f350c13c402462abb14ef59"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.0/deepseek-v0.5.0-linux-x64.tar.gz"
      sha256 "d381bb499864f3838c9352a030e658c9f3411c9e29c13147bab016312f0f907f"
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
