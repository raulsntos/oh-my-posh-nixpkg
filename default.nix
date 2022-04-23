{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "oh-my-posh";
  version = "7.70.0";

  vendorSha256 = "sha256-AzfNq6t+Zk4eI0v6lWTzpcEmHPxF/3Lrk9g/OgOoTmI=";

  src = fetchFromGitHub {
    owner = "JanDeDobbeleer";
    repo = pname;
    rev = "refs/tags/v${version}";
    sha256 = "sha256-4EK9Qw3Zj6yTHJJgnFbjpyp0YZG1uqHvOUi91OGBkAo=";
  } + "/src";

  ldflags = [ "-s" "-w" "-X" "main.Version=${version}" "-extldflags" "\"-static\"" ];

  meta = {
    description = "A prompt theme engine for any shell.";
    homepage = "https://github.com/jandedobbeleer/oh-my-posh";
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
