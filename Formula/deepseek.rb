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
      sha256 "71fe570dc3517ec24109e803cb55629cb5dd59810dd7e0967fbb211ada841d0e"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-darwin-x64.tar.gz"
      sha256 "a025b80636b69b26de9cc6a23b8b13b5780918c7359254f250e975b9d6e46f7d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-arm64.tar.gz"
      sha256 "2c672c4ce1fd33235e8bb1dffaa3da07b0917c5ddd05368cec623fe8066f79ee"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-x64.tar.gz"
      sha256 "1662c7b5396a15aa16b1e1b9ce24ce36ff3732fadebf22158f67d40ac3d87672"
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
