class Birch < Formula

  desc "The Birch probabilistic programming language"
  homepage "http://www.birch-lang.org"
  head "https://github.com/lawmurray/Birch.git"

  depends_on "autogen"
  depends_on "automake"
  depends_on "libtool"
  depends_on "flex"
  depends_on "bison"
  depends_on "libyaml"
  depends_on "boost"
  depends_on "eigen"

  env :std

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
