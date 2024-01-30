class BirchStandard < Formula
  desc "The Birch probabilistic programming language standard library"
  homepage "http://www.birch-lang.org"
  head "https://github.com/lawmurray/Birch.standard.git"

  depends_on "birch"

  def install
    system "birch", "build", "--prefix=#{prefix}"
    system "birch", "install"
  end
end
