{ stdenv, writeShellScriptBin, dzen2, pamixer }:

writeShellScriptBin
  "volume"
  ''
    #!/usr/bin/env bash

    dzen_command="${dzen2}/bin/dzen2 -p 2 -xs 1 -geometry 250x50-265+35 -fn 'hack-10' -fg '#ccc' -bg '#2d2d2d'"
    volume_notches=20
    volume_step="5"

    function get_volume {
        ${pamixer}/bin/pamixer --get-volume
    }

    function raise_volume {
        ${pamixer}/bin/pamixer -i $volume_step -u
    }

    function lower_volume {
        ${pamixer}/bin/pamixer -d $volume_step -u
    }

    function toggle_mute {
        ${pamixer}/bin/pamixer -t
    }

    function is_muted {
        ${pamixer}/bin/pamixer --get-mute
    }

    # $1: percentage
    function make_volume_string {
        local percentage=$1
        local filled_bars=$(($percentage * $volume_notches / 100 - 1))
        local str="["

        for ((i=0; i < volume_notches; i++)); do
            if [ "$i" -gt "$filled_bars" ]; then
                str="$str "
            else
                str="$str="
            fi
        done
        str="$str]"

        local number=""
        if is_muted; then
            number="--%"
        else
            number="$percentage%"
        fi

        printf '%-4s %s\n' "$number" "$str"
    }

    case $1 in
        "raise")
            raise_volume
            ;;
        "lower")
            lower_volume
            ;;
        "mute")
            toggle_mute
            ;;
    esac

    make_volume_string $(get_volume) | eval $dzen_command
''
