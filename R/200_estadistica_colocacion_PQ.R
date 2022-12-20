message( paste( rep('-', 100 ), collapse = '' ) )
message( '\tAnalisis de la colocación' )

# Lectura datos BIESS-------------------------------------------------------------------------------
load( paste0( parametros$RData, 'BIESS_concesiones_2021_2022.RData' ) )

#Tablas colocación mensual enero 2021 a agosto de 2022
#Colocación mensual de los Quirografarios-----------------------------------------------------------
base <- rbind( conceciones, conceciones_2021) %>%
  mutate( anio = year( fecha_concesion ),
          mes = month( fecha_concesion ),
          tasa_nominal = tasa_nominal / 100,
          tasa_efectiva = ((1+tasa_nominal/12)^12)-1,
          plazo = as.integer( plazo )) %>%
  dplyr::select( anio,
                 mes,
                 cedula,
                 id_operacion,
                 valor_operacion,
                 tasa_nominal,
                 tasa_efectiva,
                 plazo,
                 tipo_credito,
                 fondo )

tabla_colocacion_PQ <- base %>% 
  filter( tipo_credito == "Q" ) %>%
  group_by( anio, mes ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio ) %>%
  arrange( anio, mes)


tabla_colocacion_PQ_fondo <- base %>% 
  filter( tipo_credito == "Q" ) %>%
  group_by( anio, mes, fondo ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion
  ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 fondo,
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio) %>%
  arrange( fondo, anio, mes)



#Colocación mensual de los Hipotecarios-------------------------------------------------------------

tabla_colocacion_PH <- base %>% 
  filter( tipo_credito == "H" ) %>%
  group_by( anio, mes ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio ) %>%
  arrange( anio, mes)


tabla_colocacion_PH_fondo <- base %>% 
  filter( tipo_credito == "H" ) %>%
  group_by( anio, mes, fondo ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion
  ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 fondo,
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio) %>%
  arrange( fondo, anio, mes)


#Colocación mensual de los Prendarios---------------------------------------------------------------

tabla_colocacion_PP <- base %>% 
  filter( tipo_credito == "P" ) %>%
  group_by( anio, mes ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio ) %>%
  arrange( anio, mes)


tabla_colocacion_PP_fondo <- base %>% 
  filter( tipo_credito == "P" ) %>%
  group_by( anio, mes, fondo ) %>%
  mutate( colocacion = sum(valor_operacion, na.rm = TRUE ),
          operaciones = n(),
          monto_promedio = mean( valor_operacion, na.rm = TRUE ),
          plazo_promedio = sum(valor_operacion * plazo ) / colocacion,
          tasa_efectiva_promedio = sum( valor_operacion * tasa_efectiva, na.rm = TRUE ) / colocacion,
          tasa_nominal_promedio = sum( valor_operacion * tasa_nominal, na.rm = TRUE ) / colocacion
  ) %>%
  ungroup() %>%
  distinct(anio, mes,.keep_all = TRUE) %>%
  dplyr::select( anio,
                 mes, 
                 fondo,
                 operaciones,
                 colocacion,
                 monto_promedio,
                 plazo_promedio,
                 tasa_nominal_promedio,
                 tasa_efectiva_promedio) %>%
  arrange( fondo, anio, mes)
# Guarda resultados---------------------------------------------------------------------------------
lista <- c("tabla_colocacion_PQ","tabla_colocacion_PH", "tabla_colocacion_PP",
           "tabla_colocacion_PQ_fondo", "tabla_colocacion_PH_fondo", "tabla_colocacion_PP_fondo"
           )
save( list =  lista,
      file = paste0( parametros$RData, 'BIESS_tablas_colocacion.RData' ) )
message( paste( rep('-', 100 ), collapse = '' ) )
rm( list = ls()[ !( ls() %in% c( 'parametros' ) ) ] )
gc() 


