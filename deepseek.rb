class Deepseek < Formula
  desc "A powerful command-line interface for DeepSeek API"
  homepage "https://github.com/charsdavy/deepseek-cli"

  # Replace with the tar.gz download link copied from your GitHub Release
  url "https://github.com/charsdavy/deepseek-cli/releases/download/0.2/deepseek-mac.tar.gz"

  # Replace with the SHA256 hash calculated via `shasum -a 256`
  sha256 "1c522b799f62ea5dc4667e52ebabbda9b65de7384df908e98560fbd438382950"

  version "0.2"

  def install
    bin.install "deepseek"
  end

  def caveats
    <<~EOS
      🎉 DeepSeek CLI installed successfully!

      To get started, you can configure your API Key interactively by running:
        deepseek auth

      Run `deepseek -h` to view the help menu.
    EOS
  end
end