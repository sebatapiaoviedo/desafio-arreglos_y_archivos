#se abre el archivo 'ventas_base.db' quedando guardado en la variable original_data
original_data = open('ventas_base.db').read.split(',')
#se transforman los datos obtenidos a float y se guardan en la variable data
data = original_data.map { |data| data.to_f}
#se define el metodo con 4 argumentos, este hará los calculos de las proyecciones por mes
def proyections(ventas_base, augment, start_array, end_array)
  a = ventas_base.map.with_index do |sales, index|
    if index >= start_array && index <= end_array
      (sales * augment)
    else
      sales
    end
  end
  return a
end
#este metodo sumará las proyecciones
def sum_proyection(array)
  array.inject(0) { |acc, sale| acc + sale }
end
percent1 = 1.10 #aumento de proyecciones en un 10%
percent2 = 1.20 #aumento de proyecciones en un 20%
start_array1 = 0
end_array1 = 5
#este es el resultado de los 6 primeros meses
result1 = "%0.2f" % [sum_proyection(proyections(data, percent1, start_array1, end_array1).take(5))]
start_array2 = 6
end_array2 = 11
#este es el resultado de los ultimos 6 meses
result2 = "%0.2f" % [sum_proyection(proyections(data, percent2, start_array2, end_array2).drop(6))]
#acá escribimos los resultados en un nuevo archivo llamado 'resultados.data'
File.write('resultados.data', result1.to_s + ("\n"))
File.write('resultados.data', result2, mode: 'a')
#los print son opcionales, es solo para verificar en consola los resultados
print result1
puts
print result2