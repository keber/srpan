/*
 * MATLAB Compiler: 4.2 (R14SP2)
 * Date: Sun Dec 07 18:10:29 2008
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


#ifdef __cplusplus
extern "C" {
#endif
const unsigned char __MCC_main_public_data[] = {'3', '0', '8', '1', '9', 'D',
                                                '3', '0', '0', 'D', '0', '6',
                                                '0', '9', '2', 'A', '8', '6',
                                                '4', '8', '8', '6', 'F', '7',
                                                '0', 'D', '0', '1', '0', '1',
                                                '0', '1', '0', '5', '0', '0',
                                                '0', '3', '8', '1', '8', 'B',
                                                '0', '0', '3', '0', '8', '1',
                                                '8', '7', '0', '2', '8', '1',
                                                '8', '1', '0', '0', 'C', '4',
                                                '9', 'C', 'A', 'C', '3', '4',
                                                'E', 'D', '1', '3', 'A', '5',
                                                '2', '0', '6', '5', '8', 'F',
                                                '6', 'F', '8', 'E', '0', '1',
                                                '3', '8', 'C', '4', '3', '1',
                                                '5', 'B', '4', '3', '1', '5',
                                                '2', '7', '7', 'E', 'D', '3',
                                                'F', '7', 'D', 'A', 'E', '5',
                                                '3', '0', '9', '9', 'D', 'B',
                                                '0', '8', 'E', 'E', '5', '8',
                                                '9', 'F', '8', '0', '4', 'D',
                                                '4', 'B', '9', '8', '1', '3',
                                                '2', '6', 'A', '5', '2', 'C',
                                                'C', 'E', '4', '3', '8', '2',
                                                'E', '9', 'F', '2', 'B', '4',
                                                'D', '0', '8', '5', 'E', 'B',
                                                '9', '5', '0', 'C', '7', 'A',
                                                'B', '1', '2', 'E', 'D', 'E',
                                                '2', 'D', '4', '1', '2', '9',
                                                '7', '8', '2', '0', 'E', '6',
                                                '3', '7', '7', 'A', '5', 'F',
                                                'E', 'B', '5', '6', '8', '9',
                                                'D', '4', 'E', '6', '0', '3',
                                                '2', 'F', '6', '0', 'C', '4',
                                                '3', '0', '7', '4', 'A', '0',
                                                '4', 'C', '2', '6', 'A', 'B',
                                                '7', '2', 'F', '5', '4', 'B',
                                                '5', '1', 'B', 'B', '4', '6',
                                                '0', '5', '7', '8', '7', '8',
                                                '5', 'B', '1', '9', '9', '0',
                                                '1', '4', '3', '1', '4', 'A',
                                                '6', '5', 'F', '0', '9', '0',
                                                'B', '6', '1', 'F', 'C', '2',
                                                '0', '1', '6', '9', '4', '5',
                                                '3', 'B', '5', '8', 'F', 'C',
                                                '8', 'B', 'A', '4', '3', 'E',
                                                '6', '7', '7', '6', 'E', 'B',
                                                '7', 'E', 'C', 'D', '3', '1',
                                                '7', '8', 'B', '5', '6', 'A',
                                                'B', '0', 'F', 'A', '0', '6',
                                                'D', 'D', '6', '4', '9', '6',
                                                '7', 'C', 'B', '1', '4', '9',
                                                'E', '5', '0', '2', '0', '1',
                                                '1', '1', '\0'};

const char *__MCC_main_name_data = "main";

const char *__MCC_main_root_data = "";

const unsigned char __MCC_main_session_data[] = {'8', '6', 'A', 'A', 'F', '3',
                                                 '1', 'C', '8', '5', '1', '3',
                                                 '2', 'E', 'D', 'B', '8', '7',
                                                 '8', '7', 'B', '1', '2', '6',
                                                 'D', 'D', 'C', '7', 'B', '6',
                                                 '4', '9', '3', 'A', '0', 'C',
                                                 '2', 'B', 'B', 'F', '4', '7',
                                                 '9', 'E', 'D', '8', 'C', '8',
                                                 'C', '5', '5', 'D', '0', '1',
                                                 'F', 'D', '1', '4', 'F', 'B',
                                                 '5', '7', 'C', '7', '6', '3',
                                                 'C', '2', 'B', '3', 'C', '8',
                                                 '6', '9', '5', 'D', 'B', 'C',
                                                 '8', '0', '5', '3', 'A', '4',
                                                 '7', 'B', 'C', '1', '5', 'C',
                                                 'F', '4', '5', '6', 'E', '1',
                                                 '1', 'E', 'F', '2', 'F', '6',
                                                 'B', '7', '4', 'E', 'E', '4',
                                                 '4', '8', '3', '2', 'E', 'D',
                                                 'F', '3', '2', '6', '5', '8',
                                                 '0', '5', '5', '8', '0', 'B',
                                                 'F', '5', '1', 'E', 'B', '8',
                                                 '5', '1', '3', '9', 'C', '2',
                                                 '4', '7', '3', 'E', '3', '8',
                                                 'C', 'C', '7', '2', 'F', '4',
                                                 '0', 'C', '4', '8', 'B', '9',
                                                 '5', 'C', '5', 'F', 'F', '6',
                                                 'C', '2', 'A', '0', 'B', 'A',
                                                 'D', 'F', 'C', '3', 'A', '8',
                                                 '6', 'E', '2', '8', '1', '8',
                                                 'F', '0', '4', '4', '1', '5',
                                                 '5', 'E', 'F', '2', '8', 'D',
                                                 'A', 'B', '5', '8', '7', '4',
                                                 'F', '9', '0', 'D', '8', '8',
                                                 'F', 'B', 'D', '6', 'A', 'C',
                                                 '5', 'E', 'B', '7', '7', '0',
                                                 '4', '9', '2', '2', 'B', '0',
                                                 '9', 'A', '9', '7', '3', 'C',
                                                 '0', '9', '9', '0', 'B', '8',
                                                 '9', 'B', 'F', '1', '1', 'B',
                                                 'E', 'C', 'C', '9', '5', '7',
                                                 'F', '8', '7', '1', '3', '6',
                                                 '3', 'B', 'C', '5', '\0'};

const char *__MCC_main_matlabpath_data[] = {"main/",
                                            "toolbox/compiler/deploy/",
                                            "components/calc/",
                                            "components/dBase/",
                                            "components/gui/",
                                            "components/io/", "modules/",
                                            "$TOOLBOXMATLABDIR/general/",
                                            "$TOOLBOXMATLABDIR/ops/",
                                            "$TOOLBOXMATLABDIR/lang/",
                                            "$TOOLBOXMATLABDIR/elmat/",
                                            "$TOOLBOXMATLABDIR/elfun/",
                                            "$TOOLBOXMATLABDIR/specfun/",
                                            "$TOOLBOXMATLABDIR/matfun/",
                                            "$TOOLBOXMATLABDIR/datafun/",
                                            "$TOOLBOXMATLABDIR/polyfun/",
                                            "$TOOLBOXMATLABDIR/funfun/",
                                            "$TOOLBOXMATLABDIR/sparfun/",
                                            "$TOOLBOXMATLABDIR/scribe/",
                                            "$TOOLBOXMATLABDIR/graph2d/",
                                            "$TOOLBOXMATLABDIR/graph3d/",
                                            "$TOOLBOXMATLABDIR/specgraph/",
                                            "$TOOLBOXMATLABDIR/graphics/",
                                            "$TOOLBOXMATLABDIR/uitools/",
                                            "$TOOLBOXMATLABDIR/strfun/",
                                            "$TOOLBOXMATLABDIR/imagesci/",
                                            "$TOOLBOXMATLABDIR/iofun/",
                                            "$TOOLBOXMATLABDIR/audiovideo/",
                                            "$TOOLBOXMATLABDIR/timefun/",
                                            "$TOOLBOXMATLABDIR/datatypes/",
                                            "$TOOLBOXMATLABDIR/verctrl/",
                                            "$TOOLBOXMATLABDIR/codetools/",
                                            "$TOOLBOXMATLABDIR/helptools/",
                                            "$TOOLBOXMATLABDIR/winfun/",
                                            "$TOOLBOXMATLABDIR/demos/",
                                            "$TOOLBOXMATLABDIR/timeseries/",
                                            "$TOOLBOXMATLABDIR/hds/",
                                            "toolbox/local/",
                                            "toolbox/compiler/",
                                            "toolbox/control/control/",
                                            "toolbox/database/database/",
                                            "toolbox/nnet/nnet/",
                                            "toolbox/nnet/nnutils/",
                                            "toolbox/optim/"};
const int __MCC_main_matlabpath_data_count = 44;

const char *__MCC_main_classpath_data[] = {"java/jar/toolbox/control.jar",
                                           "java/jar/toolbox/database.jar"};
const int __MCC_main_classpath_data_count = 2;

const char *__MCC_main_lib_path_data[] = {"bin/win32/"};
const int __MCC_main_lib_path_data_count = 1;

const char *__MCC_main_mcr_application_options[] = { "" };
const int __MCC_main_mcr_application_option_count = 0;
const char *__MCC_main_mcr_runtime_options[] = { "" };
const int __MCC_main_mcr_runtime_option_count = 0;
#ifdef __cplusplus
}
#endif


