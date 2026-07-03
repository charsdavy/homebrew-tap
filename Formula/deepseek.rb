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
      sha256 "0f7c5300f479955e9df701b69fe903fdf7ed1ad1c234e15984a9373f96068800"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-darwin-x64.tar.gz"
      sha256 "1992f54e6fde3fd2de6b585d812f3bb340ebb27730d4213771c62ec1fecf1e59"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-arm64.tar.gz"
      sha256 "71adf96035844fe665d0186e97c2932ac76f2a46daedb28e5b5e103ded58e43a"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.4.4/deepseek-v0.4.4-linux-x64.tar.gz"
      sha256 "0499f092b82a8b62503d1f3c9a96cbb1f7e676494a4c4104c21c766408865cf1"
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
