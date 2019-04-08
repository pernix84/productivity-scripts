:: use this file to run your own startup commands
:: use  in front of the command to prevent printing the command

:: uncomment this to have the ssh agent load when cmder starts
call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd"
%SSH_ADD% "%HOME%\.ssh\id_rsa_gogs"
%SSH_ADD% "%HOME%\.ssh\id_rsa_github"

:: uncomment this next two lines to use pageant as the ssh authentication agent
:: SET SSH_AUTH_SOCK=/tmp/.ssh-pageant-auth-sock
:: call "%GIT_INSTALL_ROOT%/cmd/start-ssh-pageant.cmd"

:: you can add your plugins to the cmder path like so
:: set "PATH=%CMDER_ROOT%\vendor\whatever;%PATH%"

:: This needs auth sock and agent pid to be set
