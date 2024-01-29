// grails-app/domain/CitasMedicas/Consultorio.groovy
package CitasMedicas

class Consultorio {
    int numero
    int piso

    static hasMany = [citas: Cita]

    static constraints = {
        numero(unique: true)
        piso(blank: false)
    }
}
