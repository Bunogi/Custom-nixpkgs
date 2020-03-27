{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.services.botty;
  botty = pkgs.botty;
  pg = config.services.postgresql;
  redis = config.services.redis;

  configFile = pkgs.writeText "tg.toml" ''
   [general]
   time_format = "${cfg.general.time_format}"

   [postgres]
   host = "${toString cfg.postgres.host}"
   user = "${toString cfg.postgres.user}"
   ${optionalString (cfg.postgres.password != null) "password = \"${cfg.postgres.password}\""}

   [markov]
   chain_order = ${toString cfg.markov.chain_order}
   max_order = ${toString cfg.markov.max_order}
   min_words = ${toString cfg.markov.min_words}
   max_attempts = ${toString cfg.markov.max_attempts}

   [redis]
   address = "${cfg.redis.address}"
    ${optionalString (cfg.redis.password != null)
      "password = \"${cfg.redis.password}\""}

   [cache]
   username = ${toString cfg.cache.username}
   markov_chain = ${toString cfg.cache.markov_chain}

   [disaster]
   cooldown = ${toString cfg.disaster.cooldown}
  '';
in
{
  options = {
    services.botty = {
      enable = mkOption {
        default = false;
        type = types.bool;
      };

      user = mkOption {
        default = "botty";
        type = types.str;
      };

      token = mkOption {
        default = null;
        type = types.str;
      };

      workDir = mkOption {
        default = "/var/botty";
        type = types.str;
      };

      general = {
        time_format = mkOption {
          default = "%A, %e %B %Y %H:%M:%S %Z";
          type = types.str;
        };
      };

      postgres = {
        host = mkOption {
          default = "127.0.0.1";
          type = types.str;
        };
        user = mkOption {
          default = "botty";
          type = types.str;
        };
        password = mkOption {
          default = null;
          type = types.nullOr types.str;
        };
      };

      markov = {
        chain_order = mkOption {
          default = 1;
          type = types.int;
        };
        max_order = mkOption {
          default = 5;
          type = types.int;
        };
        min_words = mkOption {
          default = 4;
          type = types.int;
        };
        max_attempts = mkOption {
          default = 100;
          type = types.int;
        };
      };

      redis = {
        address = mkOption {
          default = "127.0.0.1:6379";
          type = types.str;
        };
        password = mkOption {
          default = null;
          type = types.nullOr types.str;
        };
      };

      cache = {
        username = mkOption {
          default = 3600;
          type = types.int;
        };
        markov_chain = mkOption {
          default = 1300;
          type = types.int;
        };
      };

      disaster = {
        cooldown = mkOption {
          default = 3;
          type = types.int;
        };
      };
    };
  };

  config = mkIf cfg.enable {
    services.postgresql = {
      enable = true;
      ensureDatabases = ["botty"];
      ensureUsers = [{
        name = cfg.user;
        ensurePermissions = { "DATABASE ${cfg.user}" = "ALL PRIVILEGES"; };
      }];
    };
    services.redis = {
      enable = true;
    };

    systemd.services.botty = {
      description = "botty";
      after = [ "network.target" "postgresql.service" "redis.service"];
      wantedBy = ["multi-user.target"];
      path = [ botty ];

      #Copy config file to the right spot
      preStart = "cp -f ${configFile} ${cfg.workDir}/tg.toml";

      serviceConfig = {
        Type = "simple";
        User = cfg.user;
        Group = cfg.user;
        WorkingDirectory = cfg.workDir;
        Restart = "always";
        ExecStart = "${botty}/bin/tg";
        ProtectHome = true;
      };

      environment = {
        USER = cfg.user;
        TELEGRAM_BOT_TOKEN = cfg.token;
        RUST_LOG = "info";
        RUST_BACKTRACE = "1";
      };
    };

    users.users = mkIf (cfg.user == "botty") {
      botty = {
        useDefaultShell = true;
        group = "botty";
        createHome = true;
        home = cfg.workDir;
      };
    };

    users.groups.botty = {};
  };
}
