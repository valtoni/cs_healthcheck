#include <extdll.h>
#include <eiface.h>
#include <iostream>
#include <chrono>
#include <iomanip>
#include <string>
#include <iostream>

/**
 * g++ -o call_global call_global.cpp /csserver/cstrike/ReGameDLL_CS/build/regamedll/cs.so
 * export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:ReGameDLL_CS/build/regamedll/cs.so
 * ldconfig
*/

extern enginefuncs_t g_engfuncs;

int main() {
    if (g_engfuncs.pfnNumberOfEntities) {
        std::cout << "Valor da variável global: " << g_engfuncs.pfnNumberOfEntities() << std::endl;
    }
    else {
        std::cout << "Impossível continuar. Variável global não inicializada." << std::endl;
    }

    return 0;
}



