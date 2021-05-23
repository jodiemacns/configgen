n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
export NNN_BMS='m:~/code/enginuity/meetings;L:~/code/enginuity/chirpstackserver/;C:~/configgen/;d:~/code/enginuity/diary/;r:~/code/enginuity/lorawan_retrofit/;c:~/code/enginuity/c_template/;l:~/code/enginuity/iot_valve_fw;M:~/code/enginuity/mobile_monitor_system;'
#export NNN_USE_EDITOR=0                                 # use the $EDITOR when opening text files
export NNN_SSHFS_OPTS="sshfs -o follow_symlinks"        # make sshfs follow symlinks on the remote
export NNN_COLORS="2136"                        # use a different color for each context
#export NNN_TRASH=1                                      # trash (needs trash-cli) instead of delete
export NNN_TRASH=0                                      # trash (needs trash-cli) instead of delete
export NNN_OPENER=nuke.sh                                      # trash (needs trash-cli) instead of delete

