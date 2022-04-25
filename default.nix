{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "oh-my-posh";
  version = "7.71.2";

  src = fetchFromGitHub {
    owner = "JanDeDobbeleer";
    repo = pname;
    rev = "refs/tags/v${version}";
    sha256 = "sha256-T2xEsbeggXEvt802nWIb+lwy2odAmtWgdvPcEa6BPp0=";
  };
  modRoot = "./src";

  vendorSha256 = "sha256-AzfNq6t+Zk4eI0v6lWTzpcEmHPxF/3Lrk9g/OgOoTmI=";

  ldflags = [ "-s" "-w" "-X" "main.Version=${version}" "-extldflags" "\"-static\"" ];

  meta = {
    description = "Cross platform, highly customizable and extensible prompt theme engine for any shell.";
    homepage = "https://ohmyposh.dev/";
    license = lib.licenses.mit;

    platforms = lib.platforms.unix;
    maintainers = [{
      name = "Raul Santos";
      email = "raulsntos@gmail.com";
      github = "raulsntos";
      githubId = 3903059;
    }];
  };
}
