import viajes.*

class Socios {
	const property idiomas = #{}
	var actividadesRealizadas = []
	var property maximoActividad
	var cantidadActividad = 0
	var property edad
	
	
	method ActividadesRealizadas() = actividadesRealizadas
	method maximoActividad() = maximoActividad
	method realizarActividad(unaActividad){
		if (cantidadActividad >= maximoActividad){
			self.error("Limite alcanzado")
		}
		else{
			actividadesRealizadas.add(unaActividad)	
		}
	}
	method adoradorDelSol(){
		return actividadesRealizadas.all({a => a.paraBroncear()})
	}
	method actividadesEsforzadas(){
		return actividadesRealizadas.map({a => a.implicaEsfuerzo()})
	}
	method noRealizoActividad(unaActividad){
		return !actividadesRealizadas.contains(unaActividad)
	}
	method actividadRecomendada(unaActividad){
		return unaActividad.esActividadRecomendada(self) and self.noRealizoActividad(unaActividad)
	}
}
