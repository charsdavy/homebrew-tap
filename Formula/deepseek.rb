class Deepseek < Formula
  desc "Agentic command-line AI coding assistant powered by DeepSeek"
  homepage "https://github.com/charsdavy/deepseek-cli"
  version "0.5.1"
  license "MIT"
  head "https://github.com/charsdavy/deepseek-cli.git", branch: "main"

  # Livecheck: probe the GitHub releases for the latest tag.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.1/deepseek-v0.5.1-darwin-arm64.tar.gz"
      sha256 "71d4d6613b883027333b1812224d1267ad7e5215e5b4260baac23b4e83a6b9cf"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.1/deepseek-v0.5.1-darwin-x64.tar.gz"
      sha256 "e8919d0ec98f9aef6488ad9581276e1d6344ef018ba07db5a466128f1386a971"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.1/deepseek-v0.5.1-linux-arm64.tar.gz"
      sha256 "9b32bc2d68aa527d3577acd2cd899cf569ce0afb64770ab59fb852161e54aeff"
    end
    on_intel do
      url "https://github.com/charsdavy/deepseek-cli/releases/download/v0.5.1/deepseek-v0.5.1-linux-x64.tar.gz"
      sha256 "191f36398b1e6c849fb84c423cb6ff80873007727cbb8262d085022192f587fb"
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
