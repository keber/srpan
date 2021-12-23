/*
 * MATLAB Compiler: 4.2 (R14SP2)
 * Date: Sun Dec 07 18:10:05 2008
 * Arguments: "-B" "macro_default" "-m" "-W" "main" "-T" "link:exe" "-d"
 * "../binary" "-B" "listaarchivos" "main" "components\calc\filtro_promedio"
 * "components\calc\perimetro" "components\dBase\dBase"
 * "components\dBase\private\db_log" "components\dBase\private\db_tipo"
 * "components\gui\cargar" "components\gui\defParamSegmento"
 * "components\gui\defPeaksObservados" "components\gui\evento"
 * "components\gui\gui" "components\gui\gui_02"
 * "components\gui\resultadoAnalisis" "components\gui\temporal"
 * "components\gui\private\area" "components\gui\private\logindlg"
 * "components\gui\private\maxpos" "components\gui\private\minpos"
 * "components\gui\private\perimetro" "components\io\abfload"
 * "components\io\pvpmod" "modules\mod_auth" "modules\principal" 
 */

#include <stdio.h>
#include "mclmcr.h"
#ifdef __cplusplus
extern "C" {
#endif
extern const unsigned char __MCC_main_public_data[];
extern const char *__MCC_main_name_data;
extern const char *__MCC_main_root_data;
extern const unsigned char __MCC_main_session_data[];
extern const char *__MCC_main_matlabpath_data[];
extern const int __MCC_main_matlabpath_data_count;
extern const char *__MCC_main_classpath_data[];
extern const int __MCC_main_classpath_data_count;
extern const char *__MCC_main_lib_path_data[];
extern const int __MCC_main_lib_path_data_count;
extern const char *__MCC_main_mcr_runtime_options[];
extern const int __MCC_main_mcr_runtime_option_count;
extern const char *__MCC_main_mcr_application_options[];
extern const int __MCC_main_mcr_application_option_count;
#ifdef __cplusplus
}
#endif

static HMCRINSTANCE _mcr_inst = NULL;


static int mclDefaultPrintHandler(const char *s)
{
    return fwrite(s, sizeof(char), strlen(s), stdout);
}

static int mclDefaultErrorHandler(const char *s)
{
    int written = 0, len = 0;
    len = strlen(s);
    written = fwrite(s, sizeof(char), len, stderr);
    if (len > 0 && s[ len-1 ] != '\n')
        written += fwrite("\n", sizeof(char), 1, stderr);
    return written;
}


/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_main_C_API 
#define LIB_main_C_API /* No special import/export declaration */
#endif

LIB_main_C_API 
bool mainInitializeWithHandlers(
    mclOutputHandlerFcn error_handler,
    mclOutputHandlerFcn print_handler
)
{
    if (_mcr_inst != NULL)
        return true;
    if (!mclmcrInitialize())
        return false;
    if (!mclInitializeComponentInstance(&_mcr_inst, __MCC_main_public_data,
                                        __MCC_main_name_data,
                                        __MCC_main_root_data,
                                        __MCC_main_session_data,
                                        __MCC_main_matlabpath_data,
                                        __MCC_main_matlabpath_data_count,
                                        __MCC_main_classpath_data,
                                        __MCC_main_classpath_data_count,
                                        __MCC_main_lib_path_data,
                                        __MCC_main_lib_path_data_count,
                                        __MCC_main_mcr_runtime_options,
                                        __MCC_main_mcr_runtime_option_count,
                                        true, NoObjectType, ExeTarget, NULL,
                                        error_handler, print_handler))
        return false;
    return true;
}

LIB_main_C_API 
bool mainInitialize(void)
{
    return mainInitializeWithHandlers(mclDefaultErrorHandler,
                                      mclDefaultPrintHandler);
}

LIB_main_C_API 
void mainTerminate(void)
{
    if (_mcr_inst != NULL)
        mclTerminateInstance(&_mcr_inst);
}

int main(int argc, const char **argv)
{
    int _retval;
    if (!mclInitializeApplication(__MCC_main_mcr_application_options,
                                  __MCC_main_mcr_application_option_count))
        return 0;
    
    if (!mainInitialize())
        return -1;
    _retval = mclMain(_mcr_inst, argc, argv, "main", 0);
    if (_retval == 0 /* no error */) mclWaitForFiguresToDie(NULL);
    mainTerminate();
    mclTerminateApplication();
    return _retval;
}
