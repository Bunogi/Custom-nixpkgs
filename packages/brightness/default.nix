{ stdenv, writeShellScriptBin, dzen2, acpilight }:

writeShellScriptBin
  "brightness"
  ''
    dzen_command="${dzen2}/bin/dzen2 -p 2 -xs 1 -geometry 250x50-265+35 -fn 'hack-10' -fg '#ccc' -bg '#2d2d2d'"
    notches=20
    step="5"

    function get_brightness {
        ${acpilight}/bin/xbacklight -get
    }

    function increase_brightness {
        ${acpilight}/bin/xbacklight +$step
    }

    function decrease_brightness {
        ${acpilight}/bin/xbacklight -$step
    }

    # $1: percentage
    function make_brightness_string {
        local percentage=$1
        local filled_bars=$(($percentage * $notches / 100 - 1))
        local str="["

        for ((i=0; i < notches; i++)); do
            if [ "$i" -gt "$filled_bars" ]; then
                str="$str "
            else
                str="$str="
            fi
        done
        str="$str]"

        local number="$percentage%"

        printf '%-4s %s\n' "$number" "$str"
    }

    case $1 in
        "increase")
            increase_brightness
            ;;
        "decrease")
            decrease_brightness
            ;;
    esac

    make_brightness_string $(get_brightness) | eval $dzen_command
  ''

# let brightness = stdenv.mkDerivation {
#       name = "brightness";
#       version = "3";

#       src = ./brightness.tar.xz;
#       dontBuild = true;
#       installPhase = ''
#           mkdir -p $out/bin
#           cp brightness $out/bin
#         '';
#     };
# in
#   symlinkJoin {
#     name = "brightness";

#     paths = [ dzen2 acpilight brightness ];
#   }
