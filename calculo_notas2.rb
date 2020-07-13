data = File.open('notas.data').readlines
data.map!{|line| line.split(",")}

def nota_mas_alta(grades)
    results = []
    grades.each do |student_max_grade|
        results.push([student_max_grade[0], student_max_grade.map {|num| num.to_i}.max])
    end
    return results
end

pp nota_mas_alta(data)