require "formula"

class FsTool < Formula
  homepage "http://fs.github.io/fs-tool/"
  version "1.6.0"

  url "https://github.com/fs/fs-tool/archive/1.6.0.tar.gz"
  sha1 "7e0113112077ee67e4d1fb303057e76c504622ae"

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
