class Libbi < Formula
  desc "Bayesian state-space modelling on parallel computer hardware"
  homepage "http://libbi.org"
  url "https://github.com/libbi/LibBi/archive/1.2.0.tar.gz"
  sha256 "57566aff0b752dd55356c21b818295e3a54ad893bc6aff97d267ff7bcf2d0b68"
  head "https://github.com/libbi/LibBi.git"

  depends_on "perl"
  depends_on "qrupdate"
  depends_on "netcdf"
  depends_on "gsl"
  depends_on "boost"

  # disable openmp, currently not working on OSX
  patch :DATA

  resource "Getopt::ArgvFile" do
    url "http://search.cpan.org/CPAN/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-1.11.tar.gz"
    sha256 "3709aa513ce6fd71d1a55a02e34d2f090017d5350a9bd447005653c9b0835b22"
  end

  resource "Carp::Assert" do
    url "http://search.cpan.org/CPAN/authors/id/N/NE/NEILB/Carp-Assert-0.21.tar.gz"
    sha256 "924f8e2b4e3cb3d8b26246b5f9c07cdaa4b8800cef345fa0811d72930d73a54e"
  end

  resource "File::Slurp" do
    url "http://search.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-9999.19.tar.gz"
    sha256 "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
  end

  resource "Parse::Yapp" do
    url "http://search.cpan.org/CPAN/authors/id/F/FD/FDESAR/Parse-Yapp-1.05.tar.gz"
    sha256 "228a6cfb483ade811720bb77647900ef359dfc3e071359eb73d39e4a1cc6f22b"
  end

  resource "Parse::Template" do
    url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseTemplate-3.08.tar.gz"
    sha256 "3c7734f53999de8351a77cb09631d7a4a0482b6f54bca63d69d5a4eec8686d51"
  end

  resource "Parse::Lex" do
    url "http://search.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseLex-2.21.tar.gz"
    sha256 "f55f0a7d1e2a6b806a47840c81c16d505c5c76765cb156e5f5fd703159a4492d"
  end

  resource "Parse::RecDescent" do
    url "http://search.cpan.org/CPAN/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967013.tar.gz"
    sha256 "226590d3850cd1678deb0190d5207b3477fb9070a8ca6f18d8999daf44485930"
  end

  resource "Math::Symbolic" do
    url "http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz"
    sha256 "a9af979956c4c28683c535b5e5da3cde198c0cac2a11b3c9a129da218b3b9c08"
  end

  resource "Class::Inspector" do
    url "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Inspector-1.28.tar.gz"
    sha256 "3ca4b7a3ed1f4cc846c9a3c08f9a6e9ec07a9cbfd92510dea9513db61a923112"
  end

  resource "File::ShareDir" do
    url "http://search.cpan.org/CPAN/authors/id/R/RE/REHSACK/File-ShareDir-1.102.tar.gz"
    sha256 "7c7334b974882587fbd9bc135f6bc04ad197abe99e6f4761953fe9ca88c57411"
  end

  resource "Template" do
    url "http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Template-Toolkit-2.26.tar.gz"
    sha256 "e7e1cf36026f1ef96d8233e18a3fb39e1eafe9109edc639ecf25b20651cd76be"
  end

  resource "Graph" do
    url "http://search.cpan.org/CPAN/authors/id/J/JH/JHI/Graph-0.9704.tar.gz"
    sha256 "325e8eb07be2d09a909e450c13d3a42dcb2a2e96cc3ac780fe4572a0d80b2a25"
  end

  resource "thrust" do
    url "https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip"
    sha256 "00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d"
  end

  def install
    ENV.prepend_path "PATH", Formula["perl"].bin
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.append "CPPFLAGS", "-I#{include}"

    perl_resources = [] << "Getopt::ArgvFile" << "Carp::Assert" << "File::Slurp" << "Parse::Yapp" << "Parse::Template" << "Parse::Lex" << "Parse::RecDescent" << "Math::Symbolic" << "Class::Inspector" << "File::ShareDir" << "Template" << "Graph"
    include_resources = [] << "thrust"

    perl_resources.each do |r|
      resource(r).stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "test"
        system "make", "install"
      end
    end

    include_resources.each do |r|
      resource(r).stage do
        (include/r).install Dir["*"]
      end
    end

    system "perl", "Makefile.pl", "INSTALL_BASE=#{libexec}"
    system "make"
    system "make", "test"
    system "make", "install"

    bin.install libexec/"bin/libbi"
    bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"], :CPPFLAGS => ENV["CPPFLAGS"])
  end

  test do
    system "#{libexec}/bin/libbi"
  end
end

__END__
diff --git a/lib/Bi/Builder.pm b/lib/Bi/Builder.pm
index e60e8b6..68d2f19 100644
--- a/lib/Bi/Builder.pm
+++ b/lib/Bi/Builder.pm
@@ -59,7 +59,7 @@ Enable diagnostic outputs to standard error.
 
 Use single-precision floating point.
 
-=item C<--enable-openmp> (default on)
+=item C<--enable-openmp> (default off)
 
 Use OpenMP multithreading.
 
@@ -139,7 +139,7 @@ sub new {
         _force => 0,
         _warnings => 0,
         _assert => 1,
-        _openmp => 1,
+        _openmp => 0,
         _cuda => 0,
         _gpu_cache => 0,
         _sse => 0,
