class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.4.1"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.1/deepseek-v0.4.1-darwin-arm64.tar.gz"
      sha256 "a91d7a23805143d60d5c8719dac7550ae823a4d989e512d15bba18d81411c854"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.1/deepseek-v0.4.1-darwin-x64.tar.gz"
      sha256 "966d70809ff79b6d3cbfcaa3dc8baa6befa6de95f55d9c37556d055143ed8e45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.1/deepseek-v0.4.1-linux-arm64.tar.gz"
      sha256 "f0094504d8ed15d3383f45b9991871c98a1feea117431cd4d7a30675af4159d4"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.1/deepseek-v0.4.1-linux-x64.tar.gz"
      sha256 "fb2354c101e3a9ddc9af925d61fb33593e3aa90b5b4fbb81f2f25fbea7ef53af"
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
