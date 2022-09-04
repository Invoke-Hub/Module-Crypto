:: Git Organization Command
@echo off
set /P O=Enter git option: 
:switch-case-option

    goto :switch-case-O-%O% 2>nul || (
        echo "Option not available, Available Options Are (init, push, pull)."
        exit
    )

    :switch-case-O-init
        cd ./src/modules/
        rmdir .git /s /q
        git init
        git remote add module-crypto https://github.com/Invoke-Hub/Module-Crypto.git
        git pull module-crypto main
        git branch -M main
        exit

    :switch-case-O-push (
        set /P C=Enter commit message: 

        cd ./src/modules/
        git add ./market/crypto/*
        git add ./readme.md
        git commit -m "%C%"
        git push -u module-crypto main
        ::rmdir .git /s /q
        exit
    )

    :switch-case-O-pull
        ::rmdir .git /s /q
        cd ./src/modules/
        git init .
        git branch -M main
        git remote add module-crypto https://github.com/Invoke-Hub/Module-Crypto.git
        git pull module-crypto main
        ::rmdir .git /s /q
        exit