{ config, pkgs, lib, ... }:

let
  zapret = pkgs.stdenv.mkDerivation rec {
    pname = "zapret-discord-youtube";
    version = "0.5.0";

    src = pkgs.fetchFromGitHub {
      owner = "Sergeydigl3";
      repo = "zapret-discord-youtube-linux";
      rev = "${version}";

      hash = "sha256-WZyMMEp8hASHELlduqEJTcgazUrgDsbuM388FfmHqL0=";
    };

    nativeBuildInputs = [ pkgs.makeWrapper ];

    buildInputs = with pkgs; [
      bash
      coreutils
      nftables
      iptables
      gawk
    ];

    dontConfigure = true;
    dontBuild = true;

    installPhase = ''
      runHook preInstall

      mkdir -p $out/share/${pname}
      cp -r . $out/share/${pname}

      mkdir -p $out/bin

      # Пишем скрипт-обертку вручную через cat.
      # Теперь Nix гарантированно подставит правильные пути к bash, coreutils и т.д.
      cat << 'EOF' > $out/bin/zapret
      #!/bin/sh
      
      # За жесткий путь Nix-store отвечает переменная, которую мы подставим ниже
      STORE_PATH="@STORE_PATH@"

      # Автоматически создаем изменяемую папку и копируем туда шаблоны
      mkdir -p /var/lib/zapret
      cp -r $STORE_PATH/* /var/lib/zapret/
      chmod -R +w /var/lib/zapret/
      chmod +x /var/lib/zapret/service.sh

      # Прокидываем все необходимые утилиты в PATH рантайма
      export PATH="${lib.makeBinPath [ pkgs.coreutils pkgs.bash pkgs.nftables pkgs.iptables pkgs.gawk pkgs.curl pkgs.gnutar pkgs.gzip ]}:$PATH"
      export SHELL="${pkgs.bash}/bin/bash"

      # Переходим в рабочую директорию и запускаем оригинальный скрипт со всеми переданными аргументами ($@)
      cd /var/lib/zapret
      exec /var/lib/zapret/service.sh "$@"
      EOF

      # Подставляем реальный путь Nix-store вместо шаблона @STORE_PATH@
      substituteInPlace $out/bin/zapret --replace "@STORE_PATH@" "$out/share/${pname}"

      # Делаем нашу обертку исполняемой
      chmod +x $out/bin/zapret

      runHook postInstall
    '';
  };

in {
  home.packages = [ zapret ];
}
