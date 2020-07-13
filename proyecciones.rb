data = File.open('ventas_base.db').read.split(",")
data.map!{|x| x.to_i}

def metodo (arr, aumento, desde, hasta)
    filtered_arr = arr [desde..hasta]
    suma_total = arr.sum - filtered_arr.sum
    a = filtered_arr.sum.to_f * aumento
    a.to_f + suma_total
end

primero = metodo(data, 1.1, 0, 5)
segundo = metodo(data, 1.2, 6, 11)

first = primero.to_s
second = segundo.to_s

File.write('resultados.data', first + ("\n") + second)
