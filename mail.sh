function postfix_pgsql_installed() {
    install_package postfix-pgsql
    process
}

function sasl2_bin_installed() {
    install_package sasl2-bin
    process
}
function libsasl2_modules_installed() {
    install_package libsasl2-modules
    process
}
function postgresql_installed() {
    install_package postgresql
    process
}
function libpam_pgsql_installed() {
    install_package libpam-pgsql
    process
}
function dovecot_pgsql_installed() {
    install_package dovecot-pgsql
    process
}
function dovecot_imapd_installed() {
    install_package dovecot-imapd
    process
}
function dovecot_pop3d_installed() {
    install_packagedovecot-pop3d
    process
}

function imap_server_packages() {
    requires postfix_pgsql_installed
    requires sasl2_bin_installed
    requires libsasl2_modules_installed
    requires postgresql_installed
    requires libpam_pgsql_installed
    requires dovecot_pgsql_installed
    requires dovecot_imapd_installed
    requires dovecot_pop3d_installed
}

function install_package() {
_package_name=$1; shift
_platform=`uname -s`
# -a == apt
# -b == brew
while getopts "a:b:" opt; do
    case "$opt" in
        a)
            apt_pkg=$OPTARG;;
        b)
            brew_pkg=$OPTARG;;
    esac
done
unset OPTIND

case "`uname -s`" in
    Linux)
        # TODO things other than debian derivatives
        function is_met() {
        dpkg -l | grep ${apt_pkg:-$_package_name}
    }
    function meet() {
    [ -n "$__babushka_force" ] && apt_flags="${apt_flags} -f -y"
    DEBCONF_TERSE='yes' DEBIAN_PRIORITY='critical' DEBIAN_FRONTEND='noninteractive' $__babashka_sudo aptitude install $apt_flags ${apt_pkg:-$_package_name}
}
;;
   Darwin)
       # TODO things other than brew
       function is_met() {
       brew list | grep ${brew_pkg:-$_package_name}
   }
   function meet() {
   brew install ${brew_pkg:-$_package_name}
     }
     ;;
  esac
}
