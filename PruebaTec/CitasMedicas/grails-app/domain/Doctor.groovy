// grails-app/domain/CitasMedicas/Doctor.groovy
package CitasMedicas

class Doctor {
    String nombre
    String apellidoPaterno
    String apellidoMaterno
    String especialidad

    static hasMany = [citas: Cita]

    static constraints = {
        nombre(blank: false)
        apellidoPaterno(blank: false)
        apellidoMaterno(blank: false)
        especialidad(blank: false)
    }
}
