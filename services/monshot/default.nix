{ config, lib, pkgs, ...}:

with lib;
let
  cfg = config.services.monshot;
  monshot = pkgs.monshot;
  workDir = "/var/monshot";
  user = "monshot";
  rocketConfig = pkgs.writeText "Rocket.toml" ''
  [global.databases]
  db = { url = "database.db" }

  [global]
  port = ${toString cfg.port}
  template_dir = "${monshot}/assets/templates"
  static_directory = "${monshot}/assets/static"
  '';

in {
  options = {
    services.monshot = {
      enable = mkOption {
        default = false;
        type = types.bool;
      };

      port = mkOption {
        default = 8000;
      };
    };
  };

  config = mkIf cfg.enable {
    systemd.services.monshot = {
      description = "monshot";
      after = ["network.target"];
      wantedBy = ["multi-user.target"];
      path = [ monshot ];

      #Allow the img and thumbnail directories to already exist
      #Also allow us to to overwrite the asset folders later on
      preStart = ''
      cp -f "${rocketConfig}" "${workDir}/Rocket.toml"
      mkdir -p "${workDir}/thumbnails" "${workDir}/img"
      '';

      serviceConfig = {
        Type = "simple";
        User = user;
        Group = user;
        WorkingDirectory = workDir;
        Restart = "always";
        ExecStart = "${monshot}/bin/monshot";
        ProtectHome = true;
      };

      environment = {
        ROCKET_ENV="development";
        RUST_BACTRACE = "1";
      };
    };

    users.users = {
      monshot = {
        useDefaultShell = true;
        createHome = true;
        home = workDir;
      };
    };

    users.groups.monshot = {};
  };
}
