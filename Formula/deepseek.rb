class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.5.2"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.2/deepseek-v0.5.2-darwin-arm64.tar.gz"
      sha256 "b27ec0fd9dccbf8ae9a61e7f34562c329a83d55ad06cfbe92818f2cec5950715"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.2/deepseek-v0.5.2-darwin-x64.tar.gz"
      sha256 "ed182ec6a70e37e42b63c157903470b9a3f4ac420f4a02780051a5b90c8a4fb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.2/deepseek-v0.5.2-linux-arm64.tar.gz"
      sha256 "9296984b01574bec9f2ecc0f3c2f7bc2ea57876b441f0258dd273f897c41d411"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.2/deepseek-v0.5.2-linux-x64.tar.gz"
      sha256 "66edf0a9370b134211151644a773012c1551bd779e171f42386b6e33467f7c53"
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
