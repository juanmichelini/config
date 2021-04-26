{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
	ncdu
	vlc
	mpv
        ghc
        cabal2nix
	#nixGLNvidia
        haskellPackages.haskell-language-server
        haskellPackages.gloss
        cabal-install
        hlint
	qbittorrent
	fortune
	git
        (neovim.override {
          vimAlias = true;
          withNodeJs = true;
          configure = {
            packages.myPlugins = with pkgs.vimPlugins; {
              start = [
                        coc-nvim
                        haskell-vim
                        ghcid
                        vim-hindent
                        coc-json
                        coc-vimlsp
                      ];
              opt = [];
            };
            #customRC = vimrc;
          };
        })
      ];
    };
  };
}
