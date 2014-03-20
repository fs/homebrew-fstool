require "formula"

class FsTool < Formula
  homepage "http://fs.github.io/fs-tool/"
  version "1.5.0"

  url "https://github.com/fs/fs-tool/archive/1.5.0.tar.gz"
  sha1 "90118353b01f3bfe9dbfab08b4277a8ca68a9512"

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
