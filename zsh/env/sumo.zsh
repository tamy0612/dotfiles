if type sumo > /dev/null 2>&1 ; then
    SUMO_VERSION=$(sumo --version|head -n 1|cut -d' ' -f5)

    case ${OSTYPE} in
        darwin*)
            export SUMO_INSTALL_DIR=$(brew --prefix)/Cellar/sumo/${SUMO_VERSION}
            export SUMO_HOME=${SUMO_INSTALL_DIR}/share/sumo
            ;;
    esac
fi
