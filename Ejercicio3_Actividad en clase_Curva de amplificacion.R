install.packages("pacman") #es un paquete que llama a otros paquetes y si no está los instala

library("pacman") #esta función llama al paquete instalado
p_load("ggplot2", #para graficar
       "dplyr", #para facilitar el manejo de datos
       "vroom") #llamar repositorios

Datos_curva <- vroom(file="https://raw.githubusercontent.com/ManuelLaraMVZ/resultados_PCR_practica/refs/heads/main/Amplif_grupo1_17022025.csv")
#CTRL + SHIFT + M = %>% 

head(Datos_curva)
#c1
Curva_1 <- Datos_curva %>% #el nuevo objeto va a tener una asignacion a partir de la base de datos X
  select(Cycle,"C1")  
Curva_1

Grafica_curva <- ggplot(Curva_1,
                        mapping = aes(x=Cycle,
                                      y=C1))+
  geom_point()+
  geom_line(color="red",
            size=1.2)
  
Grafica_curva

Grafica_curva_2 <- Grafica_curva+
  labs(x="Ciclos", y="fluorescencia", title = "Ejercicio 3 R Studio: Yaniv Bar Yosef", subtitle = "Grafica 1", caption = "Ejercicio 3")+
  theme_classic()
Grafica_curva_2
