message( '\tLectura de las colocaciones del BIESS' )

# Carga de datos -----------------------------------------------------------------------------------
load(paste0(parametros$RData, "BIESS_tablas_colocacion.RData"))

#Cargar función tíldes a latex----------------------------------------------------------------------
source( 'R/500_tildes_a_latex.R', encoding = 'UTF-8', echo = FALSE )

#1. Tabla colocación--------------------------------------------------------------------------------

xlsx::write.xlsx(tabla_colocacion_PH,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion.xlsx' ),
           sheetName = "PH", 
           col.names = TRUE,
           row.names = TRUE, 
           append = FALSE)

write.xlsx(tabla_colocacion_PQ,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion.xlsx' ),
           sheetName = "PQ", 
           col.names = TRUE,
           row.names = TRUE, 
           append = TRUE)


write.xlsx(tabla_colocacion_PP,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion.xlsx' ),
           sheetName = "PP", 
           col.names = TRUE,
           row.names = TRUE, 
           append = TRUE)

#2. Tabla colocación por fondo----------------------------------------------------------------------
write.xlsx(tabla_colocacion_PH_fondo,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion_fondo.xlsx' ),
           sheetName = "PH", 
           col.names = TRUE,
           row.names = TRUE, 
           append = FALSE)

write.xlsx(tabla_colocacion_PQ_fondo,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion_fondo.xlsx' ),
           sheetName = "PQ", 
           col.names = TRUE,
           row.names = TRUE, 
           append = TRUE)

write.xlsx(tabla_colocacion_PP_fondo,
           file = paste0( parametros$resultado_seguro , 'tablas_colocacion_fondo.xlsx' ),
           sheetName = "PP", 
           col.names = TRUE,
           row.names = TRUE, 
           append = TRUE)
#---------------------------------------------------------------------------------------------------
message( paste( rep('-', 100 ), collapse = '' ) )
rm( list = ls()[ !( ls() %in% c( 'parametros' ) ) ] )
gc()