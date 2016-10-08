class Libbi < Formula
  desc "Bayesian state-space modelling on parallel computer hardware"
  homepage "http://libbi.org"
  url "https://github.com/libbi/LibBi/archive/1.2.0.tar.gz"
  sha256 "57566aff0b752dd55356c21b818295e3a54ad893bc6aff97d267ff7bcf2d0b68"
  head "https://github.com/libbi/LibBi.git"

  option "without-test", "Disable build-time checking (not recommended)"
  option "without-openmp", "Disable OpenMP"

  depends_on :perl => "5.10"
  depends_on "homebrew/science/qrupdate"
  depends_on "homebrew/science/netcdf"
  depends_on "gsl"
  depends_on "boost"
  depends_on "automake"

  needs :openmp if build.with? "openmp"

  # disable OpenMP if it is not used
  patch do
    url "https://github.com/sbfnk/LibBi/commit/df6fbc815cc4c2c52f9a6bcbffc01bd82f9674fd.diff"
    sha256 "7c0785c5337bcdd8dac9e90e0c37b7766d579684d48abac35974fb5fde67d6b5"
  end if !build.with? "openmp"

  # patches to work in case CUDA is not installed
  patch do
    url "https://github.com/libbi/LibBi/pull/8.diff"
    sha256 "cd3aec69ec9aa05fc5ed1d9ccaead9494f9ce4d580577c51b3e8acb63273663b"
  end

  head do
    patch do
      url "https://github.com/libbi/LibBi/pull/9.diff"
      sha256 "80746f04740c0730d241418014c37857303f126cf2ed48f55b44b597386e85a2"
    end
  end

  stable do
    patch do
      url "https://github.com/sbfnk/LibBi/commit/f8d31b6a7c5d3534cf3c6ff99631e2d484bcd2ff.diff"
      sha256 "5cb89fbe1d6e522e7d27cc1de14f2f25675bdd4cf47bfa3180656dc63230dc0d"
    end
  end

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
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.append "CPPFLAGS", "-I#{include}"

    perl_resources = [] << "Getopt::ArgvFile" << "Carp::Assert" << "File::Slurp" << "Parse::Yapp" << "Parse::Template" << "Parse::Lex" << "Parse::RecDescent" << "Math::Symbolic" << "Class::Inspector" << "File::ShareDir" << "Template" << "Graph"
    include_resources = [] << "thrust"

    perl_resources.each do |r|
      resource(r).stage do
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
        system "make"
        system "make", "test" if build.with? "test"
        system "make", "install"
      end
    end

    include_resources.each do |r|
      resource(r).stage do
        (include/r).install Dir["*"]
      end
    end

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"

##    if (MacOS::CLT.installed? || MacOS::Xcode.installed?) && MacOS::Xcode.version > "6.3"
##      inreplace "Makefile", " -fstack-protector-strong", ""
##    end

    system "make"
    system "make", "test" if build.with? "test"
    system "make", "install"

    bin.install libexec/"bin/libbi"
    bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"], :CPPFLAGS => ENV["CPPFLAGS"], :CXX => ENV["CXX"])
  end

  test do
    system "libbi"
  end
end

__END__
diff --git a/share/configure.ac b/share/configure.ac
index c53b8ec..9451efb 100644
--- a/share/configure.ac
+++ b/share/configure.ac
@@ -144,6 +144,20 @@ if test x$openmp = xtrue; then
   AC_OPENMP
 fi

+# Thrust backend
+if test x$cuda = xtrue; then
+  AC_DEFINE([THRUST_DEVICE_SYSTEM], [THRUST_DEVICE_SYSTEM_CUDA])
+else
+  AC_DEFINE([THRUST_DEVICE_SYSTEM], [THRUST_DEVICE_SYSTEM_CPP])
+fi
+if test x$openmp = xtrue; then
+  AC_DEFINE([THRUST_HOST_SYSTEM], [THRUST_HOST_SYSTEM_OMP])
+else
+  AC_DEFINE([THRUST_HOST_SYSTEM], [THRUST_HOST_SYSTEM_CPP])
+fi
+# ^ OpenMP in Thrust 1.6 very slow, but seems to have been rectified in
+#   Thrust 1.7, so its OpenMP backend has been re-enabled.
+
 # Checks of programs
 if test x$mpi = xtrue; then
     if test x$vampir = xtrue; then

