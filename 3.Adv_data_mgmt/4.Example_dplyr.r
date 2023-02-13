#parstencias SQL el siguiente grupo
install.packages("gsubfn")
install.packages("proto")
install.packages("sqldf")
install.packages("RSQLite")
install.packages("dplyr")

#despues de instalar llamar las librerias
library(proto)
library(gsubfn)
library(RSQLite)
library(sqldf)
library(dplyr)



con1<-sqldf("select tipo_de_requerimiento,fecha_de_creacion,Esfuerzo_Total2,Estado_RTC from DemandaRTC_05_sep_17_depu where tipo_de_requerimiento is not null")
#Convertiendolo a un data frame
df1<-as.data.frame(con1)
#generando un histograma de frecuencia para los requerimi segun el Tipo_de_Requerimiento
tt<-table(df1$Tipo_de_Requerimiento)

plot(tt, col="red")
#aunque se ve mejor
barplot(tt,las=2,col=rainbow(10))

#Si queremos un pie
pie(tt,las=2,col = rainbow(10))

#ahora convertimos a date a la fehc ade creacion
con1$Fecha_de_creacion<-as.Date(con1$Fecha_de_creacion,"%d/%m/%Y")
View(con1)
#creamos un nuevo campo DE ANALISIS el cual debe tener la forma AÑO-MES
con1$fecha<-format(as.Date(con1$fecha,format="%Y-%m-%d"),"%Y-%m")
View(con1)




#ver el tipo de dato de como imporó la columna esfuerzo
dfman<-subset(d1final_col_basi4,macroservicio=='MS10 - MANTENIMIENTO DE APLICACIONES')
View(dfman)
class(d1final_col_basi4$esfuerzo)


#Convertiendolo a un data frame
df1<-as.data.frame(d1final_col_basi2)
#generando un histograma de frecuencia Macroservicios
tt1<-table(df1$macroservicio)
barplot(tt1,las=2,col=rainbow(10))

#Si queremos un pie
pie(tt1,las=2,col = rainbow(10))





#GOOD EXAMPLE FOR LEARNIGN HOW TO MANAGE DATE WITH DATA SET
#TRABAJANDO CON EL SERVICIO DE MANTENIMIENTO SINCE MAY-15
#1. INCEPTION 
#creamos el dfman solo para req del macroservicio MS10 using Subset
dfman<-subset(d1_utf8,macroservicio=='MS10 - MANTENIMIENTO DE APLICACIONES')
View(dfman)


    #Now Turn "fecha_de_solicitud" into date
    dfman$fecha_de_solicitud<-as.Date(dfman$fecha_de_solicitud,"%d/%m/%Y")
    View(dfman)

#Creating new field "fecha" for Analysis  with the form "AÑO-MES"
dfman$fecha<-format(as.Date(dfman$fecha_de_solicitud,format="%Y-%m-%d"),"%Y-%m")
View(dfman)

#Extrating Since fech May-15 using subset
manfre<-subset(dfman,fecha>="2015-05") 
View(manfre)
#Another way is selction some colum using "select" from "dplyr" lilbrary
exam<-select(manfre,area,macroservicio,servicio_ti)
View(exam)
#FOr filtering we can use "Filter" from "dplyr" lilbrary
exam1<-filter(manfre,fecha>="2015-05")
View(exam1)
#finally dfman1
#Combine select and filter with "Pipes" from "dplyr" lilbrary
dfman1<-dfman %>% 
  filter(fecha>="2015-05") %>%
  select(canal,macroservicio,servicio_ti,tipo_de_atencion,subservicio,id_de_atencion,estado_req,urgencia_req,fecha_de_solicitud, fecha_inicio_atencion,fecha_de_entrega,fecha_fin_de_atencion,tiempo_de_atencion,esfuerzo, solicitado_por,area,sub_area,sistema_relacionado,tipo_de_proceso,proceso_relacionado,fecha)
View(dfman1)
#Also we can use "sqldf" from "sql" lilbrary
con2<-sqldf("select tipo_de_requerimiento,fecha_de_creacion from dfman where tipo_de_requerimiento is not null")


pipe1<-dfgeneral %>%
      filter(canal=="RTC")%>%
      select(canal, macroservicio,tipo_de_atencion)
      summarize()

pipe2<-dfgeneral%>%     
      group_by(criterio=macroservicio)%>%
      summarize(cantidad=n())%>%

pipe3<-dfgeneral%>%     
  group_by(criterio=macroservicio)%>%
  summarize(cantidad=n())%>%
  mutate(porcentaje=percent(cantidad/sum(cantidad)))
