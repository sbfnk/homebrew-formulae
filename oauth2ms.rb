class Oauth2ms < Formula
  include Language::Python::Virtualenv

  desc "XOAUTH2 compatible O365 token fetcher"
  homepage "https://github.com/harishkrupo/oauth2ms"
  url "https://raw.githubusercontent.com/harishkrupo/oauth2ms/main/oauth2ms"
  sha256 "e8a96267b4cc1e32d830c5548b415a5c6f11ceef3b11e0a02446ed4e3840d151"
  version "2021.01.18"
  license "Apache-2.0"

  depends_on "python@3.12"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/0f/bd/1d41ee578ce09523c81a15426705dd20969f5abf006d1afe8aeff0dd776a/certifi-2024.12.14.tar.gz"
    sha256 "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
  end

  resource "cffi" do
    url "https://files.pythonhosted.org/packages/fc/97/c783634659c2920c3fc70419e3af40972dbaf758daa229a7d6ea6135c90d/cffi-1.17.1.tar.gz"
    sha256 "1c39c6016c32bc48dd54561950ebd6836e1670f2ae46128f67cf49e789c52824"
  end

  resource "charset-normalizer" do
    url "https://files.pythonhosted.org/packages/f2/4f/e1808dc01273379acc506d18f1504eb2d299bd4131743b9fc54d7be4df1e/charset_normalizer-3.4.0.tar.gz"
    sha256 "223217c3d4f82c3ac5e29032b3f1c2eb0fb591b72161f86d93f5719079dae93e"
  end

  resource "cryptography" do
    url "https://files.pythonhosted.org/packages/91/4c/45dfa6829acffa344e3967d6006ee4ae8be57af746ae2eba1c431949b32c/cryptography-44.0.0.tar.gz"
    sha256 "cd4e834f340b4293430701e772ec543b0fbe6c2dea510a5286fe0acabe153a02"
  end

  resource "idna" do
    url "https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d/idna-3.10.tar.gz"
    sha256 "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
  end

  resource "msal" do
    url "https://files.pythonhosted.org/packages/3f/f3/cdf2681e83a73c3355883c2884b6ff2f2d2aadfc399c28e9ac4edc3994fd/msal-1.31.1.tar.gz"
    sha256 "11b5e6a3f802ffd3a72107203e20c4eac6ef53401961b880af2835b723d80578"
  end

  resource "pycparser" do
    url "https://files.pythonhosted.org/packages/1d/b2/31537cf4b1ca988837256c910a668b553fceb8f069bedc4b1c826024b52c/pycparser-2.22.tar.gz"
    sha256 "491c8be9c040f5390f5bf44a5b07752bd07f56edf992381b05c701439eec10f6"
  end

  resource "pyjwt" do
    url "https://files.pythonhosted.org/packages/e7/46/bd74733ff231675599650d3e47f361794b22ef3e3770998dda30d3b63726/pyjwt-2.10.1.tar.gz"
    sha256 "3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953"
  end

  resource "python-gnupg" do
    url "https://files.pythonhosted.org/packages/85/61/2df3cd6f49dbb2d4a6a567cac1d803e3a50d86207e196d0f9e67a48664f7/python-gnupg-0.5.3.tar.gz"
    sha256 "290d8ddb9cd63df96cfe9284b9b265f19fd6e145e5582dc58fd7271f026d0a47"
  end

  resource "pyxdg" do
    url "https://files.pythonhosted.org/packages/b0/25/7998cd2dec731acbd438fbf91bc619603fc5188de0a9a17699a781840452/pyxdg-0.28.tar.gz"
    sha256 "3267bb3074e934df202af2ee0868575484108581e6f3cb006af1da35395e88b4"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/63/70/2bf7780ad2d390a8d301ad0b550f1581eadbd9a20f896afe06353c2a2913/requests-2.32.3.tar.gz"
    sha256 "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
  end

  resource "urllib3" do
    url "https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260/urllib3-2.2.3.tar.gz"
    sha256 "e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9"
  end

  def install
    # Create virtualenv and install dependencies
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources

    # Install the script - it's downloaded as a single file named "oauth2ms"
    # Rewrite shebang to use virtualenv python
    script = buildpath/"oauth2ms"
    inreplace script, "#!/usr/bin/python3", "#!#{libexec}/bin/python3"
    script.chmod 0755
    libexec.install script

    # Create symlink in bin
    bin.install_symlink libexec/"oauth2ms"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/oauth2ms --help")
  end
end
