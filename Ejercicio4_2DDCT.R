#Actividad 4: 2DDCT
#
library("pacman") #esta función llama al paquete instalado
p_load("ggplot2", #para graficar
       "dplyr", #para facilitar el manejo de datos
       "vroom") #llamar repositorios

Datos_PCR <- vroom("https://raw.githubusercontent.com/ManuelLaraMVZ/resultados_PCR_practica/refs/heads/main/Genes.csv")

Datos_PCR

Gen_referencia <- Datos_PCR %>% 
  filter(Gen == "B-actina") %>% 
  select(-1)

Gen_referencia

Gen_interes <- Datos_PCR %>% 
  filter(Gen!= "B-actina") %>% 
  select(-1)
  
DCT <- Gen_interes %>% 
  mutate(DC1 = C1 - Gen_ref$C1,
         DC1 = C2 - Gen_ref$C2,
         DC1 = C3 - Gen_ref$C3,
         DC1 = C4 - Gen_ref$C4,
         DC1 = C5 - Gen_ref$C5,
         DC1 = C6 - Gen_ref$C6)
