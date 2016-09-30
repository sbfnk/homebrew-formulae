class Libbi < Formula
  desc "Bayesian state-space modelling on parallel computer hardware"
  homepage "http://libbi.org"
  url "https://github.com/libbi/LibBi/archive/1.2.0.zip"
  head "https://github.com/libbi/LibBi.git"
  version "1.2.0"
  sha256 "adc52bcdceff3851869fd89eec3504b013993a99cd9ea9c2aed3174675149b9f"

  depends_on "perl"
  depends_on "qrupdate"
  depends_on "netcdf"
  depends_on "gsl"
  depends_on "boost"

  PERL_RESOURCES = []

  def self.perl_resource(val=nil)
    PERL_RESOURCES << val
  end

  INCLUDE_RESOURCES = []

  def self.include_resource(val=nil)
    INCLUDE_RESOURCES << val
  end

  resource "Getopt::ArgvFile" do
    url "http://search.cpan.org/CPAN/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-1.11.tar.gz"
    sha256 "3709aa513ce6fd71d1a55a02e34d2f090017d5350a9bd447005653c9b0835b22"
  end
  perl_resource "Getopt::ArgvFile"

  resource "Carp::Assert" do
    url "http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Carp-Assert-0.21.tar.gz"
    sha256 "924f8e2b4e3cb3d8b26246b5f9c07cdaa4b8800cef345fa0811d72930d73a54e"
  end
  perl_resource "Carp::Assert"

  resource "File::Slurp" do
    url "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-9999.19.tar.gz"
    sha256 "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
  end
  perl_resource "File::Slurp"

  resource "Parse::Yapp" do
    url "http://search.cpan.org/CPAN/authors/id/F/FD/FDESAR/Parse-Yapp-1.05.tar.gz"
    sha256 "228a6cfb483ade811720bb77647900ef359dfc3e071359eb73d39e4a1cc6f22b"
  end
  perl_resource "Parse::Yapp"

  resource "Parse::Lex" do
   url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseLex-2.21.tar.gz"
   sha256 "f55f0a7d1e2a6b806a47840c81c16d505c5c76765cb156e5f5fd703159a4492d"
  end
  perl_resource "Parse::Lex"

  resource "Parse::Template" do
    url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseTemplate-3.08.tar.gz"
    sha256 "3c7734f53999de8351a77cb09631d7a4a0482b6f54bca63d69d5a4eec8686d51"
  end
  perl_resource "Parse::Template"

  resource "Math::Symbolic" do
    url "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz"
    sha256 "a9af979956c4c28683c535b5e5da3cde198c0cac2a11b3c9a129da218b3b9c08"
  end
  perl_resource "Math::Symbolic"

  resource "Parse::RecDescent" do
    url "http://search.cpan.org/CPAN/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967013.tar.gz"
    sha256 "226590d3850cd1678deb0190d5207b3477fb9070a8ca6f18d8999daf44485930"
  end
  perl_resource "Parse::RecDescent"

  resource "File::ShareDir" do
    url "http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/File-ShareDir-1.102.tar.gz"
    sha256 "7c7334b974882587fbd9bc135f6bc04ad197abe99e6f4761953fe9ca88c57411"
  end
  perl_resource "File::ShareDir"

  resource "Class::Inspector" do
    url "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Inspector-1.28.tar.gz"
    sha256 "3ca4b7a3ed1f4cc846c9a3c08f9a6e9ec07a9cbfd92510dea9513db61a923112"
  end
  perl_resource "Class::Inspector"

  resource "Template" do
    url "http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Template-Toolkit-2.26.tar.gz"
    sha256 "e7e1cf36026f1ef96d8233e18a3fb39e1eafe9109edc639ecf25b20651cd76be"
  end
  perl_resource "Template"

  resource "Graph" do
    url "http://search.cpan.org/CPAN/authors/id/J/JH/JHI/Graph-0.9704.tar.gz"
    sha256 "325e8eb07be2d09a909e450c13d3a42dcb2a2e96cc3ac780fe4572a0d80b2a25"
  end
  perl_resource "Graph"

  resource "thrust" do
    url "https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip"
    sha256 "00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d"
  end
  include_resource "thrust"

  def install
    ENV.prepend_path "PATH", Formula["perl"].bin
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.append "CPPFLAGS", "-I#{include}"

    PERL_RESOURCES.each do |r|
      resource(r).stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "test"
        system "make", "install"
      end
    end

    INCLUDE_RESOURCES.each do |r|
      resource(r).stage do
        (include/r).install Dir["*"]
      end
    end

    system "perl", "Makefile.pl", "INSTALL_BASE=#{libexec}"
    system "make"
    system "make", "install"

    bin.install libexec/"bin/libbi"
    bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"], :CPPFLAGS => ENV["CPPFLAGS"])
  end

  test do
    system "#{libexec}/bin/libbi"
  end
end
