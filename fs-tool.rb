require "formula"

class FsTool < Formula
  homepage "http://fs.github.io/fs-tool/"
  version "1.7.0"

  url "https://github.com/fs/fs-tool/archive/1.7.0.tar.gz"
  sha256 "aee2046c843be1e4055923f06f6ad0f53b1e1393596c070aa2e05569e0289f91"

  def install
    bin.install Dir['bin/**']
    libexec.install Dir['libexec/**']
    share.install Dir['share/**']
    (prefix/'completions').install Dir['completions/**']
  end

  def caveats; <<-EOS.undent
  To enable autocompletion make the following steps:

  Bash users:

    echo 'eval "$(fs init -)"' >> ~/.bash_profile
    exec bash

  Zsh users:

    echo 'eval "$(fs init -)"' >> ~/.zshenv
    source ~/.zshenv

  More information here: https://github.com/fs/fs-tool/blob/master/README.md
    EOS
  end

  test do
    assert_equal `#{bin}/fs h`.split("\n").first, 'Usage: fs h [subcommand]'
  end
end
