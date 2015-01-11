
# EXPLORATORY ANALYSIS DATA
# PROYECTO 1: Mediciones de consumo de energía electrica en un hogar en un periodo de casi 4 años
# variables:
    # Date: fecha en formato dd/mm/aaaa
    # Time: hora en formato hh:mm:ss
    # Global_active_power: promedio de minutos de potencia activa (kilovatios)
    # Global_reactive_power: promedio de minutos de potencia reactiva (kilovatios)
    # Voltage: minutos promedio de tensión (voltios)
    # Global_intensity: promedio de minutos en intensedad de corriente (amperios)
    # Sub_metering_1: energía activa (vatios/hora) correspondiente a electrodomesticos de la cocina
    # Sub_metering_2: energía activa (vatios/hora) correspondiente a lavadora + secador + nevera + luz
    # Sub_metering_3: energía activa (vatios/hora) correspondiente a calentador de agua electrico + aire acondicionado

household <- read.table(file = "household_power_consumption.txt", 
                        head = TRUE, sep = ";", dec = ",", na.strings="?", colClasses = c("date", "time", "numeric", "numeric", "numeric",
                        "numeric", "numeric", "numeric", "numeric"))

colnames(household)
household[1:10,]
# calculo del numero de observaciones del conjunto de datos
nrow(household)
# calculo del numero de variables
ncol(household)
# creamos un subconjunto de datos que esté comprendido entre las fechas de 
# 02/01/2007 y 02/02/2007
   # primero cambiamos el formato de fecha a la variable
household$Date <- as.Date(household$Date, format="%d/%m/%Y")
household2 <- subset(household, Date >= "2007-02-01" & Date <= "2007-02-02")
# pegamos en una misma variable 'Datetime' la fecha y la hora
Datetime <- paste(as.Date(household2$Date), household2$Time)
household2$Datetime <- as.POSIXct(Datetime)


# PLOT 1
hist(household2$Global_active_power, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frecuency")
  # se copia el dibujo a un fichero PNG
dev.copy(png, file = "PLOT1.png", width = 480, height = 480)  
dev.off()  # se cierra el fichero 
