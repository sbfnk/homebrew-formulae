class Libbi < Formula
  desc "Bayesian state-space modelling on parallel computer hardware"
  homepage "http://libbi.org"
  revision 7
  head "https://github.com/libbi/LibBi.git"

  stable do
    url "https://github.com/libbi/LibBi/archive/1.3.0.tar.gz"
    sha256 "0dd313dd71e72b2f16ca9074800fc2fa8bf585bec3b87a750ff27e467a9826d0"
  end

  bottle :disable, "needs to be rebuilt with latest netcdf"

  option "without-test", "Disable build-time checking (not recommended)"

  depends_on :perl => "5.16"
  depends_on "qrupdate"
  depends_on "netcdf"
  depends_on "gsl"
  depends_on "boost"
  depends_on "automake" => :run


  resource "Module::Build" do
    # AWS::Signature4 requires Module::Build v0.4205 and above, while standard
    # MacOS Perl installation has 0.4003
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-0.4222.tar.gz"
    sha256 "e74b45d9a74736472b74830599cec0d1123f992760f9cd97104f94bee800b160"
  end

  resource "AWS::Signature4" do
    url "https://cpan.metacpan.org/authors/id/L/LD/LDS/AWS-Signature4-1.02.tar.gz"
    sha256 "20bbc16cb3454fe5e8cf34fe61f1a91fe26c3f17e449ff665fcbbb92ab443ebd"
  end

  resource "Clone" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GARU/Clone-0.38.tar.gz"
    sha256 "9fb0534bb7ef6ca1f6cc1dc3f29750d6d424394d14c40efdc77832fad3cebde8"
  end

  resource "Date::Parse" do
    url "https://cpan.metacpan.org/authors/id/G/GB/GBARR/TimeDate-2.30.tar.gz"
    sha256 "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
  end

  resource "Devel::Caller" do
    url "https://cpan.metacpan.org/authors/id/R/RC/RCLAMP/Devel-Caller-2.06.tar.gz"
    sha256 "6a73ae6a292834255b90da9409205425305fcfe994b148dcb6d2d6ef628db7df"
  end

  resource "Encode::Locale" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz"
    sha256 "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
  end

  resource "Exporter::Tiny" do
    url "https://cpan.metacpan.org/authors/id/T/TO/TOBYINK/Exporter-Tiny-0.042.tar.gz"
    sha256 "8f1622c5ebbfbcd519ead81df7917e48cb16cc527b1c46737b0459c3908a023f"
  end

  resource "File::Listing" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/File-Listing-6.04.tar.gz"
    sha256 "1e0050fcd6789a2179ec0db282bf1e90fb92be35d1171588bd9c47d52d959cf5"
  end

  resource "File::Remove" do
    url "https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/File-Remove-1.57.tar.gz"
    sha256 "b3becd60165c38786d18285f770b8b06ebffe91797d8c00cc4730614382501ad"
  end

  resource "HTML::Parser" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTML-Parser-3.72.tar.gz"
    sha256 "ec28c7e1d9e67c45eca197077f7cdc41ead1bb4c538c7f02a3296a4bb92f608b"
  end

  resource "HTML::Tagset" do
    url "https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/HTML-Tagset-3.20.tar.gz"
    sha256 "adb17dac9e36cd011f5243881c9739417fd102fce760f8de4e9be4c7131108e2"
  end

  resource "HTTP::Cookies" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Cookies-6.01.tar.gz"
    sha256 "f5d3ade383ce6389d80cb0d0356b643af80435bb036afd8edce335215ec5eb20"
  end

  resource "HTTP::Daemon" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Daemon-6.01.tar.gz"
    sha256 "43fd867742701a3f9fcc7bd59838ab72c6490c0ebaf66901068ec6997514adc2"
  end

  resource "HTTP::Date" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Date-6.02.tar.gz"
    sha256 "e8b9941da0f9f0c9c01068401a5e81341f0e3707d1c754f8e11f42a7e629e333"
  end

  resource "HTTP::Message" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/HTTP-Message-6.11.tar.gz"
    sha256 "e7b368077ae6a188d99920411d8f52a8e5acfb39574d4f5c24f46fd22533d81b"
  end

  resource "HTTP::Negotiate" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-6.01.tar.gz"
    sha256 "1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016"
  end

  resource "Hash::Merge" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/Hash-Merge-0.200.tar.gz"
    sha256 "47f9f03330b7595c94e73bdd17dc6682ba59d1cc89e63f4e319617f4bb122a64"
  end

  resource "IO::HTML" do
    url "https://cpan.metacpan.org/authors/id/C/CJ/CJM/IO-HTML-1.001.tar.gz"
    sha256 "ea78d2d743794adc028bc9589538eb867174b4e165d7d8b5f63486e6b828e7e0"
  end

  resource "IO::String" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/IO-String-1.08.tar.gz"
    sha256 "2a3f4ad8442d9070780e58ef43722d19d1ee21a803bf7c8206877a10482de5a0"
  end

  resource "Canary::Stability" do
    url "https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/Canary-Stability-2012.tar.gz"
    sha256 "fd240b111d834dbae9630c59b42fae2145ca35addc1965ea311edf0d07817107"
  end

  resource "JSON::XS" do
    url "https://cpan.metacpan.org/authors/id/M/ML/MLEHMANN/JSON-XS-3.02.tar.gz"
    sha256 "5f6a5944887d75f1d34440a2d9e69ef12e23f434af23acb143fb0241f40b02be"
  end

  resource "LWP" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/libwww-perl-6.15.tar.gz"
    sha256 "6f349d45c21b1ec0501c4437dfcb70570940e6c3d5bff783bd91d4cddead8322"
  end

  resource "LWP::MediaTypes" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/LWP-MediaTypes-6.02.tar.gz"
    sha256 "18790b0cc5f0a51468495c3847b16738f785a2d460403595001e0b932e5db676"
  end

  resource "List::MoreUtils" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/List-MoreUtils-0.419.tar.gz"
    sha256 "5f8e65608f5dc583faa6a703d19d277ad46dfc1816e51f8ff34fb8322ed48615"
  end

  resource "Module::ScanDeps" do
    url "https://cpan.metacpan.org/authors/id/R/RS/RSCHUPP/Module-ScanDeps-1.23.tar.gz"
    sha256 "162b6f771197ad4662ac60c427d473b4c0a41cac476fa96b48556cce7fca040e"
  end

  resource "Test::Simple" do
    url "https://www.cpan.org/authors/id/E/EX/EXODIST/Test-Simple-1.302106.tar.gz"
    sha256 "7d3620676a7610e07b0465a1a20e479e61b2757ad908d90ef1daea1f1af4fc30"
  end

  resource "Getopt::ArgvFile" do
    url "https://www.cpan.org/CPAN/authors/id/J/JS/JSTENZEL/Getopt-ArgvFile-1.11.tar.gz"
    sha256 "3709aa513ce6fd71d1a55a02e34d2f090017d5350a9bd447005653c9b0835b22"
  end

  resource "Carp::Assert" do
    url "https://www.cpan.org/CPAN/authors/id/N/NE/NEILB/Carp-Assert-0.21.tar.gz"
    sha256 "924f8e2b4e3cb3d8b26246b5f9c07cdaa4b8800cef345fa0811d72930d73a54e"
  end

  resource "File::Slurp" do
    url "https://www.cpan.org/CPAN/authors/id/U/UR/URI/File-Slurp-9999.19.tar.gz"
    sha256 "ce29ebe995097ebd6e9bc03284714cdfa0c46dc94f6b14a56980747ea3253643"
  end

  resource "Parse::Yapp" do
    url "https://www.cpan.org/CPAN/authors/id/W/WB/WBRASWELL/Parse-Yapp-1.2.tar.gz"
    sha256 "4bd29f083c261253c6128303dc51bff88d6472c09c3846bd399e21f1f0c3e49a"
  end

  resource "Parse::Template" do
    url "https://www.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseTemplate-3.08.tar.gz"
    sha256 "3c7734f53999de8351a77cb09631d7a4a0482b6f54bca63d69d5a4eec8686d51"
  end

  resource "Parse::Lex" do
    url "https://www.cpan.org/CPAN/authors/id/P/PS/PSCUST/ParseLex-2.21.tar.gz"
    sha256 "f55f0a7d1e2a6b806a47840c81c16d505c5c76765cb156e5f5fd703159a4492d"
  end

  resource "Parse::RecDescent" do
    url "https://www.cpan.org/CPAN/authors/id/J/JT/JTBRAUN/Parse-RecDescent-1.967003.tar.gz"
    sha256 "d4dac8dad012a7eef271a0ac8ec399f9e3b0b53902644df9c208daef8b4b7f0a"
  end

  resource "Math::Symbolic" do
    url "https://www.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Math-Symbolic-0.612.tar.gz"
    sha256 "a9af979956c4c28683c535b5e5da3cde198c0cac2a11b3c9a129da218b3b9c08"
  end

  resource "YAML::Tiny" do
    url "https://www.cpan.org/CPAN/authors/id/E/ET/ETHER/YAML-Tiny-1.70.tar.gz"
    sha256 "bbce4b52b5eafdb04e3043975a08dbf394d00b7d2c958adb9d03d9f7e9291255"
  end

  resource "File::Remove" do
    url "https://www.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/File-Remove-1.57.tar.gz"
    sha256 "b3becd60165c38786d18285f770b8b06ebffe91797d8c00cc4730614382501ad"
  end

  resource "inc::Module::Install::DSL" do
    url "https://www.cpan.org/CPAN/authors/id/E/ET/ETHER/Module-Install-1.18.tar.gz"
    sha256 "29068ac33502cec959844c206516c09cc4a847cb57327d41015f605153ca645e"
  end

  resource "Class::Inspector" do
    url "https://www.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-Inspector-1.28.tar.gz"
    sha256 "3ca4b7a3ed1f4cc846c9a3c08f9a6e9ec07a9cbfd92510dea9513db61a923112"
  end

  resource "File::ShareDir" do
    url "https://www.cpan.org/CPAN/authors/id/R/RE/REHSACK/File-ShareDir-1.102.tar.gz"
    sha256 "7c7334b974882587fbd9bc135f6bc04ad197abe99e6f4761953fe9ca88c57411"
  end

  resource "Template" do
    url "https://www.cpan.org/CPAN/authors/id/A/AB/ABW/Template-Toolkit-2.26.tar.gz"
    sha256 "e7e1cf36026f1ef96d8233e18a3fb39e1eafe9109edc639ecf25b20651cd76be"
  end

  resource "Graph" do
    url "https://www.cpan.org/CPAN/authors/id/J/JH/JHI/Graph-0.9704.tar.gz"
    sha256 "325e8eb07be2d09a909e450c13d3a42dcb2a2e96cc3ac780fe4572a0d80b2a25"
  end

  resource "thrust" do
    url "https://github.com/thrust/thrust/releases/download/1.8.2/thrust-1.8.2.zip"
    sha256 "00925daee4d9505b7f33d0ed42ab0de0f9c68c4ffbe2a41e6d04452cdee77b2d"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"

    resources.each do |r|
      r.stage do
        next if r.name == "thrust"
        # need to set TT_ACCEPT=y for Template library for non-interactive install
        perl_flags = "TT_ACCEPT=y" if r.name == "Template"
        system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", perl_flags
        system "make"
        system "make", "test" if build.with? "test"
        system "make", "install"
      end
    end

    resource("thrust").stage do
      (include/"thrust").install Dir["*"]
    end

    system perl, "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLSITESCRIPT=#{bin}"

    system "make"
    rm "t/010_cpu.t" # remove test that fails in superenv
    system "make", "test" if build.with? "test"
    system "make", "install"

    (libexec/"share/test").install "Test.bi", "test.conf"

    env = {
      :PATH => perl_dir.chomp.concat(":\$PATH"),
      :PERL5LIB => ENV["PERL5LIB"].chomp.concat(":$PERL5LIB")
##      :CPPFLAGS => "\$CPPFLAGS -I#{include}",
##      :LDFLAGS => "-L#{Formula["netcdf"].opt_lib} -L#{Formula["hdf5"].opt_lib} -L#{Formula["curl"].opt_lib} -lhdf5 -lhdf5_hl -lcurl",
##      :CXX => ENV["CXX"],
    }
    bin.env_script_all_files(libexec/"bin", env)
  end

  def caveats; <<-EOS.undent
    libbi must be run with the same version of perl it was installed with.
    Changing perl versions might require a reinstall of libbi.
    EOS
  end

  test do
    cp Dir[libexec/"share/test/*"], testpath
    cd testpath do
      system "#{bin}/libbi", "sample", "@test.conf"
    end
  end
end
