class Viajes {
	const idiomas = #{}
	var implicaEsfuerzo = true
	var paraBroncear = false
	var cantidadDias = 0
	
	method idiomas() = idiomas
	method agregarIdioma(unIdioma){
		idiomas.add(unIdioma)
	}
	method implicaEsfuerzo() = implicaEsfuerzo
	method paraBroncear() = paraBroncear
	method cantidadDias() = cantidadDias
	method duracion() {
		cantidadDias = 0
		}
	method llevaEsfuerzo() {
		implicaEsfuerzo = true
	}
	method tomaColor(){
		paraBroncear = true
	}
	method esInteresante(){
		return self.idiomas().size() >= 2 and self.condicionAdiccional()
	}
	method condicionAdiccional() = true	
	method esActividadRecomendada(unSocio){
		return self.esInteresante()
	}
}

class DePlaya inherits Viajes{
	var largoPlaya
	
	method largoPlaya() = largoPlaya
	override method llevaEsfuerzo() {
		implicaEsfuerzo = largoPlaya > 1200
	} 
	override method duracion() {
		cantidadDias = largoPlaya/500
		}
	
}

class DeCiudad inherits Viajes{
	const cantidadAtracciones
	
	method cantidadAtracciones() = cantidadAtracciones
	override method duracion(){
		cantidadDias = cantidadAtracciones / 2
	}
	override method llevaEsfuerzo() {
		implicaEsfuerzo = cantidadAtracciones.between(5,9)
	}
	override method tomaColor(){
		paraBroncear = false
	}
	override method condicionAdiccional() = cantidadAtracciones == 5
	
}


class CiudadTropical inherits DeCiudad{
	override method duracion(){
		super()
		cantidadDias += 1
	}
	override method tomaColor(){
		paraBroncear = true
	}
	
}

class Trekking inherits Viajes{
	var kmSenderos
	var diasDeSol
	
	method kmSenderos() = kmSenderos
	method diasDeSol() = diasDeSol
	
	override method duracion(){
		cantidadDias = kmSenderos / 50
	}
	override method tomaColor(){
		if ((diasDeSol > 200) or (diasDeSol.between(100,201) and kmSenderos > 120)){
			paraBroncear = true
		}
	}
	override method condicionAdiccional() = diasDeSol > 140
}

class ClaseGYM inherits Viajes{
	
	
	override method duracion(){
		cantidadDias = 1
	}
	override method tomaColor(){
		paraBroncear = false
	}
	override method esActividadRecomendada(unSocio){
		return unSocio.edad().between(20,30)
	}
}

class TallerLiterario inherits Viajes{
	const libros = #{}
	
	method libros() = libros
	method agregarLibro(unLibro){
		libros.add(unLibro)
	}
	override method llevaEsfuerzo() {
		implicaEsfuerzo = libros.between(5,9)
	}
	override method duracion(){
		cantidadDias = libros +1
	}
	override method tomaColor(){
		paraBroncear = false
	}
	override method esActividadRecomendada(unSocio){
		return unSocio.idiomas().size() > 1
	}
	
}

class Libro{
	const idioma
	const autor
	const paginas
	
	method idioma() = idioma
	method autor() = autor
	method paginas() = paginas
	
	
}